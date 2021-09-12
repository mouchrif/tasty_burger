import 'package:flutter/material.dart';

import 'dart:async';

class FadeAnimationTitle extends StatefulWidget {
  final int? delay;
  final double aniOffsetX;
  final double aniOffsetY;
  final int animationDuration;
  final Widget child;
  FadeAnimationTitle({
    Key? key,
    this.delay,
    required this.child,
    required this.aniOffsetX,
    required this.aniOffsetY,
    required this.animationDuration,
  }) : super(key: key);

  @override
  _FadeAnimationTitleState createState() => _FadeAnimationTitleState();
}

class _FadeAnimationTitleState extends State<FadeAnimationTitle>
    with TickerProviderStateMixin {
  AnimationController? _animController;

  Animation<Offset>? _animationOffset;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );
    _animationOffset = Tween<Offset>(
            begin: Offset(widget.aniOffsetX, widget.aniOffsetY),
            end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _animController!, curve: Curves.easeInOut));
    if (widget.delay == null) {
      _animController!.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay!), () {
        _animController!.forward();
      });
    }
  } 

  @override
  void dispose() {
    _animController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController!,
      child: SlideTransition(
        position: _animationOffset!,
        child: widget.child,
      ),
    );
  }
}
