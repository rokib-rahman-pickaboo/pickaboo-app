import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class SearchablePickerSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;

  final String Function(T item) labelBuilder;

  final String? Function(T item)? subtitleBuilder;

  final bool Function(T item)? isSelected;

  final String searchHint;
  final int searchThreshold;

  const SearchablePickerSheet({
    super.key,
    required this.title,
    required this.items,
    required this.labelBuilder,
    this.subtitleBuilder,
    this.isSelected,
    this.searchHint = 'Search…',
    this.searchThreshold = 8,
  });

  @override
  State<SearchablePickerSheet<T>> createState() =>
      _SearchablePickerSheetState<T>();
}

class _SearchablePickerSheetState<T> extends State<SearchablePickerSheet<T>> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<T> get _filtered {
    if (_query.isEmpty) return widget.items;
    final q = _query.toLowerCase();
    return widget.items.where((item) {
      final label = widget.labelBuilder(item).toLowerCase();
      final subtitle = widget.subtitleBuilder?.call(item)?.toLowerCase() ?? '';
      return label.contains(q) || subtitle.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final showSearch = widget.items.length > widget.searchThreshold;
    final filtered = _filtered;

    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        16.w,
        16.w,
        16.w +
            MediaQuery.of(context).padding.bottom +
            MediaQuery.of(context).viewInsets.bottom,
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: AppTypography.titleLarge.copyWith(color: AppColors.text),
          ),
          SizedBox(height: 16.h),
          if (showSearch) ...[
            TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v.trim()),
              style: AppTypography.bodyLarge.regular().copyWith(color: AppColors.text),
              decoration: InputDecoration(
                hintText: widget.searchHint,
                hintStyle: AppTypography.inputHint.copyWith(
                  color: AppColors.muted.withValues(alpha: 0.5),
                ),
                prefixIcon: Icon(Icons.search, color: AppColors.muted, size: 20.r),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: AppColors.muted, size: 18.r),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _query = '');
                        },
                      )
                    : null,
                isDense: true,
                filled: true,
                fillColor: AppColors.pageBg,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                border: const OutlineInputBorder(
                  borderRadius: AppRadius.inputRadius,
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: AppRadius.inputRadius,
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: AppRadius.inputRadius,
                  borderSide: BorderSide(color: AppColors.pickabooBlue),
                ),
              ),
            ),
            SizedBox(height: 12.h),
          ],
          Flexible(
            child: filtered.isEmpty
                ? Padding(
                    padding: EdgeInsets.all(24.h),
                    child: Text(
                      'No results for "$_query"',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.muted,
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final item = filtered[index];
                      final subtitle = widget.subtitleBuilder?.call(item);
                      return ListTile(
                        title: Text(
                          widget.labelBuilder(item),
                          style: AppTypography.bodyMedium,
                        ),
                        subtitle: subtitle != null && subtitle.isNotEmpty
                            ? Text(
                                subtitle,
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.muted,
                                ),
                              )
                            : null,
                        trailing: widget.isSelected?.call(item) == true
                            ? const Icon(Icons.check, color: AppColors.pickabooBlue)
                            : null,
                        onTap: () => Navigator.pop(context, item),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
