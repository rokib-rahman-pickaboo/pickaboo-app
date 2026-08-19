import 'package:image_picker/image_picker.dart';
export 'package:image_picker/image_picker.dart' show XFile;

abstract class PhotoPickerService {
  Future<XFile?> pickFromCamera({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  });

  Future<XFile?> pickFromGallery({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  });

  Future<List<XFile>> pickMultiFromGallery({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  });
}
