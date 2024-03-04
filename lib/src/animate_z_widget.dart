import 'dart:math';

import 'package:flutter/material.dart';

/// An enum defining the available animation types.
enum AnimationType { rotate, flip, scale }

/// Custom Animation Class
class AnimationSpec {
  final Curve curve;
  final Duration duration;
  final Tween<dynamic> tween;

  const AnimationSpec({
    this.curve = Curves.easeInOut,
    required this.duration,
    required this.tween,
  });
}

/// A widget that allows you to animate your child widget with various options.
class AnimateZWidget extends StatefulWidget {
  /// The child widget to be animated.
  final Widget child;

  /// Whether to animate the child widget.
  final bool animate;

  /// custom animation to apply.
  final AnimationSpec? customAnimation;

  /// The type of animation to apply.
  final AnimationType animationType;
  const AnimateZWidget({
    super.key,
    required this.child,
    required this.animate,
    this.animationType = AnimationType.rotate,
    this.customAnimation,
  });

  @override
  State<AnimateZWidget> createState() => _AnimateZWidgetState();
}

class _AnimateZWidgetState extends State<AnimateZWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _controller = AnimationController(
        animationBehavior: AnimationBehavior.preserve,
        vsync: this,
        duration:
            widget.customAnimation?.duration ?? const Duration(seconds: 2),
      );
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    if (widget.animate) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) {
      return Hero(
        tag: 'animate_z_widget',
        child: widget.child,
      );
    }
    final Animation animation = (widget.customAnimation?.tween ??
            Tween<double>(
                begin: 0.0,
                end: widget.animationType == AnimationType.rotate ? 10.0 : 1.0))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: (widget.customAnimation?.curve ?? Curves.easeInOut)));

    return Hero(
      tag: 'animate_z_widget',
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final value = animation.value;
          if (value is double) {
            switch (widget.animationType) {
              case AnimationType.rotate:
                return Transform.rotate(
                  angle: value * 2 * pi,
                  child: child,
                );
              case AnimationType.flip:
                return Transform.flip(
                  flipX: value > 0.5,
                  child: child,
                );
              case AnimationType.scale:
                return Transform.scale(
                  scale: value,
                  child: child,
                );
            }
          } else {
            return child ?? const SizedBox();
          }
        },
        child: widget.child,
      ),
    );
  }
}
