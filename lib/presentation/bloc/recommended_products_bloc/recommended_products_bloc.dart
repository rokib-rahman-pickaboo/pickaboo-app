import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/recommended_product/recommended_product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'recommended_products_event.dart';
part 'recommended_products_state.dart';
part 'recommended_products_bloc.freezed.dart';

@injectable
class RecommendedProductsBloc extends Bloc<RecommendedProductsEvent, RecommendedProductsState> {
  final ProductRepository repository;

  RecommendedProductsBloc(this.repository) : super(const RecommendedProductsState.initial()) {
    on<_Load>(_onLoad);
  }

  Future<void> _onLoad(_Load event, Emitter<RecommendedProductsState> emit) async {
    emit(const RecommendedProductsState.loading());

    final result = await repository.getRecommendedProducts(slug: event.slug);

    await result.fold(
      (error) async => emit(RecommendedProductsState.error(error)),
      (recommendedProducts) async {
        emit(RecommendedProductsState.loaded(recommendedProducts));

        final hasZeroPrice = recommendedProducts.sellerRecommendedProducts.any(
          (p) => p.finalPrice <= 0 && p.id.isNotEmpty,
        );

        if (hasZeroPrice) {
          final updatedList = await Future.wait(
            recommendedProducts.sellerRecommendedProducts.map((p) async {
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
            emit(RecommendedProductsState.loaded(
              recommendedProducts.copyWith(
                sellerRecommendedProducts: updatedList,
              ),
            ));
          }
        }
      },
    );
  }
}
