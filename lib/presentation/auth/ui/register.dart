import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../component/src.dart';

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
              const SizedBox(height: 32),
              buildBodyForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerText() => Container(
        alignment: Alignment.centerLeft,
        child: const BaseText(
          "Sign Up",
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      );

  Widget buildBodyForm() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BaseTextField(
                labelText: 'First Name',
              ),
            ),
            Expanded(
              child: BaseTextField(
                labelText: 'Last Name',
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const BaseTextField(
          labelText: 'Email address',
        ),
        const SizedBox(height: 12),
        const BaseTextField(
          labelText: 'Password',
        ),
        const SizedBox(height: 12),
        const BaseTextField(
          labelText: 'Confirm Password',
        ),
        Row(
          children: [
            Checkbox(value: false, onChanged: (_) {}),
            const BaseText(
              "I agree to the Terms of Service and Privacy Policy", // Use Text Span here
            ),
          ],
        ),
        PrimaryButton(
          text: 'Sign Up',
          padding: const EdgeInsets.only(top: 24.0),
          onPressed: () {},
        ),
        const SizedBox(height: 24),
        BaseButton(
          text: 'Sign Up with Google',
          icon: SvgPicture.asset("assets/icons/google.svg"),
          outlineColor: ColorComponent.primaryBlue60,
          onPressed: () {},
        ),
        const SizedBox(height: 12),
        BaseButton(
          text: 'Sign Up with Apple',
          icon: SvgPicture.asset("assets/icons/apple.svg"),
          outlineColor: ColorComponent.primaryBlue60,
          onPressed: () {},
        ),
      ],
    );
  }
}
