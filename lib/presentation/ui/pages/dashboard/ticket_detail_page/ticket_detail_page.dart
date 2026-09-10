import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_entity.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_event.dart';
import 'package:pickaboo/presentation/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_detail_page/ticket_info_card.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_detail_page/ticket_message_item.dart';
import 'package:pickaboo/presentation/ui/widgets/dashboard/ticket_detail_page/ticket_reply_section.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';
import 'package:pickaboo/core/utils/connectivity_utils.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_error_view.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class TicketDetailPage extends StatefulWidget {
  final String ticketId;

  final bool embedded;

  const TicketDetailPage({
    super.key,
    required this.ticketId,
    this.embedded = false,
  });

  @override
  State<TicketDetailPage> createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  final TextEditingController _replyController = TextEditingController();
  final FocusNode _replyFocusNode = FocusNode();

  late String _ticketId;
  TicketEntity? _initialTicket;
  late PhotoPickerBloc _photoPickerBloc;

  @override
  void initState() {
    super.initState();
    _ticketId = widget.ticketId;
    _photoPickerBloc = context.read<PhotoPickerBloc>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TicketBloc>().add(TicketEvent.getTicketDetails(_ticketId));
    });
  }

  @override
  void dispose() {
    _replyController.dispose();
    _replyFocusNode.dispose();
    super.dispose();
  }

  Future<void> _addPhotos() async {
    _photoPickerBloc.add(
      const PhotoPickerEvent.pickFromGallery(maxWidth: 500, maxHeight: 500),
    );
  }

  void _deletePhoto(int index) {
    _photoPickerBloc.add(PhotoPickerEvent.removeImageAtIndex(index));
  }

  Future<void> _postReply() async {
    if (_replyController.text.trim().isEmpty) {
      SnackBarUtils.showError(context, AppStrings.enterMessage);
      return;
    }

    final images = _photoPickerBloc.state.images ?? [];

    context.read<TicketBloc>().add(
      TicketEvent.replyTicket(
        _ticketId,
        _replyController.text.trim(),
        attachments: images.isNotEmpty
            ? images.map((e) => File(e.path)).toList()
            : null,
      ),
    );
  }

  Future<void> _closeTicket() async {
    final textTheme = context.textStyle;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          'Close Ticket',
          style: textTheme.headingMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),
        content: Text(
          'Are you sure you want to close this ticket?',
          style: textTheme.bodyMedium.copyWith(color: AppColors.muted),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'Cancel',
              style: textTheme.bodyMedium.copyWith(color: AppColors.muted),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Close Ticket',
              style: textTheme.bodyMedium.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      if (mounted) {
        context.read<TicketBloc>().add(TicketEvent.closeTicket(_ticketId));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.embedded,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop || widget.embedded) return;
        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.ticketMain);
        }
      },
      child: Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: widget.embedded
          ? null
          : const PickabooAppBar(
              title: 'Ticket Details',
            ),
      body: SafeArea(
        top: false,
        child: BlocConsumer<TicketBloc, TicketState>(
          listener: (context, state) {
            if (state.status == TicketStatus.error && state.error != null) {
              SnackBarUtils.showError(context, state.error!.message);
            }
            if (state.status == TicketStatus.success &&
                state.successMessage != null) {
              final msg = state.successMessage ?? AppStrings.operationSuccessful;
              SnackBarUtils.showSuccess(context, msg);
              context.read<TicketBloc>().add(const TicketEvent.clearMessage());
              if (msg.contains('Reply posted')) {
                _replyController.clear();
                _photoPickerBloc.add(const PhotoPickerEvent.clear());
              } else if (msg.contains('closed')) {
                if (!widget.embedded) {
                  Navigator.of(context).pop();
                }
              }
            }
          },
          builder: (context, state) {
            final detailEntity = state.ticketDetails;

            if (state.status == TicketStatus.loading &&
                detailEntity == null &&
                _initialTicket == null) {
              return const AppLoader.fullPage();
            }

            final isSubmitting =
                state.status == TicketStatus.loading && detailEntity != null;

            if (detailEntity == null &&
                _initialTicket == null &&
                !isSubmitting) {
              if (state.status == TicketStatus.error) {
                final isOffline = ConnectivityUtils.isNoInternet(state.error, context);
                return AppErrorView(
                  type: isOffline ? AppErrorType.noInternet : AppErrorType.server,
                  message: isOffline ? null : state.error?.message,
                  onRetry: () => context.read<TicketBloc>().add(
                    TicketEvent.getTicketDetails(_ticketId),
                  ),
                );
              }
              return const Center(child: Text("Details not found"));
            }

            final ticketDetails =
                detailEntity ??
                (_initialTicket != null
                    ? TicketDetailEntity(
                        ticketId: _initialTicket!.ticketId,
                        ticketCode: _initialTicket!.ticketCode,
                        subject: _initialTicket!.subject,
                        issueType: _initialTicket!
                            .issueType,
                        status: _initialTicket!.status,
                        priority: 'Normal',
                        orderIncrementId: null,
                        lastReplyName: _initialTicket!.lastReplyName,
                        lastReplyAt: _initialTicket!.lastReplyAt,
                        messages: [],
                      )
                    : null);

            return Stack(
              children: [
                if (ticketDetails != null)
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: TicketInfoCard(ticket: ticketDetails),
                      ),

                      SliverToBoxAdapter(
                        child: TicketReplySection(
                          replyController: _replyController,
                          replyFocusNode: _replyFocusNode,
                          onAddPhotos: _addPhotos,
                          onDeletePhoto: _deletePhoto,
                          onCloseTicket: _closeTicket,
                          onPostReply: _postReply,
                          isSubmitting: isSubmitting,
                        ),
                      ),

                      if (ticketDetails.messages.isNotEmpty)
                        SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return TicketMessageItem(
                              message: ticketDetails.messages[index],
                            );
                          }, childCount: ticketDetails.messages.length),
                        ),

                      const SliverToBoxAdapter(
                        child: AppSpacing.groupToGroupGap,
                      ),
                    ],
                  ),
                if (isSubmitting && ticketDetails == null)
                  const AppLoader.fullPage(),
              ],
            );
          },
        ),
      ),
    ),
    );
  }
}
