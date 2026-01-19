import 'package:flutter/material.dart';
import 'src.dart';

class BaseTextField extends StatelessWidget {
  final String labelText;
  final double? labelFontSize;
  final bool? isHideText;
  final void Function(String)? onChanged;
  const BaseTextField({
    super.key,
    required this.labelText,
    this.labelFontSize,
    this.onChanged,
    this.isHideText,
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
        TextField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: ColorComponent.gray10,
            border: InputBorder.none,
          ),
          obscureText: isHideText ?? false,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
