import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/utils/product_image_resolver.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/entity/related_product/related_product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'related_products_event.dart';
part 'related_products_state.dart';
part 'related_products_bloc.freezed.dart';

@injectable
class RelatedProductsBloc extends Bloc<RelatedProductsEvent, RelatedProductsState> {
  final ProductRepository repository;

  RelatedProductsBloc(this.repository) : super(const RelatedProductsState.initial()) {
    on<_Load>(_onLoad);
  }

  Future<void> _onLoad(_Load event, Emitter<RelatedProductsState> emit) async {
    emit(const RelatedProductsState.loading());

    final result = await repository.getRelatedProducts(slug: event.slug);

    await result.fold(
      (error) async => emit(RelatedProductsState.error(error)),
      (relatedProducts) async {
        // 1. Immediately hydrate with cached images if available
        final initialList = relatedProducts.relatedProducts.map((p) {
          final pid = int.tryParse(p.id) ?? 0;
          if (ProductImageResolver.isPlaceholderOrBroken(p.productImg)) {
            final cachedImg = ProductImageResolver.getCachedImage(pid);
            if (cachedImg != null) {
              return p.copyWith(productImg: cachedImg);
            }
          } else {
            ProductImageResolver.cacheImage(pid, p.productImg);
          }
          return p;
        }).toList();

        emit(RelatedProductsState.loaded(
          relatedProducts.copyWith(relatedProducts: initialList),
        ));

        // 2. Enrich from local memory & Hive cache without network spam
        final itemsToEnrich = List<ProductEntity>.from(initialList);
        final zeroPriceIndices = <int>[];
        bool hasCacheEnrichment = false;

        for (var i = 0; i < itemsToEnrich.length; i++) {
          final p = itemsToEnrich[i];
          final pid = int.tryParse(p.id) ?? 0;

          // Check if memory image cache has a better image
          if (ProductImageResolver.isPlaceholderOrBroken(p.productImg)) {
            final cachedImg = ProductImageResolver.getCachedImage(pid);
            if (cachedImg != null) {
              itemsToEnrich[i] = p.copyWith(productImg: cachedImg);
              hasCacheEnrichment = true;
            }
          }

          // Flag for network price resolution only if price is truly missing (<= 0)
          if (p.finalPrice <= 0 && p.id.isNotEmpty) {
            zeroPriceIndices.add(i);
            if (zeroPriceIndices.length >= 4) break;
          }
        }

        // If local memory cache updated any images, emit immediately
        if (hasCacheEnrichment && !isClosed) {
          emit(RelatedProductsState.loaded(
            relatedProducts.copyWith(
              relatedProducts: List<ProductEntity>.from(itemsToEnrich),
            ),
          ));
        }

        // Only fire network calls for products with missing prices (<= 0)
        if (zeroPriceIndices.isNotEmpty) {
          await Future.wait(
            zeroPriceIndices.map((idx) async {
              final p = itemsToEnrich[idx];
              final pid = int.tryParse(p.id) ?? 0;

              // Check local Hive cache first before firing a network request
              final cachedResult = await repository.getSavedProductDetail(productId: p.id);
              ProductDetailEntity? detail = cachedResult.fold((_) => null, (d) => d);

              if (detail == null) {
                final detailResult = await repository.getProductDetail(
                  productId: p.id,
                  cache: false,
                );
                detail = detailResult.fold((_) => null, (d) => d);
              }

              if (detail != null) {
                int regular = detail.regularPrice;
                int special = detail.spacialPrice;
                int discount = detail.discount;

                if (regular <= 0 && detail.varient.isNotEmpty) {
                  for (final v in detail.varient) {
                    for (final opt in v.options) {
                      final cp = opt.configurableProduct;
                      if (cp != null && cp.productPrice > 0) {
                        regular = cp.productPrice;
                        if (cp.productSpecialPrice > 0) {
                          special = cp.productSpecialPrice;
                        }
                        if (cp.productDiscount > 0) {
                          discount = cp.productDiscount;
                        }
                        break;
                      }
                    }
                    if (regular > 0) break;
                  }
                }

                String? resolvedImg;
                if (detail.images.isNotEmpty) {
                  final validImg = detail.images.firstWhereOrNull(
                    (img) => !ProductImageResolver.isPlaceholderOrBroken(img),
                  );
                  if (validImg != null) {
                    resolvedImg = validImg;
                    ProductImageResolver.cacheImage(pid, validImg);
                  }
                }

                itemsToEnrich[idx] = p.copyWith(
                  productPrice: regular > 0 ? regular : p.productPrice,
                  productSpecialPrice:
                      regular > 0 ? special : p.productSpecialPrice,
                  productDiscount:
                      regular > 0 ? discount : p.productDiscount,
                  productImg: resolvedImg ?? p.productImg,
                );
              }
            }),
          );

          if (!isClosed) {
            emit(RelatedProductsState.loaded(
              relatedProducts.copyWith(
                relatedProducts: List<ProductEntity>.from(itemsToEnrich),
              ),
            ));
          }
        }
      },
    );
  }
}
