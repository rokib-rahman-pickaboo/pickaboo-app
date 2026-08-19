import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/related_product/related_product_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'related_products_event.dart';
part 'related_products_state.dart';
part 'related_products_bloc.freezed.dart';

@injectable
class RelatedProductsBloc extends Bloc<RelatedProductsEvent, RelatedProductsState> {
  final ProductRepository repository;

  RelatedProductsBloc(this.repository) : super(const RelatedProductsState.initial()) {
    on<_Load>(_onLoad);
  }

  Future<void> _onLoad(_Load event, Emitter<RelatedProductsState> emit) async {
    emit(const RelatedProductsState.loading());

    final result = await repository.getRelatedProducts(slug: event.slug);

    result.fold(
      (error) => emit(RelatedProductsState.error(error)),
      (relatedProducts) => emit(RelatedProductsState.loaded(relatedProducts)),
    );
  }
}
