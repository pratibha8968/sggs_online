import 'package:flutter/material.dart';

class OnHoverEffect extends StatefulWidget {
  final Widget Function(bool isHoverde) builder;
  const OnHoverEffect({Key? key, required this.builder}) : super(key: key);

  @override
  State<OnHoverEffect> createState() => _OnHoverEffectState();
}

class _OnHoverEffectState extends State<OnHoverEffect> {
  bool ishovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: widget.builder(ishovered),
    );
  }

  void onEntered(bool ishovered) => setState(() {
        this.ishovered = ishovered;
      });
}
