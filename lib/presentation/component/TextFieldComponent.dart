import 'package:flutter/material.dart';
import 'src.dart';

class BaseTextField extends StatelessWidget {
  final String labelText;
  final double? labelFontSize;
  const BaseTextField({
    super.key,
    required this.labelText,
    this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: BaseText(
            labelText,
            fontSize: labelFontSize ?? 14,
            color: ColorComponent.gray90,
          ),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorComponent.gray10,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
