import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/product_flash_sale/product_flash_sale_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'product_flash_sale_event.dart';
part 'product_flash_sale_state.dart';
part 'product_flash_sale_bloc.freezed.dart';

@injectable
class ProductFlashSaleBloc extends Bloc<ProductFlashSaleEvent, ProductFlashSaleState> {
  final ProductRepository repository;

  ProductFlashSaleBloc(this.repository) : super(const ProductFlashSaleState()) {
    on<ProductFlashSaleEvent>((event, emit) async {
      await event.map(
        fetch: (req) async {
          emit(state.copyWith(status: ProductFlashSaleStatus.loading));

          try {
            final result = await repository
                .getProductFlashSale(slug: req.slug)
                .timeout(const Duration(seconds: 4));
            result.fold(
              (l) => emit(
                state.copyWith(error: l, status: ProductFlashSaleStatus.error),
              ),
              (r) => emit(
                state.copyWith(
                  status: ProductFlashSaleStatus.success,
                  flashSale: r,
                ),
              ),
            );
          } catch (_) {
            emit(
              state.copyWith(
                status: ProductFlashSaleStatus.success,
                flashSale: const ProductFlashSaleEntity(inFlashSale: false),
              ),
            );
          }
        },
      );
    });
  }
}
