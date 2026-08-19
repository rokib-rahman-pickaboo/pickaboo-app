import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/photo_picker_service/photo_picker_service.dart';

import 'photo_picker_event.dart';
import 'photo_picker_state.dart';

@injectable
class PhotoPickerBloc extends Bloc<PhotoPickerEvent, PhotoPickerState> {
  final PhotoPickerService _service;

  PhotoPickerBloc(this._service) : super(const PhotoPickerState()) {
    on<PickFromCamera>(_onPickFromCamera);
    on<PickFromGallery>(_onPickFromGallery);
    on<Clear>(_onClear);
    on<RemoveImageAtIndex>(_onRemoveImageAtIndex);
  }

  Future<void> _onClear(Clear event, Emitter<PhotoPickerState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (emit.isDone) return;

    emit(state.copyWith(images: const [], status: PhotoPickerStatus.clear));
  }

  Future<void> _onRemoveImageAtIndex(
    RemoveImageAtIndex event,
    Emitter<PhotoPickerState> emit,
  ) async {
    final current = [...?state.images];
    if (event.index >= 0 && event.index < current.length) {
      current.removeAt(event.index);
      emit(
        state.copyWith(
          images: current,
          status: current.isEmpty
              ? PhotoPickerStatus.empty
              : PhotoPickerStatus.success,
        ),
      );
    }
  }

  Future<void> _onPickFromCamera(
    PickFromCamera event,
    Emitter<PhotoPickerState> emit,
  ) async {
    emit(state.copyWith(status: PhotoPickerStatus.loading));
    try {
      final image = await _service.pickFromCamera(
        imageQuality: event.imageQuality,
        maxWidth: event.maxWidth,
        maxHeight: event.maxHeight,
      );
      if (image != null) {
        emit(
          state.copyWith(
            status: PhotoPickerStatus.success,
            images: [...?state.images, image],
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: (state.images ?? []).isEmpty
                ? PhotoPickerStatus.empty
                : PhotoPickerStatus.success,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: PhotoPickerStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onPickFromGallery(
    PickFromGallery event,
    Emitter<PhotoPickerState> emit,
  ) async {
    emit(state.copyWith(status: PhotoPickerStatus.loading));
    try {
      final images = await _service.pickMultiFromGallery(
        imageQuality: event.imageQuality,
        maxWidth: event.maxWidth,
        maxHeight: event.maxHeight,
      );
      if (images.isNotEmpty) {
        emit(
          state.copyWith(
            status: PhotoPickerStatus.success,
            images: [...?state.images, ...images],
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: (state.images ?? []).isEmpty
                ? PhotoPickerStatus.empty
                : PhotoPickerStatus.success,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: PhotoPickerStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
