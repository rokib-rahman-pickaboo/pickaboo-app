import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/recommended_product/recommended_product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'recommended_products_event.dart';
part 'recommended_products_state.dart';
part 'recommended_products_bloc.freezed.dart';

@injectable
class RecommendedProductsBloc extends Bloc<RecommendedProductsEvent, RecommendedProductsState> {
  final ProductRepository repository;

  RecommendedProductsBloc(this.repository) : super(const RecommendedProductsState.initial()) {
    on<_Load>(_onLoad);
  }

  Future<void> _onLoad(_Load event, Emitter<RecommendedProductsState> emit) async {
    emit(const RecommendedProductsState.loading());

    final result = await repository.getRecommendedProducts(slug: event.slug);

    result.fold(
      (error) => emit(RecommendedProductsState.error(error)),
      (recommendedProducts) => emit(RecommendedProductsState.loaded(recommendedProducts)),
    );
  }
}
