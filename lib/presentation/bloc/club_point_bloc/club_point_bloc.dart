import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/repository/club_point_repository.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_event.dart';
import 'package:pickaboo/presentation/bloc/club_point_bloc/club_point_state.dart';

@injectable
class ClubPointBloc extends Bloc<ClubPointEvent, ClubPointState> {
  final ClubPointRepository _repository;

  ClubPointBloc(this._repository) : super(const ClubPointState.initial()) {
    on<ClubPointEvent>((event, emit) async {
      await event.map(
        getClubPoints: (e) async => _onGetClubPoints(e.page, e.limit, emit),
      );
    });
  }

  Future<void> _onGetClubPoints(
    int page,
    int limit,
    Emitter<ClubPointState> emit,
  ) async {
    emit(const ClubPointState.loading());
    final result = await _repository.getClubPoints(page: page, limit: limit);
    result.fold(
      (error) => emit(ClubPointState.error(error.message)),
      (data) => emit(ClubPointState.loaded(data)),
    );
  }
}
