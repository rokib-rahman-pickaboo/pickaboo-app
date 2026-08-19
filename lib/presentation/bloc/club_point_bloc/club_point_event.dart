import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_point_event.freezed.dart';

@freezed
class ClubPointEvent with _$ClubPointEvent {
  const factory ClubPointEvent.getClubPoints({
    @Default(5) int limit,
    @Default(1) int page,
  }) = _GetClubPoints;
}
