import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/content_page/content_page_entity.dart';
import 'package:pickaboo/domain/repository/support_repository.dart';

part 'return_policy_event.dart';
part 'return_policy_state.dart';
part 'return_policy_bloc.freezed.dart';

@injectable
class ReturnPolicyBloc extends Bloc<ReturnPolicyEvent, ReturnPolicyState> {
  final SupportRepository repository;

  ReturnPolicyBloc(this.repository) : super(const ReturnPolicyState()) {
    on<ReturnPolicyEvent>((event, emit) async {
      await event.map(
        getReturnPolicy: (_GetReturnPolicy req) async {
          emit(state.copyWith(status: ReturnPolicyStatus.loading));

          final result = await repository.getReturnPolicy();
          result.fold(
            (l) => emit(
              state.copyWith(error: l, status: ReturnPolicyStatus.error),
            ),
            (r) async {
              if (r.isNotEmpty == true) {
                emit(
                  state.copyWith(
                    status: ReturnPolicyStatus.success,
                    content: r,
                  ),
                );
              } else {
                emit(state.copyWith(status: ReturnPolicyStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: ReturnPolicyStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const ReturnPolicyEvent.getReturnPolicy());
        },
      );
    });
  }
}
