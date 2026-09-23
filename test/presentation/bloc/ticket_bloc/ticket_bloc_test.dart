import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pickaboo/domain/entity/app_error/app_error_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/domain/repository/ticket_repository.dart';
import 'package:pickaboo/presentation/bloc/ticket_bloc/ticket_bloc.dart';

class MockTicketRepository extends Mock implements TicketRepository {}

void main() {
  late TicketBloc bloc;
  late MockTicketRepository mockRepository;

  setUp(() {
    mockRepository = MockTicketRepository();
    bloc = TicketBloc(mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  group('TicketBloc SWR Tests', () {
    const tCachedTicket = TicketEntity(
      ticketId: '1',
      ticketCode: 'TC1',
      subject: 'Cached Issue',
      issueType: 'Technical',
      status: 'Open',
      department: 'Support',
      lastReplyName: 'Agent',
      lastReplyAt: '2025-01-01',
    );

    const tFreshTicket = TicketEntity(
      ticketId: '1',
      ticketCode: 'TC1',
      subject: 'Fresh Issue',
      issueType: 'Technical',
      status: 'In Progress',
      department: 'Support',
      lastReplyName: 'Agent 2',
      lastReplyAt: '2025-01-02',
    );

    test('initial state has status initial', () {
      expect(bloc.state.status, TicketStatus.initial);
      expect(bloc.state.tickets, isEmpty);
    });

    blocTest<TicketBloc, TicketState>(
      'SWR: emits cached tickets immediately, then updates with fresh network tickets',
      build: () {
        when(() => mockRepository.getCachedTickets())
            .thenAnswer((_) async => [tCachedTicket]);
        when(() => mockRepository.getTickets(forceRefresh: true))
            .thenAnswer((_) async => const Right([tFreshTicket]));
        return bloc;
      },
      act: (bloc) => bloc.add(const TicketEvent.getTickets()),
      expect: () => [
        const TicketState(
          status: TicketStatus.success,
          tickets: [tCachedTicket],
        ),
        const TicketState(
          status: TicketStatus.success,
          tickets: [tFreshTicket],
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.getCachedTickets()).called(1);
        verify(() => mockRepository.getTickets(forceRefresh: true)).called(1);
      },
    );

    blocTest<TicketBloc, TicketState>(
      'SWR: emits cached tickets immediately and keeps them if network fails',
      build: () {
        when(() => mockRepository.getCachedTickets())
            .thenAnswer((_) async => [tCachedTicket]);
        when(() => mockRepository.getTickets(forceRefresh: true))
            .thenAnswer((_) async => const Left(AppErrorEntity(message: 'Network error')));
        return bloc;
      },
      act: (bloc) => bloc.add(const TicketEvent.getTickets()),
      expect: () => [
        const TicketState(
          status: TicketStatus.success,
          tickets: [tCachedTicket],
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.getCachedTickets()).called(1);
        verify(() => mockRepository.getTickets(forceRefresh: true)).called(1);
      },
    );

    blocTest<TicketBloc, TicketState>(
      'Cache miss: emits loading, then success when network returns',
      build: () {
        when(() => mockRepository.getCachedTickets())
            .thenAnswer((_) async => null);
        when(() => mockRepository.getTickets(forceRefresh: true))
            .thenAnswer((_) async => const Right([tFreshTicket]));
        return bloc;
      },
      act: (bloc) => bloc.add(const TicketEvent.getTickets()),
      expect: () => [
        const TicketState(
          status: TicketStatus.loading,
        ),
        const TicketState(
          status: TicketStatus.success,
          tickets: [tFreshTicket],
        ),
      ],
    );
  });
}
