// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/core/theme/app_decorations.dart';
import 'package:pickaboo/core/utils/snackbar_utils/snack_bar_utils.dart';
import 'package:pickaboo/domain/entity/common/product/product_entity.dart';
import 'package:pickaboo/domain/entity/product_detail/product_detail_entity.dart';
import 'package:pickaboo/domain/repository/product_repository.dart';
import 'package:pickaboo/domain/repository/search_repository.dart';
import 'package:pickaboo/injection.dart';
import 'package:pickaboo/presentation/bloc/compare_bloc/compare_bloc.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_button.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_image.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_search_bar.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_loader.dart';

class AddProductCompareBottomSheet extends StatefulWidget {
  final ProductDetailEntity? baseProduct;

  const AddProductCompareBottomSheet({
    super.key,
    this.baseProduct,
  });

  static Future<void> show(
    BuildContext context, {
    ProductDetailEntity? baseProduct,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.transparent,
      builder: (context) => AddProductCompareBottomSheet(
        baseProduct: baseProduct,
      ),
    );
  }

  @override
  State<AddProductCompareBottomSheet> createState() =>
      _AddProductCompareBottomSheetState();
}

class _AddProductCompareBottomSheetState
    extends State<AddProductCompareBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounceTimer;

  bool _isLoading = false;
  String? _loadingProductId;
  List<ProductEntity> _searchResults = [];
  List<ProductEntity> _suggestedProducts = [];
  String _currentQuery = '';

  @override
  void initState() {
    super.initState();
    _loadInitialSuggestions();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadInitialSuggestions() async {
    final base = widget.baseProduct;
    if (base == null) return;

    setState(() => _isLoading = true);

    try {
      // ── Priority 1: Fetch products from the base product's exact category ──
      final categoryId = base.categoryIds.lastWhereOrNull((id) => id != '2') ??
          (base.categoryIds.isNotEmpty ? base.categoryIds.last : null);

      if (categoryId != null && categoryId.isNotEmpty) {
        final categoryResult = await getIt<ProductRepository>().getCategoryProducts(
          categoryKey: categoryId,
          prodLimit: 20,
          currentPage: 1,
          featProdLimit: 0,
        );

        if (!mounted) return;

        bool loaded = false;
        categoryResult.fold(
          (_) {},
          (catData) {
            final filtered = catData.products
                .where((p) => p.id != base.id.toString())
                .toList();
            if (filtered.isNotEmpty) {
              setState(() {
                _suggestedProducts = filtered;
                _isLoading = false;
              });
              loaded = true;
            }
          },
        );

        if (loaded) return;
      }

      // ── Priority 2: Use PDP similar products ──
      if (base.similarProducts.isNotEmpty) {
        final filtered = base.similarProducts
            .where((p) => p.id != base.id.toString())
            .toList();
        if (filtered.isNotEmpty) {
          setState(() {
            _suggestedProducts = filtered;
            _isLoading = false;
          });
          return;
        }
      }

      // ── Priority 3: Fallback to Brand/Keyword Search ──
      final query = base.brand.isNotEmpty ? base.brand : base.name.split(' ').first;
      final result = await getIt<SearchRepository>().search(
        query: query,
        maxResults: 20,
      );

      if (!mounted) return;

      result.fold(
        (l) => setState(() => _isLoading = false),
        (r) {
          final filtered = r.products
              .where((p) => p.id != base.id.toString())
              .toList();
          setState(() {
            _suggestedProducts = filtered;
            _isLoading = false;
          });
        },
      );
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    final trimmed = query.trim();
    if (trimmed == _currentQuery) return;

    if (trimmed.isEmpty) {
      setState(() {
        _currentQuery = '';
        _searchResults = [];
        _isLoading = false;
      });
      return;
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      setState(() {
        _currentQuery = trimmed;
        _isLoading = true;
      });

      final result = await getIt<SearchRepository>().search(
        query: trimmed,
        maxResults: 30,
      );

      if (!mounted) return;

      result.fold(
        (error) => setState(() {
          _searchResults = [];
          _isLoading = false;
        }),
        (searchResult) {
          final base = widget.baseProduct;
          final products = base != null
              ? searchResult.products
                  .where((p) => p.id != base.id.toString())
                  .toList()
              : searchResult.products;
          setState(() {
            _searchResults = products;
            _isLoading = false;
          });
        },
      );
    });
  }

  Future<void> _onSelectProduct(ProductEntity product) async {
    if (_loadingProductId != null) return;
    setState(() => _loadingProductId = product.id);

    try {
      final result = await getIt<ProductRepository>().getProductDetail(
        productId: product.id,
      );

      if (!mounted) return;

      result.fold(
        (error) {
          SnackBarUtils.showWarning(context, error.message);
          setState(() => _loadingProductId = null);
        },
        (detail) {
          // Verify category compatibility before adding
          final base = widget.baseProduct;
          if (base != null) {
            const restrictedCategories = ['171', '7', '1837', '20', '4', '197'];
            final baseRestricted = base.categoryIds
                .where((id) => restrictedCategories.contains(id))
                .toSet();
            final newRestricted = detail.categoryIds
                .where((id) => restrictedCategories.contains(id))
                .toSet();

            bool isMismatch = false;
            if (baseRestricted.isNotEmpty || newRestricted.isNotEmpty) {
              if (baseRestricted.intersection(newRestricted).isEmpty) {
                isMismatch = true;
              }
            } else if (base.categoryIds.isNotEmpty && detail.categoryIds.isNotEmpty) {
              final baseCats = base.categoryIds.where((id) => id != '2').toSet();
              final newCats = detail.categoryIds.where((id) => id != '2').toSet();
              if (baseCats.isNotEmpty && newCats.isNotEmpty && baseCats.intersection(newCats).isEmpty) {
                isMismatch = true;
              }
            }

            if (isMismatch) {
              SnackBarUtils.showWarning(
                context,
                'You can only compare products of the same category.',
                position: ToastPosition.top,
              );
              setState(() => _loadingProductId = null);
              return;
            }
          }

          context.read<CompareBloc>().add(CompareEvent.add(product: detail));
          Navigator.of(context).pop();
        },
      );
    } catch (e) {
      if (mounted) {
        SnackBarUtils.showWarning(
          context,
          'Failed to load product details: $e',
          position: ToastPosition.top,
        );
        setState(() => _loadingProductId = null);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayedList = _currentQuery.isNotEmpty ? _searchResults : _suggestedProducts;
    final compareState = context.watch<CompareBloc>().state;
    final comparedIds = compareState.products.map((p) => p.id.toString()).toSet();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.82,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.navy.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          // Drag handle
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.sameGroupItemSpacing.w,
              12.h,
              AppSpacing.sameGroupItemSpacing.w,
              8.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Product to Compare',
                        style: AppTypography.titleLarge,
                      ),
                      if (widget.baseProduct != null) ...[
                        SizedBox(height: 2.h),
                        Text(
                          'Comparing against: ${widget.baseProduct!.name}',
                          style: AppTypography.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(width: AppSpacing.sameGroupItemSpacing.w),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: AppColors.mutedLight,
                    size: 24.sp,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppColors.border),

          // Search Bar
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.sameGroupItemSpacing.w,
              8.h,
              AppSpacing.sameGroupItemSpacing.w,
              8.h,
            ),
            child: AppSearchBar(
              controller: _searchController,
              hintText: 'Search product name, brand or model...',
              onChanged: (val) {
                _onSearchChanged(val);
                setState(() {});
              },
              onClear: () {
                _searchController.clear();
                _onSearchChanged('');
                setState(() {});
              },
            ),
          ),

          // Title for list
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sameGroupItemSpacing.w,
            ),
            child: Row(
              children: [
                Text(
                  _currentQuery.isNotEmpty
                      ? 'Search Results (${displayedList.length})'
                      : 'Suggested Products',
                  style: AppTypography.titleSmall,
                ),
              ],
            ),
          ),
          SizedBox(height: 6.h),

          // List Body
          Expanded(
            child: _isLoading
                ? const AppLoader.fullPage()
                : displayedList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 40.sp,
                              color: AppColors.mutedLight,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              _currentQuery.isNotEmpty
                                  ? 'No matching products found'
                                  : 'No suggestions available',
                              style: AppTypography.bodySmall,
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(
                          AppSpacing.sameGroupItemSpacing.w,
                          4.h,
                          AppSpacing.sameGroupItemSpacing.w,
                          AppSpacing.groupToGroupSpacing.h,
                        ),
                        itemCount: displayedList.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: AppSpacing.sameGroupItemSpacing.h),
                        itemBuilder: (context, index) {
                          final item = displayedList[index];
                          final isSelectingThis =
                              _loadingProductId == item.id;
                          final isAlreadyInComparison =
                              comparedIds.contains(item.id);

                          return _buildProductTile(
                            item,
                            isSelectingThis: isSelectingThis,
                            isAlreadyInComparison: isAlreadyInComparison,
                          );
                        },
                      ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildProductTile(
    ProductEntity item, {
    required bool isSelectingThis,
    required bool isAlreadyInComparison,
  }) {
    final price = item.finalPrice;
    final originalPrice = item.originalPrice;
    final discount = item.computedDiscountPercentage;

    return Container(
      padding: EdgeInsets.all(AppSpacing.sameGroupItemSpacing.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppRadius.cardRadius,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          // Image
          SizedBox(
            width: 56.w,
            height: 56.w,
            child: AppImage(
              imageUrl: item.productImg,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: AppSpacing.sameGroupItemSpacing.w),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.titleSmall,
                ),
                SizedBox(height: 4.h),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 6.w,
                  runSpacing: 2.h,
                  children: [
                    Text(
                      '৳ $price',
                      style: AppTypography.brandAction,
                    ),
                    if (originalPrice > price) ...[
                      Text(
                        '৳ $originalPrice',
                        style: AppTypography.priceStrike,
                      ),
                      if (discount > 0) ...[
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.red.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            '$discount% OFF',
                            style: AppTypography.bodyMedium.extraBold().red,
                          ),
                        ),
                      ],
                    ],
                  ],
                ),
              ],
            ),
          ),
          AppSpacing.gapH8,

          // Add Button
          if (isAlreadyInComparison)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.pageBg,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                'Added',
                style: AppTypography.bodySmall,
              ),
            )
          else
            AppButton(
              type: AppButtonType.secondary,
              backgroundColor: AppColors.surfaceBlue,
              textColor: AppColors.pickabooBlue,
              borderColor: AppColors.pickabooBlue,
              size: AppButtonSize.sm,
              isFullWidth: false,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              onPressed: isSelectingThis ? null : () => _onSelectProduct(item),
              isLoading: isSelectingThis,
              icon: Icon(Icons.add, size: 14.sp, color: AppColors.pickabooBlue),
              text: 'Compare',
              textStyle: AppTypography.brandTag,
            ),
        ],
      ),
    );
  }
}
