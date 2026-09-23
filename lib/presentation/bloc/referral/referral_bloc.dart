import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pickaboo/domain/repository/user_profile_repository.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_event.dart';
import 'package:pickaboo/presentation/bloc/referral/referral_state.dart';

@injectable
class ReferralBloc extends Bloc<ReferralEvent, ReferralState> {
  final UserProfileRepository _repository;

  ReferralBloc(this._repository) : super(const ReferralState.initial()) {
    on<ReferralEvent>(_onReferralEvent);
  }

  Future<void> _onReferralEvent(
    ReferralEvent event,
    Emitter<ReferralState> emit,
  ) async {
    await event.when(
      started: () async {
      },
      getReferralHistory: (page, limit) async {
        if (page == 1) {
          emit(const ReferralState.loading());
        }

        final result = await _repository.getReferralHistory(
          page: page,
          limit: limit,
        );

        result.fold(
          (error) {
            emit(ReferralState.error(error.message));
          },
          (referralData) {

            bool hasReachedMax =
                (referralData.referralHistory?.length ?? 0) < limit;

            emit(
              ReferralState.referralHistoryLoaded(
                referralData: referralData,
                hasReachedMax: hasReachedMax,
              ),
            );
          },
        );
      },
      inviteFriend: (formData) async {
        emit(const ReferralState.loading());

        final result = await _repository.inviteFriend(formData);

        result.fold(
          (error) {
            emit(ReferralState.error(error.message));
          },
          (_) {
            emit(const ReferralState.inviteSuccess());
          },
        );
      },
    );
  }
}
