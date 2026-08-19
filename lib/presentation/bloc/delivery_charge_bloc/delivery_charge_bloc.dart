import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/delivery_charge/delivery_charge_entity.dart';
import 'package:pickaboo/domain/repository/delivery_charge_repository.dart';

part 'delivery_charge_event.dart';
part 'delivery_charge_state.dart';
part 'delivery_charge_bloc.freezed.dart';

@injectable
class DeliveryChargeBloc
    extends Bloc<DeliveryChargeEvent, DeliveryChargeState> {
  final DeliveryChargeRepository _repository;

  DeliveryChargeBloc(this._repository) : super(const DeliveryChargeState.initial()) {
    on<_Fetch>(_onFetch);
  }

  Future<void> _onFetch(_Fetch event, Emitter<DeliveryChargeState> emit) async {
    emit(const DeliveryChargeState.loading());

    final result = await _repository.getDeliveryCharge(
      productId: event.productId,
    );

    result.fold(
      (error) => emit(
        DeliveryChargeState.error(
          AppErrorEntity(
            message: error.message.isNotEmpty
                ? error.message
                : 'Failed to load delivery charge',
          ),
        ),
      ),
      (entity) => emit(DeliveryChargeState.loaded(entity)),
    );
  }
}
