import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/data/model/otp_response/otp_response.dart';
import 'package:pickaboo/domain/entity/auth/user_entity.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/repository/user_profile_repository.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_bloc.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_event.dart';
import 'package:pickaboo/presentation/bloc/user_profile/user_profile_state.dart';
import 'package:dartz/dartz.dart';

// Mock Dependencies
class MockUserProfileRepository extends Mock implements UserProfileRepository {}

class MockUserEntity extends Mock implements UserEntity {}

void main() {
  late UserProfileBloc userProfileBloc;
  late MockUserProfileRepository mockUserProfileRepository;

  setUp(() {
    mockUserProfileRepository = MockUserProfileRepository();
    userProfileBloc = UserProfileBloc(mockUserProfileRepository);
  });

  tearDown(() {
    userProfileBloc.close();
  });

  group('UserProfileBloc', () {
    const tUser = UserEntity(
      id: 1,
      email: 'test@example.com',
      firstname: 'Test',
      lastname: 'User',
    );

    test('initial state is UserProfileState.initial', () {
      expect(userProfileBloc.state, const UserProfileState.initial());
    });

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [loading, loaded] when loadUserProfile is added and succeeds',
      build: () {
        when(
          () => mockUserProfileRepository.getProfile(),
        ).thenAnswer((_) async => const Right(tUser));
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(const UserProfileEvent.loadUserProfile()),
      expect: () => [
        const UserProfileState.loading(),
        const UserProfileState.loaded(user: tUser),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [loading, error] when loadUserProfile is added and fails',
      build: () {
        when(() => mockUserProfileRepository.getProfile()).thenAnswer(
          (_) async =>
              const Left(AppErrorEntity(message: 'Failed to load profile')),
        );
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(const UserProfileEvent.loadUserProfile()),
      expect: () => [
        const UserProfileState.loading(),
        const UserProfileState.error('Failed to load profile'),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, phoneUpdateOtpSent] when sendPhoneUpdateOtp succeeds',
      seed: () => const UserProfileState.loaded(user: tUser),
      build: () {
        when(
          () => mockUserProfileRepository.sendPhoneUpdateOtp(
            mobile: '01700000000',
            resend: false,
          ),
        ).thenAnswer(
          (_) async => const Right(OtpResponse(status: 200, message: 'OTP sent')),
        );
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        const UserProfileEvent.sendPhoneUpdateOtp('01700000000'),
      ),
      expect: () => [
        const UserProfileState.updating(currentUser: tUser),
        const UserProfileState.phoneUpdateOtpSent(
          mobileNumber: '01700000000',
          user: tUser,
        ),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, mobileUpdateSuccess, loaded] when updateMobile succeeds',
      seed: () => const UserProfileState.phoneUpdateOtpSent(
        mobileNumber: '01700000000',
        user: tUser,
      ),
      build: () {
        when(
          () => mockUserProfileRepository.updateMobile(
            newMobile: '01700000000',
            otp: '1234',
          ),
        ).thenAnswer((_) async => const Right(tUser));
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        const UserProfileEvent.updateMobile(
          newMobile: '01700000000',
          otp: '1234',
        ),
      ),
      expect: () => [
        const UserProfileState.updating(
          currentUser: tUser,
          mobileNumber: '01700000000',
        ),
        const UserProfileState.mobileUpdateSuccess(
          message: 'Mobile number updated successfully',
          user: tUser,
          mobileNumber: '01700000000',
        ),
        const UserProfileState.loaded(
          user: tUser,
          mobileNumber: '01700000000',
        ),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, emailUpdateOtpSent] when sendEmailUpdateOtp succeeds',
      seed: () => const UserProfileState.loaded(user: tUser),
      build: () {
        when(
          () => mockUserProfileRepository.sendEmailUpdateOtp(
            email: 'newemail@example.com',
          ),
        ).thenAnswer(
          (_) async => const Right(OtpResponse(status: 200, message: 'OTP sent')),
        );
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        const UserProfileEvent.sendEmailUpdateOtp('newemail@example.com'),
      ),
      expect: () => [
        const UserProfileState.updating(currentUser: tUser),
        const UserProfileState.emailUpdateOtpSent(
          email: 'newemail@example.com',
          user: tUser,
        ),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, emailUpdateSuccess, loaded] when updateEmail succeeds',
      seed: () => const UserProfileState.emailUpdateOtpSent(
        email: 'newemail@example.com',
        user: tUser,
      ),
      build: () {
        const updatedUser = UserEntity(
          id: 1,
          email: 'newemail@example.com',
          firstname: 'Test',
          lastname: 'User',
        );
        when(
          () => mockUserProfileRepository.updateEmail(
            newEmail: 'newemail@example.com',
            otp: '6102',
          ),
        ).thenAnswer((_) async => const Right(updatedUser));
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        const UserProfileEvent.updateEmail(
          newEmail: 'newemail@example.com',
          otp: '6102',
        ),
      ),
      expect: () => [
        const UserProfileState.updating(currentUser: tUser),
        const UserProfileState.emailUpdateSuccess(
          message: 'Email address updated successfully',
          user: UserEntity(
            id: 1,
            email: 'newemail@example.com',
            firstname: 'Test',
            lastname: 'User',
          ),
        ),
        const UserProfileState.loaded(
          user: UserEntity(
            id: 1,
            email: 'newemail@example.com',
            firstname: 'Test',
            lastname: 'User',
          ),
        ),
      ],
    );

    final tAddressPayload = {
      'firstname': 'Rifat',
      'lastname': 'Kabir',
      'company': '',
      'street': ['House 10, Road 5', 'Banani'],
      'city': 'Dhaka',
      'postcode': 'Chawk Bazar',
      'region': 'Dhaka',
      'region_id': 485,
      'country_id': 'BD',
      'telephone': '01700000000',
      'default_shipping': true,
      'default_billing': false,
    };

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, basicInfoUpdateSuccess, loading, loaded] when addAddress succeeds',
      seed: () => const UserProfileState.loaded(user: tUser),
      build: () {
        when(
          () => mockUserProfileRepository.addAddress(tAddressPayload),
        ).thenAnswer((_) async => const Right('Address saved successfully.'));
        when(
          () => mockUserProfileRepository.getProfile(
            forceRefresh: any(named: 'forceRefresh'),
          ),
        ).thenAnswer((_) async => const Right(tUser));
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        UserProfileEvent.addAddress(address: tAddressPayload),
      ),
      expect: () => [
        const UserProfileState.updating(currentUser: tUser),
        const UserProfileState.basicInfoUpdateSuccess(
          message: 'Address saved successfully.',
          user: tUser,
        ),
        const UserProfileState.loading(currentUser: tUser),
        const UserProfileState.loaded(user: tUser),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, error, loading, loaded] when addAddress fails',
      seed: () => const UserProfileState.loaded(user: tUser),
      build: () {
        when(
          () => mockUserProfileRepository.addAddress(tAddressPayload),
        ).thenAnswer(
          (_) async =>
              const Left(AppErrorEntity(message: 'Failed to save address')),
        );
        when(
          () => mockUserProfileRepository.getProfile(
            forceRefresh: any(named: 'forceRefresh'),
          ),
        ).thenAnswer((_) async => const Right(tUser));
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        UserProfileEvent.addAddress(address: tAddressPayload),
      ),
      expect: () => [
        const UserProfileState.updating(currentUser: tUser),
        const UserProfileState.error('Failed to save address'),
        const UserProfileState.loading(),
        const UserProfileState.loaded(user: tUser),
      ],
    );

    final tUpdateAddressPayload = {
      'id': 123,
      ...tAddressPayload,
    };

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, basicInfoUpdateSuccess, loading, loaded] when updateAddress succeeds',
      seed: () => const UserProfileState.loaded(user: tUser),
      build: () {
        when(
          () => mockUserProfileRepository.updateAddress(tUpdateAddressPayload),
        ).thenAnswer((_) async => const Right('Address updated successfully.'));
        when(
          () => mockUserProfileRepository.getProfile(
            forceRefresh: any(named: 'forceRefresh'),
          ),
        ).thenAnswer((_) async => const Right(tUser));
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        UserProfileEvent.updateAddress(address: tUpdateAddressPayload),
      ),
      expect: () => [
        const UserProfileState.updating(currentUser: tUser),
        const UserProfileState.basicInfoUpdateSuccess(
          message: 'Address updated successfully.',
          user: tUser,
        ),
        const UserProfileState.loading(currentUser: tUser),
        const UserProfileState.loaded(user: tUser),
      ],
    );

    blocTest<UserProfileBloc, UserProfileState>(
      'emits [updating, basicInfoUpdateSuccess, loading, loaded] when deleteAddress succeeds',
      seed: () => const UserProfileState.loaded(user: tUser),
      build: () {
        when(
          () => mockUserProfileRepository.deleteAddress(123),
        ).thenAnswer((_) async => const Right('Address deleted successfully.'));
        when(
          () => mockUserProfileRepository.getProfile(
            forceRefresh: any(named: 'forceRefresh'),
          ),
        ).thenAnswer((_) async => const Right(tUser));
        return userProfileBloc;
      },
      act: (bloc) => bloc.add(
        const UserProfileEvent.deleteAddress(addressId: 123),
      ),
      expect: () => [
        const UserProfileState.updating(currentUser: tUser),
        const UserProfileState.basicInfoUpdateSuccess(
          message: 'Address deleted successfully.',
          user: tUser,
        ),
        const UserProfileState.loading(currentUser: tUser),
        const UserProfileState.loaded(user: tUser),
      ],
    );
  });
}
