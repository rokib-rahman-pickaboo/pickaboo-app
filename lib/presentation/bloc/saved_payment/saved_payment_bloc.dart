import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/payment/saved_payment_entity.dart';
import 'package:pickaboo/domain/repository/saved_payment_repository.dart';

part 'saved_payment_event.dart';
part 'saved_payment_state.dart';
part 'saved_payment_bloc.freezed.dart';

@injectable
class SavedPaymentBloc extends Bloc<SavedPaymentEvent, SavedPaymentState> {
  final SavedPaymentRepository _repository;

  SavedPaymentBloc(this._repository) : super(SavedPaymentState.initial()) {
    on<_GetSavedPayments>(_onGetSavedPayments);
    on<_DeleteSavedPayment>(_onDeleteSavedPayment);
  }

  Future<void> _onGetSavedPayments(
    _GetSavedPayments event,
    Emitter<SavedPaymentState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        successMessage: null,
      ),
    );

    final result = await _repository.getSavedPayments(event.customerId);

    result.fold(
      (error) =>
          emit(state.copyWith(isLoading: false, errorMessage: error.message)),
      (payments) =>
          emit(state.copyWith(isLoading: false, savedPayments: payments)),
    );
  }

  Future<void> _onDeleteSavedPayment(
    _DeleteSavedPayment event,
    Emitter<SavedPaymentState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, successMessage: null),
    );

    final result = await _repository.deleteSavedPayment(
      event.customerId,
      event.phoneNumber,
    );

    result.fold(
      (error) =>
          emit(state.copyWith(isLoading: false, errorMessage: error.message)),
      (success) {
        if (success) {
          emit(
            state.copyWith(
              isLoading: false,
              successMessage: 'Payment method removed successfully',
            ),
          );
          add(SavedPaymentEvent.getSavedPayments(event.customerId));
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              errorMessage: 'Failed to remove payment method',
            ),
          );
        }
      },
    );
  }
}
