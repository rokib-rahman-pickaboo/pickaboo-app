part of 'compare_bloc.dart';

@freezed
class CompareEvent with _$CompareEvent {
  const factory CompareEvent.load() = _Load;
  const factory CompareEvent.add({required ProductDetailEntity product}) = _Add;
  const factory CompareEvent.remove({required String productId}) = _Remove;
  const factory CompareEvent.clear() = _Clear;
  const factory CompareEvent.compare() = _Compare;
}
