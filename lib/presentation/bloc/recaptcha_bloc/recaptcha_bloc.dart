import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'recaptcha_event.dart';
import 'recaptcha_state.dart';
import '../../../data/services/recaptcha_service.dart';

void _rlog(String msg) {
  debugPrint('[RECAPTCHA] $msg');
}

@injectable
class RecaptchaBloc extends Bloc<RecaptchaEvent, RecaptchaState> {
  final RecaptchaService _recaptchaService;

  RecaptchaBloc(this._recaptchaService) : super(const RecaptchaState.initial()) {
    on<GenerateToken>(_onGenerateToken);
  }

  Future<void> _onGenerateToken(
    GenerateToken event,
    Emitter<RecaptchaState> emit,
  ) async {
    _rlog('bloc GenerateToken received | action=${event.action}');
    emit(const RecaptchaState.loading());
    try {
      final token = await _recaptchaService.executeAction(event.action);
      _rlog('bloc success | action=${event.action} tokenLen=${token.length}');
      emit(RecaptchaState.success(token));
    } catch (e) {
      _rlog('bloc ERROR | action=${event.action} error=$e');
      emit(RecaptchaState.error(e.toString()));
    }
  }
}
