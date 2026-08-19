import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/domain/repository/place_picker_repository.dart';

part 'place_picker_event.dart';
part 'place_picker_state.dart';
part 'place_picker_bloc.freezed.dart';

@injectable
class PlacePickerBloc extends Bloc<PlacePickerEvent, PlacePickerState> {
  final PlacePickerRepository _repository;

  PlacePickerBloc(this._repository) : super(const PlacePickerState()) {
    on<_Search>(
      _onSearch,
      transformer: restartable(),
    );

    on<_ReverseGeocode>(
      _onReverseGeocode,
      transformer: droppable(),
    );

    on<_ClearSuggestions>((_, emit) {
      emit(state.copyWith(suggestions: []));
    });

    on<_ClearSelectedPlace>((_, emit) {
      emit(state.copyWith(selectedPlace: null));
    });
  }

  Future<void> _onSearch(_Search event, Emitter<PlacePickerState> emit) async {
    final query = event.query.trim();
    if (query.isEmpty) {
      emit(state.copyWith(suggestions: [], status: PlacePickerStatus.initial));
      return;
    }

    emit(state.copyWith(status: PlacePickerStatus.searching));

    final result = await _repository.autocomplete(query: query);

    result.fold(
      (error) {
        if (kDebugMode) print('❌ [PlacePickerBloc] search error: ${error.message}');
        emit(state.copyWith(status: PlacePickerStatus.error, error: error));
      },
      (suggestions) {
        if (kDebugMode) print('✅ [PlacePickerBloc] search: ${suggestions.length} results');
        emit(state.copyWith(
          status: PlacePickerStatus.success,
          suggestions: suggestions,
        ));
      },
    );
  }

  Future<void> _onReverseGeocode(
    _ReverseGeocode event,
    Emitter<PlacePickerState> emit,
  ) async {
    emit(state.copyWith(status: PlacePickerStatus.reverseGeocoding));

    final result = await _repository.reverseGeocode(
      latitude: event.latitude,
      longitude: event.longitude,
    );

    result.fold(
      (error) {
        if (kDebugMode) print('❌ [PlacePickerBloc] reverseGeocode error: ${error.message}');
        emit(state.copyWith(status: PlacePickerStatus.error, error: error));
      },
      (place) {
        if (kDebugMode) print('✅ [PlacePickerBloc] reverseGeocode: ${place.address}');
        emit(state.copyWith(
          status: PlacePickerStatus.success,
          selectedPlace: place,
          suggestions: [],
        ));
      },
    );
  }
}
