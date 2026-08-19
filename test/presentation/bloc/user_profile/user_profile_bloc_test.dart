import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
  });
}
