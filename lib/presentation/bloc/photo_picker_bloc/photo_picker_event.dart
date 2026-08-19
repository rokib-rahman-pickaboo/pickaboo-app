import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_picker_event.freezed.dart';

@freezed
class PhotoPickerEvent with _$PhotoPickerEvent {
  const factory PhotoPickerEvent.pickFromCamera({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) = PickFromCamera;

  const factory PhotoPickerEvent.pickFromGallery({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) = PickFromGallery;

  const factory PhotoPickerEvent.clear() = Clear;

  const factory PhotoPickerEvent.removeImageAtIndex(int index) =
      RemoveImageAtIndex;
}
