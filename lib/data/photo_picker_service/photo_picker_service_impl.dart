import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/photo_picker_service/photo_picker_service.dart';

@LazySingleton(as: PhotoPickerService)
class PhotoPickerServiceImpl implements PhotoPickerService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<XFile?> pickFromCamera({
    int? imageQuality = 80,
    double? maxWidth = 1280,
    double? maxHeight = 1280,
  }) async {
    return await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      requestFullMetadata: false,
    );
  }

  @override
  Future<XFile?> pickFromGallery({
    int? imageQuality = 80,
    double? maxWidth = 1280,
    double? maxHeight = 1280,
  }) async {
    return await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      requestFullMetadata: false,
    );
  }

  @override
  Future<List<XFile>> pickMultiFromGallery({
    int? imageQuality = 80,
    double? maxWidth = 1280,
    double? maxHeight = 1280,
  }) async {
    final pickedFiles = await _picker.pickMultiImage(
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      requestFullMetadata: false,
    );
    return pickedFiles;
  }
}
