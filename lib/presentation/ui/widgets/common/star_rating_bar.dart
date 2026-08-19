import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarRatingBar extends StatelessWidget {
  final double rating;

  final double starSize;

  final int starCount;

  final Color filledColor;

  final Color emptyColor;

  const StarRatingBar({
    super.key,
    required this.rating,
    this.starSize = 12,
    this.starCount = 5,
    this.filledColor = const Color(0xFFFF5722),
    this.emptyColor = const Color(0xFFD5D5D5),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        final starPosition = index + 1;
        final double fillLevel;

        if (rating >= starPosition) {
          fillLevel = 1.0;
        } else if (rating > starPosition - 1) {
          fillLevel = rating - (starPosition - 1);
        } else {
          fillLevel = 0.0;
        }

        return Padding(
          padding: EdgeInsets.only(right: index < starCount - 1 ? 1.w : 0),
          child: SizedBox(
            width: starSize.w,
            height: starSize.w,
            child: fillLevel >= 1.0
                ? _buildStar(filledColor)
                : fillLevel <= 0.0
                ? _buildStar(emptyColor)
                : _buildPartialStar(fillLevel),
          ),
        );
      }),
    );
  }

  Widget _buildStar(Color color) {
    return SvgPicture.asset(
      'assets/new/svg/star_icon.svg',
      width: starSize.w,
      height: starSize.w,
      fit: BoxFit.contain,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }

  Widget _buildPartialStar(double fillLevel) {
    return Stack(
      children: [
        _buildStar(emptyColor),
        ClipRect(
          clipper: _StarClipper(fillLevel),
          child: _buildStar(filledColor),
        ),
      ],
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fillFraction;

  _StarClipper(this.fillFraction);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width * fillFraction, size.height);
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return fillFraction != oldClipper.fillFraction;
  }
}
