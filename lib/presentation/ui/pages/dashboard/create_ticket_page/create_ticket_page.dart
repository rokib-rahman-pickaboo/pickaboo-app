import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/order/order_item_entity.dart';
import 'package:pickaboo/presentation/bloc/order_bloc/order_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_bar_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/responsive_container.dart';
import 'package:pickaboo/presentation/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:pickaboo/data/model/ticket/create_ticket_model.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_bloc.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_event.dart';
import 'package:pickaboo/presentation/bloc/photo_picker_bloc/photo_picker_state.dart';
import 'package:pickaboo/core/theme/style/app_text_styles.dart';

class CreateTicketPage extends StatefulWidget {
  final VoidCallback? onRefresh;

  const CreateTicketPage({super.key, this.onRefresh});

  @override
  State<CreateTicketPage> createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  late OrderBloc _orderBloc;
  late TicketBloc _ticketBloc;
  late PhotoPickerBloc _photoPickerBloc;
  List<IssueType> _issueTypes = [];
  OrderItemEntity? _selectedOrder;
  IssueType? _selectedIssueType;
  bool _isLoading = false;
  bool _triedSubmit = false;

  @override
  void initState() {
    super.initState();
    _orderBloc = getIt<OrderBloc>();
    _ticketBloc = getIt<TicketBloc>();
    _photoPickerBloc = context.read<PhotoPickerBloc>();
    _orderBloc.add(const OrderEvent.getOrders());
    _loadData();
  }

  @override
  void dispose() {
    _orderBloc.close();
    _ticketBloc.close();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    try {

      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      setState(() {
        _issueTypes = [
          IssueType(id: '1', name: 'Delivery Issue'),
          IssueType(id: '2', name: 'Product Quality'),
          IssueType(id: '3', name: 'Payment Issue'),
          IssueType(id: '4', name: 'Return/Refund'),
          IssueType(id: '5', name: 'Other'),
        ];
      });
    } catch (e) {
      debugPrint('Error loading data: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _addPhotos() async {
    _photoPickerBloc.add(
      const PhotoPickerEvent.pickFromGallery(maxWidth: 500, maxHeight: 500),
    );
  }

  void _deletePhoto(int index) {
    _photoPickerBloc.add(PhotoPickerEvent.removeImageAtIndex(index));
  }

  Future<void> _submitTicket() async {
    setState(() => _triedSubmit = true);

    if (_selectedIssueType == null) {
      SnackBarUtils.showError(context, 'Please select issue type');
      return;
    }

    if (_subjectController.text.trim().isEmpty) {
      SnackBarUtils.showError(context, 'Please enter subject');
      return;
    }

    if (_messageController.text.trim().isEmpty) {
      SnackBarUtils.showError(context, 'Please enter message');
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    final images = _photoPickerBloc.state.images ?? [];

    final ticketData = CreateTicketModel(
      subject: _subjectController.text.trim(),
      body: _messageController.text.trim(),
      orderId: _selectedOrder?.orderId.toString(),
      issueType: _selectedIssueType!.name,
      attachments: images.isNotEmpty
          ? images.map((e) => File(e.path)).toList()
          : null,
    );

    _ticketBloc.add(TicketEvent.createTicket(ticketData));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return BlocProvider.value(
      value: _orderBloc,
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarButton(
            iconPath: 'assets/new/svg/back_nav_icon.svg',
            width: 7.w,
            height: 14.h,
            onPressed: () => Navigator.of(context).pop(),
            iconColor: colors.text,
          ),
          title: const Text('Support Ticket'),
        ),
        bottomNavigationBar: Container(
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
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submitTicket,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.button,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  disabledBackgroundColor: colors.grayLight,
                ),
                child: _isLoading
                    ? SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.w,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colors.white,
                          ),
                        ),
                      )
                    : Text(
                        'Submit Ticket',
                        style: textTheme.buttonMedium.copyWith(
                          color: colors.white,
                        ),
                      ),
              ),
            ),
          ),
        ),
        body: ResponsiveContainer(
          child: BlocListener<TicketBloc, TicketState>(
            bloc: _ticketBloc,
            listener: (context, state) {
              if (state.status == TicketStatus.loading) {
                setState(() => _isLoading = true);
              } else if (state.status == TicketStatus.success &&
                  state.successMessage != null) {
                setState(() => _isLoading = false);
                SnackBarUtils.showSuccess(context, state.successMessage!);
                widget.onRefresh?.call();
                context.pop();
              } else if (state.status == TicketStatus.error) {
                setState(() => _isLoading = false);
                SnackBarUtils.showError(
                  context,
                  state.error?.message ?? 'Failed to create ticket',
                );
              }
            },
            child: Column(
              children: [
                Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                            strokeWidth: 2.w,
                          ),
                        )
                      : BlocBuilder<OrderBloc, OrderState>(
                          builder: (context, state) {
                            final orders =
                                state.pagingState.pages
                                    ?.expand((i) => i)
                                    .toList() ??
                                [];

                            return CustomScrollView(
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              slivers: [
                                SliverPadding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                  ),
                                  sliver: SliverToBoxAdapter(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: colors.white,
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: colors.black.withValues(
                                              alpha: 0.05,
                                            ),
                                            blurRadius: 10.r,
                                            offset: Offset(0, 2.h),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(16.w),
                                            child: Text(
                                              'Create New Ticket',
                                              style: textTheme.bodyLargeMedium
                                                  .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    color: colors.text,
                                                  ),
                                            ),
                                          ),
                                          Divider(
                                            height: 1.h,
                                            color: colors.borderColor.withAlpha(
                                              76,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(16.w),
                                            child: Column(
                                              children: [
                                                _StyledDropdown<
                                                  OrderItemEntity
                                                >(
                                                  title: 'Order Number',
                                                  value: _selectedOrder,
                                                  items: orders,
                                                  hint: 'Select order',
                                                  itemLabelBuilder: (item) =>
                                                      '#${item.orderNumber}',
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selectedOrder = value;
                                                    });
                                                  },
                                                ),
                                                _StyledDropdown<IssueType>(
                                                  title: 'Issue Type *',
                                                  value: _selectedIssueType,
                                                  items: _issueTypes,
                                                  hint: 'Select issue type',
                                                  itemLabelBuilder: (item) =>
                                                      item.name,
                                                  hasError:
                                                      _triedSubmit &&
                                                      _selectedIssueType ==
                                                          null,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _selectedIssueType =
                                                          value;
                                                    });
                                                  },
                                                ),
                                                _TextInputField(
                                                  title: 'Subject *',
                                                  placeholder: 'Enter subject',
                                                  controller:
                                                      _subjectController,
                                                  multiline: false,
                                                ),
                                                _TextInputField(
                                                  title: 'Message *',
                                                  placeholder:
                                                      'Enter your message here',
                                                  controller:
                                                      _messageController,
                                                  multiline: true,
                                                ),
                                                SizedBox(height: 8.h),
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 48.h,
                                                  child: OutlinedButton.icon(
                                                    onPressed: _addPhotos,
                                                    style: OutlinedButton.styleFrom(
                                                      side: BorderSide(
                                                        color: colors.primary,
                                                        width: 1.5.w,
                                                      ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12.r,
                                                            ),
                                                      ),
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .add_photo_alternate_outlined,
                                                      color: colors.primary,
                                                      size: 22.sp,
                                                    ),
                                                    label: Text(
                                                      'Add Photos',
                                                      style: textTheme
                                                          .bodyMedium
                                                          .copyWith(
                                                            color:
                                                                colors.primary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                BlocBuilder<
                                                  PhotoPickerBloc,
                                                  PhotoPickerState
                                                >(
                                                  bloc: _photoPickerBloc,
                                                  builder: (context, state) {
                                                    final images =
                                                        state.images ?? [];
                                                    if (images.isEmpty) {
                                                      return const SizedBox.shrink();
                                                    }
                                                    return Column(
                                                      children: [
                                                        SizedBox(height: 16.h),
                                                        SizedBox(
                                                          height: 100.h,
                                                          child: ListView.separated(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                images.length,
                                                            separatorBuilder:
                                                                (_, _) =>
                                                                    SizedBox(
                                                                      width:
                                                                          8.w,
                                                                    ),
                                                            itemBuilder: (context, index) {
                                                              final image =
                                                                  images[index];
                                                              return Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                          12.r,
                                                                        ),
                                                                    child: Image.file(
                                                                      File(
                                                                        image
                                                                            .path,
                                                                      ),
                                                                      width:
                                                                          100.w,
                                                                      height:
                                                                          100.h,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top: 6.h,
                                                                    right: 6.w,
                                                                    child: GestureDetector(
                                                                      onTap: () =>
                                                                          _deletePhoto(
                                                                            index,
                                                                          ),
                                                                      child: Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                              4.w,
                                                                            ),
                                                                        decoration: BoxDecoration(
                                                                          color:
                                                                              colors.salmon,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              colors.white,
                                                                          size:
                                                                              14.sp,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: SizedBox(height: 24.h),
                                ),
                              ],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StyledDropdown<T> extends StatelessWidget {
  final String title;
  final T? value;
  final List<T> items;
  final String hint;
  final String Function(T) itemLabelBuilder;
  final ValueChanged<T?> onChanged;
  final bool hasError;

  const _StyledDropdown({
    required this.title,
    required this.value,
    required this.items,
    required this.hint,
    required this.itemLabelBuilder,
    required this.onChanged,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium.copyWith(
            color: colors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            hint: Text(
              hint,
              style: textTheme.bodyMedium.copyWith(color: colors.gray),
            ),
            items: items.map((T item) {
              final isSelected = value == item;
              return DropdownMenuItem<T>(
                value: item,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        itemLabelBuilder(item),
                        style: textTheme.bodyMedium.copyWith(
                          color: isSelected ? colors.primary : colors.text,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons.check_circle_rounded,
                        color: colors.primary,
                        size: 20.r,
                      ),
                  ],
                ),
              );
            }).toList(),
            value: value,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: 54.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: hasError
                      ? colors.red.withValues(alpha: 0.8)
                      : colors.borderColor.withValues(alpha: 0.5),
                  width: hasError ? 1.5 : 1,
                ),
                color: colors.white,
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down_rounded, color: colors.gray),
              iconSize: 24.sp,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300.h,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: colors.white,
                boxShadow: [
                  BoxShadow(
                    color: colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              offset: const Offset(0, -4),
              scrollbarTheme: ScrollbarThemeData(
                radius: Radius.circular(40.r),
                thickness: WidgetStateProperty.all(6),
                thumbVisibility: WidgetStateProperty.all(true),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _TextInputField extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextEditingController controller;
  final bool multiline;

  const _TextInputField({
    required this.title,
    required this.placeholder,
    required this.controller,
    required this.multiline,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textTheme = context.textStyle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyMedium.copyWith(
            color: colors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          maxLines: multiline ? 5 : 1,
          style: textTheme.bodyMedium.copyWith(color: colors.text),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: textTheme.bodyMedium.copyWith(color: colors.gray),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colors.borderColor.withValues(alpha: 0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: colors.borderColor.withValues(alpha: 0.5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: colors.primary, width: 1.5),
            ),
            contentPadding: EdgeInsets.all(16.w),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class IssueType {
  final String id;
  final String name;

  IssueType({required this.id, required this.name});
}
