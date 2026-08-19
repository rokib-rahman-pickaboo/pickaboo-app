import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/homepage_offers/homepage_offers_entity.dart';
import 'package:pickaboo/domain/repository/homepage_offers_repository.dart';

part 'homepage_offers_event.dart';
part 'homepage_offers_state.dart';
part 'homepage_offers_bloc.freezed.dart';

@injectable
class HomepageOffersBloc
    extends Bloc<HomepageOffersEvent, HomepageOffersState> {
  final HomepageOffersRepository repository;

  HomepageOffersBloc(this.repository)
      : super(const HomepageOffersState()) {
    on<HomepageOffersEvent>((event, emit) async {
      await event.map(
        load: (_) async {
          emit(state.copyWith(status: HomepageOffersStatus.loading));

          final result = await repository.getHomepageOffers();
          result.fold(
            (l) => emit(
              state.copyWith(status: HomepageOffersStatus.error, error: l),
            ),
            (r) => emit(
              state.copyWith(status: HomepageOffersStatus.loaded, offers: r),
            ),
          );
        },
      );
    }, transformer: droppable());
  }
}
