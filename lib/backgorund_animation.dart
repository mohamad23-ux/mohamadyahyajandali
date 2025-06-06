import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundAnimation extends StatefulWidget {
  const BackgroundAnimation({super.key});

  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _backgroundAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _backgroundAnimation = ColorTween(
      begin: Colors.black,
      end: Colors.deepPurple,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _backgroundAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(color: _backgroundAnimation.value),
          child: _buildParticleEffect(),
        );
      },
    );
  }

  Widget _buildParticleEffect() {
    return Stack(
      children: List.generate(15, (index) {
        final random = Random();
        return Positioned(
          left: random.nextDouble() * MediaQuery.of(context).size.width,
          top: random.nextDouble() * MediaQuery.of(context).size.height,
          child: AnimatedContainer(
            duration: Duration(seconds: random.nextInt(5) + 2),
            curve: Curves.easeInOut,
            width: random.nextDouble() * 10 + 5,
            height: random.nextDouble() * 10 + 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        );
      }),
    );
  }
}
