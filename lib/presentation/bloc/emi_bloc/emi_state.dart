part of 'emi_bloc.dart';

@freezed
class EmiState with _$EmiState {
  const factory EmiState.initial() = _Initial;
  const factory EmiState.loading() = _Loading;
  const factory EmiState.loaded(List<EmiEntity> emiOptions) = _Loaded;
  const factory EmiState.error(AppErrorEntity error) = _Error;
}
