import 'package:flutter/material.dart';
import 'package:flutter_health_care/core/string_extension.dart';
import '../../../shared/components/src.dart';

Widget headerText(bool isFirstStep) => Container(
      alignment: Alignment.centerLeft,
      child: BaseText(
        isFirstStep
            ? "Sign Up"
            : "Do you have a Patient ID?", // Do you have a Patient ID?
        fontSize: isFirstStep ? 32 : 24,
        fontWeight: FontWeight.w700,
      ),
    );

Widget buildErrorText(String? errorMessage) => errorMessage.isNotNullOrEmpty
    ? Container(
        alignment: Alignment.centerLeft,
        child: BaseText(
          errorMessage!,
          fontSize: 12,
          color: ColorComponent.warning60,
        ),
      )
    : const SizedBox.shrink();
