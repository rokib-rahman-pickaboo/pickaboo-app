import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/domain/entity/club_point/club_point_entity.dart';

part 'club_point_state.freezed.dart';

@freezed
class ClubPointState with _$ClubPointState {
  const factory ClubPointState.initial() = _Initial;
  const factory ClubPointState.loading() = _Loading;
  const factory ClubPointState.loaded(ClubPointEntity clubPointData) = _Loaded;
  const factory ClubPointState.error(String message) = _Error;
}
