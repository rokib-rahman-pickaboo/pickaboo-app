import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/core/monitoring/crash_reporter.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/home_content/home_content_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'home_content_event.dart';
part 'home_content_state.dart';
part 'home_content_bloc.freezed.dart';

@injectable
class HomeContentBloc extends Bloc<HomeContentEvent, HomeContentState> {
  final ProductRepository repository;

  HomeContentBloc(this.repository) : super(const HomeContentState()) {
    on<HomeContentEvent>((event, emit) async {
      await event.map(
        getFeedContent: (req) async {
          emit(state.copyWith(status: HomeContentStatus.loading));

          // Anything thrown below (cache decode, mapper, …) would otherwise
          // leave the state on `loading` forever — the page renders a spinner
          // for that status, so a single throw meant a permanently loading
          // home screen with no retry affordance.
          try {
            final result = await repository.getHomeFeedContent(
              productLimit: 5,
              forceRefresh: req.forceRefresh,
            );
            result.fold(
              (l) => emit(
                state.copyWith(error: l, status: HomeContentStatus.error),
              ),
              (r) => emit(
                state.copyWith(status: HomeContentStatus.success, homeFeed: r),
              ),
            );
          } catch (e, s) {
            CrashReporter.record(e, s);
            emit(
              state.copyWith(
                status: HomeContentStatus.error,
                error: AppErrorEntity(message: e.toString()),
              ),
            );
          }
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: HomeContentStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const HomeContentEvent.getFeedContent());
        },
      );
    });
  }
}
