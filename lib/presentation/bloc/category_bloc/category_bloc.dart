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
          emit(state.copyWith(status: CategoryStatus.loading));

          final result = await repository.getAllCategories();
          result.fold(
            (l) => emit(state.copyWith(error: l, status: CategoryStatus.error)),
            (r) async {
              if (r.isNotEmpty == true) {
                emit(
                  state.copyWith(status: CategoryStatus.success, categories: r),
                );
              } else {
                emit(state.copyWith(status: CategoryStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: CategoryStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const CategoryEvent.getCategories());
        },
      );
    });
  }
}
