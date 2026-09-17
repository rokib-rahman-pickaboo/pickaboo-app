// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:io';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/data/model/ticket/create_ticket_model.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_issue_type_entity.dart';
import 'package:pickaboo/domain/entity/ticket/ticket_order_entity.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/ticket_bloc/ticket_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_card.dart';
import 'package:pickaboo/presentation/ui/widgets/common/pickaboo_app_bar.dart';

class CreateTicketPage extends StatefulWidget {
  final VoidCallback? onRefresh;

  const CreateTicketPage({super.key, this.onRefresh});

  @override
  State<CreateTicketPage> createState() => _CreateTicketPageState();
}

class _CreateTicketPageState extends State<CreateTicketPage> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  late TicketBloc _ticketBloc;
  TicketOrderEntity? _selectedOrder;
  TicketIssueTypeEntity? _selectedIssueType;
  final List<File> _selectedFiles = [];
  bool _isLoading = false;
  bool _triedSubmit = false;

  static const List<TicketIssueTypeEntity> _fallbackIssueTypes = [
    TicketIssueTypeEntity(id: '1', name: 'Delivery Issue'),
    TicketIssueTypeEntity(id: '2', name: 'Customer Support'),
    TicketIssueTypeEntity(id: '3', name: 'Product Return/Exchange'),
    TicketIssueTypeEntity(id: '4', name: 'After Sales/Warranty Claim'),
    TicketIssueTypeEntity(id: '5', name: 'Payment Issue'),
    TicketIssueTypeEntity(id: '6', name: 'Other'),
  ];

  @override
  void initState() {
    super.initState();
    _ticketBloc = getIt<TicketBloc>();
    _ticketBloc.add(const TicketEvent.getTicketOrders());
  }

  @override
  void dispose() {
    _ticketBloc.close();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  static const int _maxFileSizeBytes = 10 * 1024 * 1024; // 10MB limit per file
  static const int _maxTotalSizeBytes = 25 * 1024 * 1024; // 25MB total limit

  Future<File> _processPickedFile(File file) async {
    final ext = file.path.split('.').last.toLowerCase();
    final isImage = ['jpg', 'jpeg', 'png', 'webp'].contains(ext);

    if (isImage) {
      try {
        final bytes = await file.readAsBytes();
        if (bytes.length > 500 * 1024) {
          final compressed = await compute(_compressImageBytes, bytes);
          if (compressed != null && compressed.length < bytes.length) {
            final fileName = file.path.split('/').last.split('.').first;
            final tempPath =
                '${Directory.systemTemp.path}/${fileName}_${DateTime.now().millisecondsSinceEpoch}.jpg';
            final tempFile = File(tempPath);
            await tempFile.writeAsBytes(compressed);
            return tempFile;
          }
        }
      } catch (e) {
        debugPrint('Failed to compress image: $e');
      }
    }
    return file;
  }

  Future<void> _showAttachmentPickerOptions() async {
    if (_selectedFiles.length >= 5) {
      SnackBarUtils.showWarning(context, AppStrings.maxFilesAllowed);
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Attachment',
                  style: AppTypography.titleMedium,
                ),
                SizedBox(height: 16.h),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.photo_library_outlined,
                      color: AppColors.pickabooBlue,
                      size: 22.sp,
                    ),
                  ),
                  title: Text(
                    'Choose from Gallery',
                    style: AppTypography.bodyLarge.regular(),
                  ),
                  subtitle: Text(
                    'JPG, JPEG, PNG (Auto-compressed)',
                    style: AppTypography.bodySmall.copyWith(fontSize: 12.sp),
                  ),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImagesFromGallery();
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.pickabooBlue,
                      size: 22.sp,
                    ),
                  ),
                  title: Text(
                    'Take a Photo',
                    style: AppTypography.bodyLarge.regular(),
                  ),
                  subtitle: Text(
                    'Capture with camera',
                    style: AppTypography.bodySmall.copyWith(fontSize: 12.sp),
                  ),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickImageFromCamera();
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.pickabooBlue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.insert_drive_file_outlined,
                      color: AppColors.pickabooBlue,
                      size: 22.sp,
                    ),
                  ),
                  title: Text(
                    'Choose Document / File',
                    style: AppTypography.bodyLarge.regular(),
                  ),
                  subtitle: Text(
                    'PDF, JPG, PNG (Max 10MB)',
                    style: AppTypography.bodySmall.copyWith(fontSize: 12.sp),
                  ),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    Navigator.pop(ctx);
                    _pickFilesFromStorage();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImagesFromGallery() async {
    final remainingSlots = 5 - _selectedFiles.length;
    if (remainingSlots <= 0) return;

    try {
      final picker = ImagePicker();
      final pickedFiles = await picker.pickMultiImage(
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
        requestFullMetadata: false,
      );

      if (pickedFiles.isNotEmpty) {
        final List<File> filesToAdd = [];
        for (final xFile in pickedFiles.take(remainingSlots)) {
          final file = File(xFile.path);
          final fileSize = await file.length();
          if (fileSize > _maxFileSizeBytes) {
            if (mounted) {
              final fileName = file.path.split('/').last;
              SnackBarUtils.showWarning(
                context,
                '$fileName exceeds 10MB limit. Please choose a smaller file.',
              );
            }
            continue;
          }
          filesToAdd.add(file);
        }

        if (filesToAdd.isNotEmpty && mounted) {
          setState(() {
            _selectedFiles.addAll(filesToAdd);
          });
        }

        if (pickedFiles.length > remainingSlots && mounted) {
          SnackBarUtils.showInfo(
            context,
            'Only $remainingSlots file(s) added (max 5 files allowed)',
          );
        }
      }
    } catch (e) {
      debugPrint('Error picking from gallery: $e');
    }
  }

  Future<void> _pickImageFromCamera() async {
    if (_selectedFiles.length >= 5) return;

    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
        requestFullMetadata: false,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        final fileSize = await file.length();
        if (fileSize > _maxFileSizeBytes) {
          if (mounted) {
            SnackBarUtils.showWarning(
              context,
              'Image exceeds 10MB limit. Please choose a smaller file.',
            );
          }
          return;
        }

        if (mounted) {
          setState(() {
            _selectedFiles.add(file);
          });
        }
      }
    } catch (e) {
      debugPrint('Error capturing photo: $e');
    }
  }

  Future<void> _pickFilesFromStorage() async {
    if (_selectedFiles.length >= 5) {
      SnackBarUtils.showWarning(context, AppStrings.maxFilesAllowed);
      return;
    }

    final remainingSlots = 5 - _selectedFiles.length;

    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        final rawFiles = result.paths
            .where((path) => path != null)
            .map((path) => File(path!))
            .take(remainingSlots)
            .toList();

        final List<File> processedFiles = [];
        for (final file in rawFiles) {
          final processed = await _processPickedFile(file);
          final fileSize = await processed.length();
          if (fileSize > _maxFileSizeBytes) {
            if (mounted) {
              final fileName = file.path.split('/').last;
              SnackBarUtils.showWarning(
                context,
                '$fileName exceeds 10MB limit. Please choose a smaller file.',
              );
            }
            continue;
          }
          processedFiles.add(processed);
        }

        if (processedFiles.isNotEmpty && mounted) {
          setState(() {
            _selectedFiles.addAll(processedFiles);
          });
        }

        if (result.files.length > remainingSlots && mounted) {
          SnackBarUtils.showInfo(
            context,
            'Only $remainingSlots file(s) added (max 5 files allowed)',
          );
        }
      }
    } catch (e) {
      debugPrint('Error picking files: $e');
    }
  }

  void _removeFile(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Future<void> _submitTicket() async {
    setState(() => _triedSubmit = true);

    if (_subjectController.text.trim().isEmpty) {
      SnackBarUtils.showError(context, AppStrings.enterSubject);
      return;
    }

    if (_selectedIssueType == null) {
      SnackBarUtils.showError(context, AppStrings.selectIssueType);
      return;
    }

    if (_messageController.text.trim().isEmpty) {
      SnackBarUtils.showError(context, AppStrings.enterMessage);
      return;
    }

    // Validate total attachments size to prevent server entity too large error
    int totalBytes = 0;
    for (final f in _selectedFiles) {
      if (f.existsSync()) {
        totalBytes += f.lengthSync();
      }
    }
    if (totalBytes > _maxTotalSizeBytes) {
      SnackBarUtils.showWarning(
        context,
        'Total attachment size exceeds 25MB limit. Please remove or reduce files.',
      );
      return;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    final ticketData = CreateTicketModel(
      subject: _subjectController.text.trim(),
      body: _messageController.text.trim(),
      orderId: _selectedOrder?.orderId,
      issueType: _selectedIssueType!.name,
      attachments: _selectedFiles.isNotEmpty ? _selectedFiles : null,
    );

    _ticketBloc.add(TicketEvent.createTicket(ticketData));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _ticketBloc,
      child: Scaffold(
        backgroundColor: AppColors.pageBg,
        appBar: const PickabooAppBar(
          title: 'Support Ticket',
        ),
        bottomNavigationBar: Container(
          color: AppColors.pageBg,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.sameGroupItemSpacing.w,
            vertical: 12.h,
          ),
          child: SafeArea(
            top: false,
            child: AppButton.primary(
              text: 'Submit Ticket',
              isLoading: _isLoading,
              isFullWidth: true,
              height: 48.h,
              borderRadius: BorderRadius.circular(10.r),
              onPressed: _isLoading ? null : _submitTicket,
            ),
          ),
        ),
        body: BlocListener<TicketBloc, TicketState>(
          bloc: _ticketBloc,
          listener: (context, state) {
            if (state.status == TicketStatus.loading && _triedSubmit) {
              setState(() => _isLoading = true);
            } else if (state.status == TicketStatus.success &&
                state.successMessage != null) {
              setState(() => _isLoading = false);
              SnackBarUtils.showSuccess(
                context,
                state.successMessage ?? AppStrings.operationSuccessful,
              );
              widget.onRefresh?.call();
              context.pop();
            } else if (state.status == TicketStatus.error && _triedSubmit) {
              setState(() => _isLoading = false);
              SnackBarUtils.showError(
                context,
                state.error?.message ?? 'Failed to create ticket',
              );
            }
          },
          child: BlocBuilder<TicketBloc, TicketState>(
            builder: (context, state) {
              final orders = state.orders;
              final issueTypes = state.issueTypes.isNotEmpty
                  ? state.issueTypes
                  : _fallbackIssueTypes;

              final remainingSlots = 5 - _selectedFiles.length;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sameGroupItemSpacing.w,
                  vertical: AppSpacing.sameGroupItemSpacing.h,
                ),
                child: Column(
                  children: [
                    AppCard(
                      padding: EdgeInsets.all(
                        AppSpacing.sameGroupItemSpacing.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Support Ticket',
                            style: AppTypography.titleLarge,
                          ),
                          SizedBox(height: 16.h),

                          // ── 1. Order Number (Optional) ──
                          Row(
                            children: [
                              Text(
                                'Order Number',
                                style: AppTypography.bodyLarge,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '(Optional)',
                                style: AppTypography.bodySmall
                                    .copyWith(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.pageBg,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<TicketOrderEntity?>(
                                isExpanded: true,
                                hint: Text(
                                  state.status == TicketStatus.loading && orders.isEmpty
                                      ? 'Loading orders...'
                                      : 'Select order number',
                                  style: AppTypography.inputHint,
                                ),
                                value: _selectedOrder,
                                items: [
                                  DropdownMenuItem<TicketOrderEntity?>(
                                    value: null,
                                    child: Text(
                                      'Select order number',
                                      style: AppTypography.inputHint,
                                    ),
                                  ),
                                  ...orders.map((order) {
                                    final number = order.displayName;
                                    return DropdownMenuItem<TicketOrderEntity?>(
                                      value: order,
                                      child: Text(
                                        'Order #$number',
                                        style: AppTypography.bodyLarge.regular(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    );
                                  }),
                                ],
                                onChanged: (val) =>
                                    setState(() => _selectedOrder = val),
                              ),
                            ),
                          ),

                          SizedBox(height: 14.h),

                          // ── 2. Subject * ──
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Subject ',
                                  style: AppTypography.bodyLarge,
                                ),
                                TextSpan(
                                  text: '*',
                                  style: AppTypography.bodyLarge.red,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6.h),
                          TextField(
                            controller: _subjectController,
                            style: AppTypography.bodyLarge.regular(),
                            decoration: InputDecoration(
                              hintText: 'Enter subject',
                              hintStyle: AppTypography.inputHint,
                              filled: true,
                              fillColor: AppColors.pageBg,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: AppColors.border,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: _triedSubmit &&
                                          _subjectController.text.trim().isEmpty
                                      ? AppColors.red
                                      : AppColors.border,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: AppColors.pickabooBlue,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 12.h,
                              ),
                            ),
                          ),

                          SizedBox(height: 14.h),

                          // ── 3. Issue Type * ──
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Issue Type ',
                                  style: AppTypography.bodyLarge,
                                ),
                                TextSpan(
                                  text: '*',
                                  style: AppTypography.bodyLarge.red,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.pageBg,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: _triedSubmit &&
                                        _selectedIssueType == null
                                    ? AppColors.red
                                    : AppColors.border,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<TicketIssueTypeEntity>(
                                isExpanded: true,
                                hint: Text(
                                  'Select issue type',
                                  style: AppTypography.inputHint,
                                ),
                                value: _selectedIssueType,
                                items: issueTypes.map((issue) {
                                  return DropdownMenuItem<
                                      TicketIssueTypeEntity>(
                                    value: issue,
                                    child: Text(
                                      issue.name,
                                      style: AppTypography.bodyLarge.regular(),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (val) =>
                                    setState(() => _selectedIssueType = val),
                              ),
                            ),
                          ),

                          SizedBox(height: 14.h),

                          // ── 4. Message * ──
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Message ',
                                  style: AppTypography.bodyLarge,
                                ),
                                TextSpan(
                                  text: '*',
                                  style: AppTypography.bodyLarge.red,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6.h),
                          TextField(
                            controller: _messageController,
                            maxLines: 5,
                            minLines: 4,
                            style: AppTypography.bodyLarge.regular(),
                            decoration: InputDecoration(
                              hintText: 'Enter your message',
                              hintStyle: AppTypography.inputHint,
                              filled: true,
                              fillColor: AppColors.pageBg,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: AppColors.border,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: _triedSubmit &&
                                          _messageController.text.trim().isEmpty
                                      ? AppColors.red
                                      : AppColors.border,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(
                                  color: AppColors.pickabooBlue,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(14.w),
                            ),
                          ),

                          SizedBox(height: 16.h),

                          // ── 5. Attachments (jpg, jpeg, png, pdf) - Max 5 files ──
                          Text(
                            'Attachments (jpg, jpeg, png, pdf) - Max 5 files',
                            style: AppTypography.bodyLarge,
                          ),
                          SizedBox(height: 8.h),

                          // Dashed upload container
                          InkWell(
                            onTap: remainingSlots > 0
                                ? _showAttachmentPickerOptions
                                : null,
                            borderRadius: BorderRadius.circular(10.r),
                            child: CustomPaint(
                              painter: _DashedRectPainter(
                                color: remainingSlots > 0
                                    ? AppColors.pickabooBlue
                                    : AppColors.border,
                                strokeWidth: 1.2.w,
                                dash: 5.0,
                                gap: 4.0,
                                radius: 10.r,
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 24.h,
                                  horizontal: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload_outlined,
                                      color: remainingSlots > 0
                                          ? AppColors.pickabooBlue
                                          : AppColors.muted,
                                      size: 32.sp,
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      remainingSlots > 0
                                          ? 'Choose Files ($remainingSlots slots remaining)'
                                          : 'Maximum 5 files selected',
                                      style: AppTypography.titleSmall.withColor(
                                        remainingSlots > 0
                                          ? AppColors.pickabooBlue
                                          : AppColors.muted,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Attachments preview list
                          if (_selectedFiles.isNotEmpty) ...[
                            SizedBox(height: 12.h),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _selectedFiles.length,
                              separatorBuilder: (_, _) => SizedBox(height: 8.h),
                              itemBuilder: (context, index) {
                                final file = _selectedFiles[index];
                                final isPdf = file.path
                                    .toLowerCase()
                                    .endsWith('.pdf');
                                final fileName = file.path.split('/').last;
                                final fileSize = file.existsSync()
                                    ? _formatFileSize(file.lengthSync())
                                    : '';

                                return InkWell(
                                  onTap: () => _removeFile(index),
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 8.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.pageBg,
                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                        color: AppColors.border,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        if (isPdf)
                                          Container(
                                            width: 38.w,
                                            height: 38.h,
                                            decoration: BoxDecoration(
                                              color: AppColors.red
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                            ),
                                            child: Icon(
                                              Icons.picture_as_pdf_rounded,
                                              color: AppColors.red,
                                              size: 20.sp,
                                            ),
                                          )
                                        else
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6.r),
                                            child: Image.file(
                                              file,
                                              width: 38.w,
                                              height: 38.h,
                                              fit: BoxFit.cover,
                                              errorBuilder: (_, __, ___) =>
                                                  Container(
                                                width: 38.w,
                                                height: 38.h,
                                                color: AppColors.border,
                                                child: const Icon(
                                                  Icons.image_not_supported,
                                                ),
                                              ),
                                            ),
                                          ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                fileName,
                                                style: AppTypography.bodyLarge.regular(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              if (fileSize.isNotEmpty) ...[
                                                SizedBox(height: 2.h),
                                                Text(
                                                  fileSize,
                                                  style: AppTypography.bodySmall
                                                      .copyWith(fontSize: 11.sp),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Custom painter to draw a smooth dashed border with rounded corners.
class _DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dash;
  final double gap;
  final double radius;

  _DashedRectPainter({
    required this.color,
    this.strokeWidth = 1.2,
    this.dash = 5.0,
    this.gap = 4.0,
    this.radius = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            strokeWidth / 2,
            strokeWidth / 2,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(radius),
        ),
      );

    final Path dashedPath = Path();
    for (final PathMetric metric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double len = (distance + dash < metric.length)
            ? dash
            : metric.length - distance;
        dashedPath.addPath(
          metric.extractPath(distance, distance + len),
          Offset.zero,
        );
        distance += dash + gap;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(_DashedRectPainter oldDelegate) =>
      color != oldDelegate.color ||
      strokeWidth != oldDelegate.strokeWidth ||
      dash != oldDelegate.dash ||
      gap != oldDelegate.gap ||
      radius != oldDelegate.radius;
}

Uint8List? _compressImageBytes(Uint8List inputBytes) {
  try {
    final image = img.decodeImage(inputBytes);
    if (image == null) return null;

    img.Image resized = image;
    const maxDim = 1280;
    if (image.width > maxDim || image.height > maxDim) {
      if (image.width > image.height) {
        resized = img.copyResize(image, width: maxDim);
      } else {
        resized = img.copyResize(image, height: maxDim);
      }
    }
    return Uint8List.fromList(img.encodeJpg(resized, quality: 80));
  } catch (_) {
    return null;
  }
}
