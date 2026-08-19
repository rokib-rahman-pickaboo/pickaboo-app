// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pickaboo/data/photo_picker_service/photo_picker_service.dart';

part 'photo_picker_state.freezed.dart';
part 'photo_picker_state.g.dart';

enum PhotoPickerStatus { initial, loading, success, empty, error, clear }

@freezed
class PhotoPickerState with _$PhotoPickerState {
  const factory PhotoPickerState({
    @Default(PhotoPickerStatus.initial) PhotoPickerStatus status,
    @JsonKey(includeFromJson: false, includeToJson: false) List<XFile>? images,
    String? errorMessage,
  }) = _PhotoPickerState;

  factory PhotoPickerState.fromJson(Map<String, dynamic> json) =>
      _$PhotoPickerStateFromJson(json);
}
