import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final int? max;
  final TextOverflow? textOverflow;

  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      required this.fontWeight,
      required this.color, this.max, this.textOverflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: max,
      overflow: textOverflow,
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
