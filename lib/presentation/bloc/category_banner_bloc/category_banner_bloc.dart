import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/category_banner/category_banner_entity.dart';
import 'package:pickaboo/domain/repository/category_banner_repository.dart';

part 'category_banner_event.dart';
part 'category_banner_state.dart';
part 'category_banner_bloc.freezed.dart';

@injectable
class CategoryBannerBloc
    extends Bloc<CategoryBannerEvent, CategoryBannerState> {
  final CategoryBannerRepository repository;

  CategoryBannerBloc(this.repository) : super(const CategoryBannerState()) {
    on<CategoryBannerEvent>((event, emit) async {
      await event.map(
        load: (e) async {
          emit(state.copyWith(status: CategoryBannerStatus.loading));

          final result = await repository.getCategoryBanners(
            categoryId: e.categoryId,
          );
          result.fold(
            (l) => emit(
              state.copyWith(status: CategoryBannerStatus.error, error: l),
            ),
            (r) => emit(
              state.copyWith(status: CategoryBannerStatus.loaded, banners: r),
            ),
          );
        },
      );
    }, transformer: droppable());
  }
}
