import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/network_info/network_info.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';
import 'package:pickaboo/domain/repository/place_picker_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';
part 'autocomplete_bloc.freezed.dart';

@injectable
class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacePickerRepository _repository;
  final NetworkInfo _networkInfo;

  AutocompleteBloc(this._repository, this._networkInfo)
      : super(const AutocompleteState()) {
    on<_Fetch>(_onFetch, transformer: restartable());

    on<_Clear>((_, emit) {
      emit(const AutocompleteState());
    });
  }

  Future<void> _onFetch(
    _Fetch event,
    Emitter<AutocompleteState> emit,
  ) async {
    final query = event.q.trim();
    if (query.isEmpty) {
      emit(const AutocompleteState());
      return;
    }

    emit(state.copyWith(status: AutocompleteStatus.loading));

    final online = await _networkInfo.isConnected;
    if (!online) {
      emit(state.copyWith(
        status: AutocompleteStatus.error,
        error: const AppErrorEntity(message: 'No internet connection'),
      ));
      return;
    }

    try {
      final result = await _repository.autocomplete(query: query);

      result.fold(
        (error) => emit(state.copyWith(
          status: AutocompleteStatus.error,
          error: error,
        )),
        (suggestions) => emit(state.copyWith(
          status: AutocompleteStatus.success,
          suggestions: suggestions,
        )),
      );
    } catch (e) {
      emit(state.copyWith(
        status: AutocompleteStatus.error,
        error: AppErrorEntity(message: e.toString()),
      ));
    }
  }
}
