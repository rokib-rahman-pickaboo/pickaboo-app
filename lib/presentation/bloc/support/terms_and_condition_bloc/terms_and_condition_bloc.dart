import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/content_page/content_page_entity.dart';
import 'package:pickaboo/domain/repository/support_repository.dart';

part 'terms_and_condition_event.dart';
part 'terms_and_condition_state.dart';
part 'terms_and_condition_bloc.freezed.dart';

@injectable
class TermsAndConditionBloc
    extends Bloc<TermsAndConditionEvent, TermsAndConditionState> {
  final SupportRepository repository;

  TermsAndConditionBloc(this.repository)
    : super(const TermsAndConditionState()) {
    on<TermsAndConditionEvent>((event, emit) async {
      await event.map(
        getTermsAndConditions: (_GetTermsAndConditions req) async {
          emit(state.copyWith(status: TermsAndConditionStatus.loading));

          final result = await repository.getTermsAndConditions();
          result.fold(
            (l) => emit(
              state.copyWith(error: l, status: TermsAndConditionStatus.error),
            ),
            (r) async {
              if (r.isNotEmpty == true) {
                emit(
                  state.copyWith(
                    status: TermsAndConditionStatus.success,
                    content: r,
                  ),
                );
              } else {
                emit(state.copyWith(status: TermsAndConditionStatus.empty));
              }
            },
          );
        },

        refresh: (_Refresh req) async {
          emit(state.copyWith(status: TermsAndConditionStatus.loading));
          await Future.delayed(const Duration(milliseconds: 100));
          add(const TermsAndConditionEvent.getTermsAndConditions());
        },
      );
    });
  }
}
