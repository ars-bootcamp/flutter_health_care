// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_health_care/shared/components/color_component.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const BaseText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color ?? ColorComponent.gray90,
      ),
    );
  }
}
