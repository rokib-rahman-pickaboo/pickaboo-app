part of 'home_flash_sale_bloc.dart';

enum HomeFlashSaleStatus { initial, loading, success, error }

@freezed
class HomeFlashSaleState with _$HomeFlashSaleState {
  const factory HomeFlashSaleState({
    @Default(HomeFlashSaleStatus.initial) HomeFlashSaleStatus status,
    AppErrorEntity? error,
    HomeFlashSaleEntity? flashSale,
  }) = _HomeFlashSaleState;
}
