import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pickaboo/domain/repository/user_profile_repository.dart';

part 'address_event.dart';
part 'address_state.dart';
part 'address_bloc.freezed.dart';

@injectable
class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final UserProfileRepository _repository;

  AddressBloc(this._repository) : super(AddressState.initial()) {
    on<_LoadCities>((event, emit) => _onLoadCities(event.division, emit));
    on<_LoadAreas>((event, emit) => _onLoadAreas(event.city, emit));
  }

  Future<void> _onLoadCities(
    String division,
    Emitter<AddressState> emit,
  ) async {

    emit(state.copyWith(isLoadingCities: true, error: null));

    final result = await _repository.getCities(division);
    result.fold(
      (l) {
        emit(state.copyWith(isLoadingCities: false, error: l.message));
      },
      (cities) {
        emit(
          state.copyWith(
            isLoadingCities: false,
            cities: cities.cast<Map<String, dynamic>>(),
          ),
        );
      },
    );
  }

  Future<void> _onLoadAreas(String city, Emitter<AddressState> emit) async {

    emit(state.copyWith(isLoadingAreas: true, error: null));

    final result = await _repository.getAreas(city);
    result.fold(
      (l) {
        emit(state.copyWith(isLoadingAreas: false, error: l.message));
      },
      (areas) {
        emit(
          state.copyWith(
            isLoadingAreas: false,
            areas: areas.cast<Map<String, dynamic>>(),
          ),
        );
      },
    );
  }
}
