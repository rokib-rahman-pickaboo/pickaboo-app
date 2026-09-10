// ============================================================================
// ✍️ ZERO-HARDCODE TYPOGRAPHY ENFORCED
// All text styles in this file originate from [AppTypography] design tokens.
// No direct [TextStyle] or [GoogleFonts] instantiations allowed.
// ============================================================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickaboo/presentation/navigation/route_constants.dart';
import 'package:pickaboo/presentation/ui/widgets/common/app_empty_view.dart';

/// Empty cart state view. Delegates directly to universal [AppEmptyView.cart].
class EmptyCartView extends StatelessWidget {
  final VoidCallback? onContinueShopping;

  const EmptyCartView({
    super.key,
    this.onContinueShopping,
  });

  @override
  Widget build(BuildContext context) {
    return AppEmptyView.cart(
      onContinueShopping: onContinueShopping ?? () => context.go(Routes.home),
    );
  }
}
