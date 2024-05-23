import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double thickness;

  const CustomDivider({
    Key? key,
    this.height = 1.0,
    this.color = Colors.black,
    this.thickness = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
    );
  }
}
