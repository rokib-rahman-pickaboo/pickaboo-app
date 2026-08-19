import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/promotion_slider/promotion_slider_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';

part 'promotion_slider_event.dart';
part 'promotion_slider_state.dart';
part 'promotion_slider_bloc.freezed.dart';

@injectable
class PromotionSliderBloc extends Bloc<PromotionSliderEvent, PromotionSliderState> {
  final ProductRepository repository;

  PromotionSliderBloc(this.repository) : super(const PromotionSliderState()) {
    on<PromotionSliderEvent>((event, emit) async {
      await event.map(
        getPromotionSlider: (_GetPromotionSlider req) async {
          emit(state.copyWith(status: PromotionSliderStatus.loading));

          final result = await repository.getPromotionSlider();
          result.fold(
            (l) {
              if (kDebugMode) {
                print('❌ [PromotionSliderBloc] Error: ${l.message}');
              }
              emit(state.copyWith(error: l, status: PromotionSliderStatus.error));
            },
            (r) {
              if (kDebugMode) {
                print('✅ [PromotionSliderBloc] Success: ${r.length} slides');
              }
              emit(
                state.copyWith(
                  status: PromotionSliderStatus.success,
                  slides: r,
                ),
              );
            },
          );
        },
      );
    });
  }
}
