import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'compare_event.dart';
part 'compare_state.dart';
part 'compare_bloc.freezed.dart';

@injectable
class CompareBloc extends Bloc<CompareEvent, CompareState> {
  final ProductRepository repository;

  CompareBloc(this.repository) : super(const CompareState.initial()) {
    on<_Load>(_onLoad);
    on<_Add>(_onAdd);
    on<_Remove>(_onRemove);
    on<_Clear>(_onClear);
    on<_Compare>(_onCompare);
  }

  Future<void> _onLoad(_Load event, Emitter<CompareState> emit) async {
    emit(CompareState.loading(products: state.products));
    final result = await repository.getAllSavedProductDetails();
    result.fold(
      (error) => emit(CompareState.error(error: error, products: state.products)),
      (products) => emit(CompareState.updated(products: products)),
    );
  }

  Future<void> _onAdd(_Add event, Emitter<CompareState> emit) async {
    final products = List<ProductDetailEntity>.from(state.products);

    if (products.any((p) => p.id == event.product.id)) {
      emit(CompareState.error(
        error: const AppErrorEntity(message: 'Product is already in the comparison list.'),
        products: products,
      ));
      emit(CompareState.updated(products: products));
      return;
    }

    if (products.isNotEmpty) {
      final firstProduct = products.first;
      final newProduct = event.product;

      const restrictedCategories = ['171', '7', '1837', '20', '4', '197'];

      final firstProductRestrictedCats = firstProduct.categoryIds
          .where((id) => restrictedCategories.contains(id))
          .toSet();

      final newProductRestrictedCats = newProduct.categoryIds
          .where((id) => restrictedCategories.contains(id))
          .toSet();

      if (firstProductRestrictedCats.isNotEmpty || newProductRestrictedCats.isNotEmpty) {
        final intersection = firstProductRestrictedCats.intersection(newProductRestrictedCats);
        if (intersection.isEmpty) {
          emit(CompareState.error(
            error: const AppErrorEntity(message: 'You can only compare products of the same category.'),
            products: products,
          ));
          emit(CompareState.updated(products: products));
          return;
        }
      }
    }

    if (products.length >= 2) {
      // Replace the 2nd slot product with the new item
      products[1] = event.product;
    } else {
      // Append to the list so initial product stays as slot 0
      products.add(event.product);
    }

    emit(CompareState.updated(products: products));

    await repository.saveProductDetailsForCache(entity: event.product);
  }

  Future<void> _onRemove(_Remove event, Emitter<CompareState> emit) async {
    final updated = state.products
        .where((p) => p.id.toString() != event.productId)
        .toList();

    emit(CompareState.updated(products: updated));

    await repository.removeProductDetails(productId: event.productId);
  }

  Future<void> _onClear(_Clear event, Emitter<CompareState> emit) async {
    emit(const CompareState.updated(products: []));
    await repository.clearProductDetailsCache();
  }

  void _onCompare(_Compare event, Emitter<CompareState> emit) {
    final products = state.products;

    if (products.isEmpty) {
      emit(CompareState.error(
        error: const AppErrorEntity(message: 'Please add at least 1 product to compare.'),
        products: products,
      ));
      return;
    }

    emit(CompareState.comparing(products: products));
  }
}
