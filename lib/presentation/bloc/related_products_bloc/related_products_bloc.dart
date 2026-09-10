import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
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
        emit(RelatedProductsState.loaded(relatedProducts));

        final hasZeroPrice = relatedProducts.relatedProducts.any(
          (p) => p.finalPrice <= 0 && p.id.isNotEmpty,
        );

        if (hasZeroPrice) {
          final updatedList = await Future.wait(
            relatedProducts.relatedProducts.map((p) async {
              if (p.finalPrice <= 0 && p.id.isNotEmpty) {
                final detailResult =
                    await repository.getProductDetail(productId: p.id);
                return detailResult.fold(
                  (_) => p,
                  (detail) {
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

                    if (regular > 0) {
                      return p.copyWith(
                        productPrice: regular,
                        productSpecialPrice: special,
                        productDiscount: discount,
                      );
                    }
                    return p;
                  },
                );
              }
              return p;
            }),
          );

          if (!isClosed) {
            emit(RelatedProductsState.loaded(
              relatedProducts.copyWith(
                relatedProducts: updatedList,
              ),
            ));
          }
        }
      },
    );
  }
}
