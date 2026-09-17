import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';
import 'package:pickaboo/domain/entity/place_picker/place_pick_result_entity.dart';

class PlaceSuggestionTile extends StatelessWidget {
  final PlacePickResultEntity place;
  final VoidCallback onTap;

  const PlaceSuggestionTile({
    super.key,
    required this.place,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final address = place.address ?? '';
    final subtitle = [place.area, place.city]
        .where((s) => s != null && s.isNotEmpty)
        .join(', ');

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const Icon(Icons.location_on_outlined, size: 20, color: AppColors.muted),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address,
                    style: AppTypography.bodyMedium.medium().withColor(AppColors.navy),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: AppTypography.bodySmall.withColor(AppColors.muted),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
