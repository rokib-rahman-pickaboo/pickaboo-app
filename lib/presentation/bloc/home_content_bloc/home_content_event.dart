part of 'home_content_bloc.dart';

@freezed
class HomeContentEvent with _$HomeContentEvent {
  const factory HomeContentEvent.getFeedContent({
    @Default(false) bool forceRefresh,
  }) = _GetFeedContent;
  const factory HomeContentEvent.refresh() = _Refresh;
}
