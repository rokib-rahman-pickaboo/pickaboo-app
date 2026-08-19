import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_status/card_bin_status_entity.dart';
import 'package:pickaboo/domain/entity/card_bin/card_bin_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_verify/card_bin_verify_entity.dart';
import 'package:pickaboo/domain/entity/card_bin_remove/card_bin_remove_entity.dart';
import 'package:pickaboo/domain/repository/cart_repository.dart';

part 'card_bin_event.dart';
part 'card_bin_state.dart';
part 'card_bin_bloc.freezed.dart';

@injectable
class CardBinBloc extends Bloc<CardBinEvent, CardBinState> {
  final CartRepository repository;

  CardBinBloc(this.repository) : super(const CardBinState()) {
    on<CardBinEvent>((event, emit) async {
      await event.map(
        getStatus: (_GetStatus req) async {
          emit(state.copyWith(status: CardBinStatus.loading, error: null));
          final result = await repository.getCardBinStatus();

          CardBinState newState = state;
          result.fold(
            (l) => newState = state.copyWith(status: CardBinStatus.error, error: l),
            (r) => newState = state.copyWith(
              status: CardBinStatus.success,
              cardBinStatus: r,
            ),
          );

          emit(newState);

          if (req.orderId != null) {
            add(CardBinEvent.verify(orderId: req.orderId!));
          }
        },
        verify: (_Verify req) async {
          emit(state.copyWith(status: CardBinStatus.loading, error: null));
          final result = await repository.verifyCardBin(
            orderId: req.orderId,
          );
          result.fold(
            (l) => emit(state.copyWith(status: CardBinStatus.error, error: l)),
            (r) {
              if (r.success && r.isApplied) {
                emit(state.copyWith(
                  status: CardBinStatus.success,
                  cardBinVerifyResponse: r,
                  appliedBinNumber: r.binNumber,
                  cardBinResponse: null,
                ));
              } else {
                emit(state.copyWith(
                  status: CardBinStatus.success,
                  cardBinVerifyResponse: null,
                  appliedBinNumber: null,
                  cardBinResponse: null,
                ));
              }
            },
          );
        },
        apply: (_Apply req) async {
          emit(state.copyWith(status: CardBinStatus.loading, error: null));
          final result = await repository.applyCardBin(
            orderId: req.orderId,
            cardBin: req.cardBin,
          );
          result.fold(
            (l) => emit(state.copyWith(status: CardBinStatus.error, error: l)),
            (r) => emit(state.copyWith(
              status: CardBinStatus.success,
              cardBinResponse: r,
              appliedBinNumber: req.cardBin,
            )),
          );
        },
        remove: (_Remove req) async {
          emit(state.copyWith(status: CardBinStatus.loading, error: null));
          final result = await repository.removeCardBin(
            orderId: req.orderId,
          );
          result.fold(
            (l) => emit(state.copyWith(status: CardBinStatus.error, error: l)),
            (r) => emit(state.copyWith(
              status: CardBinStatus.success,
              cardBinRemoveResponse: r,
              cardBinResponse: null,
              cardBinVerifyResponse: null,
              appliedBinNumber: null,
            )),
          );
        },
      );
    });
  }
}
