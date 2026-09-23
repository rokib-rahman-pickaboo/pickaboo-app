import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/common/category/category_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductRepository repository;

  CategoryBloc(this.repository) : super(const CategoryState()) {
    on<CategoryEvent>((event, emit) async {
      await event.map(
        getCategories: (_GetCategories req) async {
          // SWR Step 1: Render cached data immediately (~2ms)
          final cached =
              state.categories ?? await repository.getCachedCategories();
          if (cached != null && cached.isNotEmpty) {
            emit(
              state.copyWith(
                status: CategoryStatus.success,
                categories: cached,
              ),
            );
          } else {
            emit(state.copyWith(status: CategoryStatus.loading));
          }

          // SWR Step 2: Background revalidation from network
          final result = await repository.getAllCategories(forceRefresh: true);
          result.fold(
            (l) {
              if (state.categories == null || state.categories!.isEmpty) {
                emit(
                  state.copyWith(error: l, status: CategoryStatus.error),
                );
              }
            },
            (r) async {
              if (r.isNotEmpty) {
                emit(
                  state.copyWith(status: CategoryStatus.success, categories: r),
                );
              } else if (state.categories == null ||
                  state.categories!.isEmpty) {
                emit(state.copyWith(status: CategoryStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          add(const CategoryEvent.getCategories());
        },
      );
    });
  }
}
