import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/ticket_detail_page/ticket_detail_page.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';

import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_main_page/ticket_card.dart';

class TicketMainPage extends StatefulWidget {
  const TicketMainPage({super.key});

  @override
  State<TicketMainPage> createState() => _TicketMainPageState();
}

class _TicketMainPageState extends State<TicketMainPage> {
  String? _selectedTicketId;

  @override
  void initState() {
    super.initState();
    context.read<TicketBloc>().add(const TicketEvent.getTickets());
  }

  Future<void> _refreshTickets() async {
    context.read<TicketBloc>().add(
      const TicketEvent.getTickets(forceRefresh: true),
    );
  }

  void _navigateToCreateTicket() {
    context.push(Routes.createTicket).then((_) {
      _refreshTickets();
    });
  }

  void _navigateToTicketDetails(TicketEntity ticket) {
    if (context.useTwoPane) {
      setState(() {
        _selectedTicketId = ticket.ticketId;
      });
      return;
    }
    context.push('/support/ticket/${ticket.ticketId}', extra: ticket).then((_) {
      _refreshTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          iconPath: 'assets/new/svg/back_nav_icon.svg',
          width: 7.w,
          height: 14.h,
          onPressed: () => Navigator.of(context).pop(),
          iconColor: colors.text,
        ),
        title: const Text('Support Tickets'),
      ),
      body: _wrapTwoPane(
        context,
        BlocConsumer<TicketBloc, TicketState>(
          listener: (context, state) {
            if (state.status == TicketStatus.error &&
                state.error != null &&
                ModalRoute.of(context)?.isCurrent == true) {
              SnackBarUtils.showError(context, state.error!.message);
            }
          },
          builder: (context, state) {
            if (state.status == TicketStatus.loading) {
              return Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                  strokeWidth: 2.w,
                ),
              );
            }

            final tickets = state.tickets;

            if (state.status == TicketStatus.error && tickets.isEmpty) {
              return AppErrorView(
                type: AppErrorType.server,
                message: state.error?.message,
                onRetry: () => context.read<TicketBloc>().add(
                  const TicketEvent.getTickets(),
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshTickets,
                    color: colors.primary,
                    child: tickets.isEmpty
                        ? Stack(
                            children: [
                              ListView(),
                              _EmptyState(
                                onCreateTicket: _navigateToCreateTicket,
                              ),
                            ],
                          )
                        : CustomScrollView(
                            slivers: [
                              SliverPadding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                sliver: SliverList.separated(
                                  itemCount: tickets.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 12.h),
                                  itemBuilder: (context, index) {
                                    final ticket = tickets[index];
                                    return TicketCard(
                                      ticket: ticket,
                                      onTap: () =>
                                          _navigateToTicketDetails(ticket),
                                    );
                                  },
                                ),
                              ),

                              SliverToBoxAdapter(child: SizedBox(height: 80.h)),
                            ],
                          ),
                  ),
                ),

                if (tickets.isNotEmpty)
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: colors.black.withValues(alpha: 0.05),
                          blurRadius: 10.r,
                          offset: Offset(0, -2.h),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      top: false,
                      child: ElevatedButton.icon(
                        onPressed: _navigateToCreateTicket,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.button,
                          minimumSize: Size(double.maxFinite, 48.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        icon: Icon(Icons.add, color: colors.white, size: 22.sp),
                        label: Text(
                          'Create Ticket',
                          style: context.textStyle.buttonMedium.copyWith(
                            color: colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _wrapTwoPane(BuildContext context, Widget list) {
    if (!context.useTwoPane) return list;
    return Row(
      children: [
        SizedBox(width: 360, child: list),
        const VerticalDivider(width: 1, thickness: 1),
        Expanded(child: _buildDetailPane(context)),
      ],
    );
  }

  Widget _buildDetailPane(BuildContext context) {
    final id = _selectedTicketId;
    if (id == null) {
      return Center(
        child: Text(
          'Select a ticket to see its details',
          style: context.textStyle.bodyMedium.copyWith(
            color: context.colors.gray,
          ),
        ),
      );
    }
    return MultiBlocProvider(
      key: ValueKey(id),
      providers: [
        BlocProvider(create: (_) => getIt<TicketBloc>()),
        BlocProvider(create: (_) => getIt<PhotoPickerBloc>()),
      ],
      child: TicketDetailPage(ticketId: id, embedded: true),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onCreateTicket;

  const _EmptyState({required this.onCreateTicket});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: colors.primary.withAlpha(25),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.confirmation_num_outlined,
                size: 80.sp,
                color: colors.primary,
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'No Support Tickets',
              style: context.textStyle.bodyLargeBold.copyWith(
                color: colors.text,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              'You do not have any open tickets.\nCreate a ticket to get help from our support team.',
              style: context.textStyle.bodyMedium.copyWith(color: colors.gray),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.h),
            ElevatedButton.icon(
              onPressed: onCreateTicket,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.button,
                minimumSize: Size(double.maxFinite, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              icon: Icon(Icons.add, color: colors.white, size: 22.sp),
              label: Text(
                'Create Ticket',
                style: context.textStyle.buttonMedium.copyWith(
                  color: colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
