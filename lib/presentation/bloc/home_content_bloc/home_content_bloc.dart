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
          // 1. Instant Frame 0 hydration from cache if not already in state
          if (state.homeFeed == null && !req.forceRefresh) {
            final cachedResult = await repository.getHomeFeedContent(
              productLimit: 5,
              forceRefresh: false,
            );
            cachedResult.fold((_) {}, (cachedFeed) {
              emit(state.copyWith(
                status: HomeContentStatus.success,
                homeFeed: cachedFeed,
              ));
            });
          }

          // 2. Determine if network revalidation is required
          final isStale = await repository.isHomeContentStale();
          final needsNetwork =
              req.forceRefresh || state.homeFeed == null || isStale;

          if (!needsNetwork) return;

          // Only show full loading spinner if no content is currently visible
          if (state.homeFeed == null) {
            emit(state.copyWith(status: HomeContentStatus.loading));
          }

          try {
            final result = await repository.getHomeFeedContent(
              productLimit: 5,
              forceRefresh: true,
            );
            result.fold(
              (l) {
                // If content is already displaying, don't flash an error screen
                if (state.homeFeed == null) {
                  emit(
                    state.copyWith(error: l, status: HomeContentStatus.error),
                  );
                }
              },
              (r) => emit(
                state.copyWith(status: HomeContentStatus.success, homeFeed: r),
              ),
            );
          } catch (e, s) {
            CrashReporter.record(e, s);
            if (state.homeFeed == null) {
              emit(
                state.copyWith(
                  status: HomeContentStatus.error,
                  error: AppErrorEntity(message: e.toString()),
                ),
              );
            }
          }
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: HomeContentStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const HomeContentEvent.getFeedContent(forceRefresh: true));
        },
      );
    });
  }
}
