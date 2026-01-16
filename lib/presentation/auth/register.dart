import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../component/src.dart';

// This page have 3 stages:
// 1. No connected email
// 2. Email already connected
// 3. Reset password ( may use applink to get to this state )

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: BaseButton(
          text: 'Back',
          icon: SvgPicture.asset(
            "assets/icons/arrow_left.svg",
            width: 9,
            height: 16,
          ),
          outlineColor: ColorComponent.primaryBlue60,
          isHideOutline: true,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              headerText(),
              subTitleText(),
              const BaseTextField(
                labelText: 'Recovery email address',
              ),
              PrimaryButton(
                text: 'Send reset link',
                padding: const EdgeInsets.only(top: 24.0),
                onPressed: () {},
              ),
              const BaseButton(
                text: 'Resend reset link (60s)',
                bgColor: ColorComponent.gray30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerText() => Container(
        alignment: Alignment.centerLeft,
        child: const BaseText(
          "Forgotten your password?",
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget subTitleText() => Container(
        alignment: Alignment.centerLeft,
        // margin: const EdgeInsets.only(top: 8.0, bottom: 24.0),
        child: const BaseText(
          "There is nothing to worry about, we'll send you a message to help you reset your password.",
          fontSize: 16,
        ),
      );
}
