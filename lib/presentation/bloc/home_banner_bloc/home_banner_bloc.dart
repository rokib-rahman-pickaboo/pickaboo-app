import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/home_banner/home_banner_entity.dart';
import 'package:pickaboo/domain/repository/home_banner_repository.dart';

part 'home_banner_event.dart';
part 'home_banner_state.dart';
part 'home_banner_bloc.freezed.dart';

@injectable
class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  final HomeBannerRepository repository;

  HomeBannerBloc(this.repository) : super(const HomeBannerState()) {
    on<HomeBannerEvent>((event, emit) async {
      await event.map(
        load: (_) async {
          emit(state.copyWith(status: HomeBannerStatus.loading));

          final result = await repository.getHomeBanners();
          result.fold(
            (l) => emit(
              state.copyWith(status: HomeBannerStatus.error, error: l),
            ),
            (r) => emit(
              state.copyWith(status: HomeBannerStatus.loaded, banners: r),
            ),
          );
        },
      );
    }, transformer: droppable());
  }
}
