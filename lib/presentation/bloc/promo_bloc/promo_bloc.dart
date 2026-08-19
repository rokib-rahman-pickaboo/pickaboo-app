import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/promo/promo_entity.dart';
import 'package:pickaboo/domain/repository/promo_repository.dart';

part 'promo_event.dart';
part 'promo_state.dart';
part 'promo_bloc.freezed.dart';

@injectable
class PromoBloc extends Bloc<PromoEvent, PromoState> {
  final PromoRepository _repository;

  PromoBloc(this._repository) : super(const PromoState.initial()) {
    on<_Fetch>(_onFetch);
  }

  Future<void> _onFetch(_Fetch event, Emitter<PromoState> emit) async {
    emit(const PromoState.loading());

    final result = await _repository.getPromoCode(slug: event.slug);

    result.fold(
      (error) => emit(
        PromoState.error(
          AppErrorEntity(
            message: error.message.isNotEmpty
                ? error.message
                : 'Failed to load promo code',
          ),
        ),
      ),
      (entity) => emit(PromoState.loaded(entity)),
    );
  }
}
