part of 'popup_bloc.dart';

enum PopupStatus { initial, loading, success, error }

@freezed
class PopupState with _$PopupState {
  const factory PopupState({
    @Default(PopupStatus.initial) PopupStatus status,
    AppErrorEntity? error,
    PopupEntity? popup,
    @Default('') String linkType,
    @Default('') String link,
    @Default('') String name,
    @Default('') String imageUrl,
  }) = _PopupState;
}
