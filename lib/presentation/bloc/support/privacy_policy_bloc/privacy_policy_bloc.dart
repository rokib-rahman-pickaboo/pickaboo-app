import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/content_page/content_page_entity.dart';
import 'package:pickaboo/domain/repository/support_repository.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';
part 'privacy_policy_bloc.freezed.dart';

@injectable
class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  final SupportRepository repository;

  PrivacyPolicyBloc(this.repository) : super(const PrivacyPolicyState()) {
    on<PrivacyPolicyEvent>((event, emit) async {
      await event.map(
        getPrivacyPolicy: (_GetPrivacyPolicy req) async {
          emit(state.copyWith(status: PrivacyPolicyStatus.loading));

          final result = await repository.getPrivacyPolicy();
          result.fold(
            (l) => emit(
              state.copyWith(error: l, status: PrivacyPolicyStatus.error),
            ),
            (r) async {
              if (r.isNotEmpty == true) {
                emit(
                  state.copyWith(
                    status: PrivacyPolicyStatus.success,
                    content: r,
                  ),
                );
              } else {
                emit(state.copyWith(status: PrivacyPolicyStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: PrivacyPolicyStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const PrivacyPolicyEvent.getPrivacyPolicy());
        },
      );
    });
  }
}
