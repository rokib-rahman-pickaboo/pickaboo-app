import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pickaboo/core/color/app_colors.dart';

void main() {
  testWidgets('AppTypography strictly 20 tokens verification', (tester) async {
    // ── 12 Changeable-Colour Tokens (Pre-baked defaults + fluent modifiers) ──
    // 1. heroTitle (22px, Bold w700, Navy)
    expect(AppTypography.heroTitle.fontSize, 22.0);
    expect(AppTypography.heroTitle.fontWeight, FontWeight.w700);
    expect(AppTypography.heroTitle.color, AppColors.navy);
    expect(AppTypography.heroTitle.white.color, AppColors.white);

    // 2. titleLarge (16px, Bold w700, Navy)
    expect(AppTypography.titleLarge.fontSize, 16.0);
    expect(AppTypography.titleLarge.fontWeight, FontWeight.w700);
    expect(AppTypography.titleLarge.color, AppColors.navy);
    expect(AppTypography.titleLarge.white.color, AppColors.white);

    // 3. titleMedium (14.5px, ExtraBold w800, Navy)
    expect(AppTypography.titleMedium.fontSize, 14.5);
    expect(AppTypography.titleMedium.fontWeight, FontWeight.w800);
    expect(AppTypography.titleMedium.color, AppColors.navy);

    // 4. titleSmall (12.5px, Bold w700, Navy)
    expect(AppTypography.titleSmall.fontSize, 12.5);
    expect(AppTypography.titleSmall.fontWeight, FontWeight.w700);
    expect(AppTypography.titleSmall.color, AppColors.navy);
    expect(AppTypography.titleSmall.blue.color, AppColors.pickabooBlue);

    // 5. titleMicro (11.5px, SemiBold w600, Navy)
    expect(AppTypography.titleMicro.fontSize, 11.5);
    expect(AppTypography.titleMicro.fontWeight, FontWeight.w600);
    expect(AppTypography.titleMicro.color, AppColors.navy);

    // 6. bodyLarge (13.5px, SemiBold w600, Navy)
    expect(AppTypography.bodyLarge.fontSize, 13.5);
    expect(AppTypography.bodyLarge.fontWeight, FontWeight.w600);
    expect(AppTypography.bodyLarge.color, AppColors.navy);

    // 7. bodyMedium (12px, Regular w400, Navy)
    expect(AppTypography.bodyMedium.fontSize, 12.0);
    expect(AppTypography.bodyMedium.fontWeight, FontWeight.w400);
    expect(AppTypography.bodyMedium.color, AppColors.navy);

    // 8. bodySmall (11px, Regular w400, Muted)
    expect(AppTypography.bodySmall.fontSize, 11.0);
    expect(AppTypography.bodySmall.fontWeight, FontWeight.w400);
    expect(AppTypography.bodySmall.color, AppColors.muted);
    expect(AppTypography.bodySmall.navy.color, AppColors.navy);

    // 9. bodyTiny (9.5px, Regular w400, Muted)
    expect(AppTypography.bodyTiny.fontSize, 9.5);
    expect(AppTypography.bodyTiny.fontWeight, FontWeight.w400);
    expect(AppTypography.bodyTiny.color, AppColors.muted);

    // 10. priceLarge (22px, Bold w700, Navy)
    expect(AppTypography.priceLarge.fontSize, 22.0);
    expect(AppTypography.priceLarge.fontWeight, FontWeight.w700);
    expect(AppTypography.priceLarge.color, AppColors.navy);
    expect(AppTypography.priceLarge.blue.color, AppColors.pickabooBlue);

    // 11. priceStandard (14.5px, Bold w700, Navy)
    expect(AppTypography.priceStandard.fontSize, 14.5);
    expect(AppTypography.priceStandard.fontWeight, FontWeight.w700);
    expect(AppTypography.priceStandard.color, AppColors.navy);

    // 12. button (12.5px, Bold w700, White)
    expect(AppTypography.button.fontSize, 12.5);
    expect(AppTypography.button.fontWeight, FontWeight.w700);
    expect(AppTypography.button.color, AppColors.white);
    expect(AppTypography.button.blue.color, AppColors.pickabooBlue);

    // ── 8 Fixed-Colour Tokens (Immutable single-purpose tokens) ───────────────
    // 13. savingsText (11.5px, Bold w700, Green)
    expect(AppTypography.savingsText.fontSize, 11.5);
    expect(AppTypography.savingsText.color, AppColors.green);

    // 14. priceStrike (11px, Regular w400, MutedLight, lineThrough)
    expect(AppTypography.priceStrike.fontSize, 11.0);
    expect(AppTypography.priceStrike.color, AppColors.mutedLight);
    expect(AppTypography.priceStrike.decoration, TextDecoration.lineThrough);

    // 15. brandTag (9.5px, ExtraBold w800, Blue)
    expect(AppTypography.brandTag.fontSize, 9.5);
    expect(AppTypography.brandTag.color, AppColors.pickabooBlue);

    // 16. deliveryTag (9.5px, SemiBold w600, Green)
    expect(AppTypography.deliveryTag.fontSize, 9.5);
    expect(AppTypography.deliveryTag.color, AppColors.green);

    // 17. brandAction (11.5px, SemiBold w600, Blue)
    expect(AppTypography.brandAction.fontSize, 11.5);
    expect(AppTypography.brandAction.color, AppColors.pickabooBlue);

    // 18. link (12px, Medium w500, Blue)
    expect(AppTypography.link.fontSize, 12.0);
    expect(AppTypography.link.color, AppColors.pickabooBlue);

    // 19. inputHint (13.5px, Regular w400, MutedLight)
    expect(AppTypography.inputHint.fontSize, 13.5);
    expect(AppTypography.inputHint.color, AppColors.mutedLight);

    // 20. inputError (11.5px, Medium w500, Red)
    expect(AppTypography.inputError.fontSize, 11.5);
    expect(AppTypography.inputError.color, AppColors.red);

    // ── Widget tree integration ──
    late TextStyle capturedStyle;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            capturedStyle = AppTypography.titleSmall;
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(capturedStyle.fontSize, 12.5);
    expect(capturedStyle.color, AppColors.navy);
  });
}
