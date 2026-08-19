import 'package:flutter/material.dart';
import 'package:pickaboo/core/color/app_colors.dart';

class AnimatedPin extends StatefulWidget {
  final bool isDragging;

  const AnimatedPin({super.key, required this.isDragging});

  @override
  State<AnimatedPin> createState() => _AnimatedPinState();
}

class _AnimatedPinState extends State<AnimatedPin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0, end: -12).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, widget.isDragging ? _bounceAnimation.value : 0),
          child: child,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_pin,
            size: 48,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: widget.isDragging ? 10 : 6,
            height: widget.isDragging ? 4 : 4,
            decoration: BoxDecoration(
              color: context.colors.black.withValues(alpha: 0.26),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
