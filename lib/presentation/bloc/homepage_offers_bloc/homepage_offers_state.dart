part of 'homepage_offers_bloc.dart';

enum HomepageOffersStatus { initial, loading, loaded, error }

@freezed
class HomepageOffersState with _$HomepageOffersState {
  const factory HomepageOffersState({
    @Default(HomepageOffersStatus.initial) HomepageOffersStatus status,
    AppErrorEntity? error,
    HomepageOffersEntity? offers,
  }) = _HomepageOffersState;
}
