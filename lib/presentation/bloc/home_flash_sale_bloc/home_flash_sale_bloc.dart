import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/home_flash_sale/home_flash_sale_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'home_flash_sale_event.dart';
part 'home_flash_sale_state.dart';
part 'home_flash_sale_bloc.freezed.dart';

@injectable
class HomeFlashSaleBloc extends Bloc<HomeFlashSaleEvent, HomeFlashSaleState> {
  final ProductRepository repository;

  HomeFlashSaleBloc(this.repository) : super(const HomeFlashSaleState()) {
    on<HomeFlashSaleEvent>((event, emit) async {
      await event.map(
        fetch: (_) async {
          emit(state.copyWith(status: HomeFlashSaleStatus.loading));

          final result = await repository.getHomeFlashSale();
          result.fold(
            (l) {
              log('HomeFlashSaleBloc Error: ${l.message}', name: 'FlashSale');
              emit(
                state.copyWith(error: l, status: HomeFlashSaleStatus.error),
              );
            },
            (r) {
              log('HomeFlashSaleBloc API Success! Banners count: ${r.banners.length}, Category name: ${r.category.name}', name: 'FlashSale');
              emit(
                state.copyWith(
                  status: HomeFlashSaleStatus.success,
                  flashSale: r,
                ),
              );
            },
          );
        },
      );
    });
  }
}
