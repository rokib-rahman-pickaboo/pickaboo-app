part of 'compare_bloc.dart';

@freezed
class CompareState with _$CompareState {
  const factory CompareState.initial({
    @Default([]) List<ProductDetailEntity> products,
  }) = _Initial;
  
  const factory CompareState.loading({
    @Default([]) List<ProductDetailEntity> products,
  }) = _Loading;

  const factory CompareState.updated({
    required List<ProductDetailEntity> products,
  }) = _Updated;
  
  const factory CompareState.comparing({
    required List<ProductDetailEntity> products,
  }) = _Comparing;
  
  const factory CompareState.error({
    required AppErrorEntity error,
    required List<ProductDetailEntity> products,
  }) = _Error;
}
