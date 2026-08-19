import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/data/api_service/product_api_service.dart';
import 'package:pickaboo/data/mapper/emi_mapper/emi_mapper.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/emi/emi_entity.dart';

part 'emi_event.dart';
part 'emi_state.dart';
part 'emi_bloc.freezed.dart';

@injectable
class EmiBloc extends Bloc<EmiEvent, EmiState> {
  final ProductApiService apiService;

  EmiBloc(this.apiService) : super(const EmiState.initial()) {
    on<_Load>(_onLoad);
  }

  Future<void> _onLoad(_Load event, Emitter<EmiState> emit) async {
    emit(const EmiState.loading());

    final result = await apiService.getEmiDetails(productId: event.productId);

    result.fold(
      (error) => emit(
        EmiState.error(
          AppErrorEntity(
            message: error.message ?? 'Failed to load EMI options',
          ),
        ),
      ),
      (emiList) {
        final emiEntities = emiList.map((e) => e.toEntity()).toList();
        emit(EmiState.loaded(emiEntities));
      },
    );
  }
}
