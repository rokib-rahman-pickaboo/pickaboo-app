// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/responsive.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/pages/dashboard/ticket_detail_page/ticket_detail_page.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_main_page/ticket_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.dashboard);
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: const PickabooAppBar(
        title: 'Support Tickets',
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
              return const AppLoader.fullPage();
            }

            final tickets = state.tickets;

            if (state.status == TicketStatus.error && tickets.isEmpty) {
              final isOffline = ConnectivityUtils.isNoInternet(state.error, context);
              return AppErrorView(
                type: isOffline ? AppErrorType.noInternet : AppErrorType.server,
                message: isOffline ? null : state.error?.message,
                onRetry: () => context.read<TicketBloc>().add(
                  const TicketEvent.getTickets(),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _refreshTickets,
              color: AppColors.pickabooBlue,
              child: tickets.isEmpty
                  ? Stack(
                      children: [
                        ListView(),
                        AppEmptyView.tickets(
                          onCreateTicket: _navigateToCreateTicket,
                        ),
                      ],
                    )
                  : ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      padding: EdgeInsets.fromLTRB(
                        AppSpacing.sameGroupItemSpacing.w,
                        0,
                        AppSpacing.sameGroupItemSpacing.w,
                        16.h,
                      ),
                      itemCount: tickets.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: AppSpacing.sameGroupItemSpacing.h,
                      ),
                      itemBuilder: (context, index) {
                        final ticket = tickets[index];
                        return TicketCard(
                          ticket: ticket,
                          onTap: () => _navigateToTicketDetails(ticket),
                        );
                      },
                    ),
            );
          },
        ),
      ),

      // ── PERSISTENT PINNED BOTTOM BAR ──
      bottomNavigationBar: Container(
        color: AppColors.pageBg,
        padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
        child: SafeArea(
          child: AppButton.primary(
            height: 48.h,
            borderRadius: BorderRadius.circular(12.r),
            icon: Icon(
              Icons.add_rounded,
              size: 20.sp,
              color: AppColors.white,
            ),
            text: 'Create Ticket',
            onPressed: _navigateToCreateTicket,
          ),
        ),
      ),
    ),
    );
  }

  Widget _wrapTwoPane(BuildContext context, Widget list) {
    if (!context.useTwoPane) return list;
    return Row(
      children: [
        SizedBox(width: 360.w, child: list),
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
          style: AppTypography.bodySmall,
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
