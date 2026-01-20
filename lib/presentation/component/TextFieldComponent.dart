import 'package:flutter/material.dart';
import 'src.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String labelText;
  final double? labelFontSize;
  final bool? isHideText;
  final void Function(String)? onChanged;

  const BaseTextField({
    super.key,
    this.textController,
    required this.labelText,
    this.isHideText,
    this.labelFontSize,
    this.onChanged,
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
          controller: textController,
          obscureText: isHideText ?? false,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
