// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_health_care/presentation/component/BaseText.dart';
import 'package:flutter_health_care/presentation/component/ColorComponent.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorComponent.primaryBlue60,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class BaseButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final SvgPicture? icon;
  final Color? bgColor;
  final Color? outlineColor;
  final double? width;
  final double? height;
  final bool? isHideOutline;

  const BaseButton({
    super.key,
    required this.text,
    this.onPressed,
    this.padding,
    this.icon,
    this.width,
    this.height,
    this.bgColor,
    this.outlineColor,
    this.isHideOutline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: isHideOutline != true
              ? BorderSide(
                  color: outlineColor ?? ColorComponent.defaultText,
                  width: 1.5,
                )
              : null,
          backgroundColor: bgColor ?? Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            // Thêm horizontal để nút không bị dẹp
          ),
          foregroundColor: outlineColor != null
              ? outlineColor ?? ColorComponent.defaultText
              : null,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            SizedBox(width: icon != null ? 12 : 0),
            BaseText(
              text,
              fontSize: 16,
              color: outlineColor,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
