import 'package:flutter/material.dart';

class CornerShapeWidget extends StatelessWidget {
  final bool top;
  final bool left;
  const CornerShapeWidget({super.key, required this.top, required this.left});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          top: top
              ? const BorderSide(width: 4.0, color: Colors.white)
              : BorderSide.none,
          bottom: !top
              ? const BorderSide(width: 4.0, color: Colors.white)
              : BorderSide.none,
          left: left
              ? const BorderSide(width: 4.0, color: Colors.white)
              : BorderSide.none,
          right: !left
              ? const BorderSide(width: 4.0, color: Colors.white)
              : BorderSide.none,
        ),
        borderRadius: BorderRadius.only(
          topLeft: top && left ? const Radius.circular(25) : Radius.zero,
          topRight: top && !left ? const Radius.circular(25) : Radius.zero,
          bottomLeft: !top && left ? const Radius.circular(25) : Radius.zero,
          bottomRight: !top && !left ? const Radius.circular(25) : Radius.zero,
        ),
      ),
    );
  }
}
