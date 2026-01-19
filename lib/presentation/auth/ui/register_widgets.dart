import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_health_care/core/string_extension.dart';
import 'package:flutter_health_care/presentation/auth/bloc/registration_event.dart';
import 'package:flutter_svg/svg.dart';
import '../../component/src.dart';
import '../bloc/registration_bloc.dart';

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

Widget buildBodyForm(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BaseTextField(
              labelText: 'First Name',
              onChanged: (t) => context
                  .read<RegistrationBloc>()
                  .add(RegistrationFirstNameChangeEvent(firstName: t)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: BaseTextField(
              labelText: 'Last Name',
              onChanged: (t) => context
                  .read<RegistrationBloc>()
                  .add(RegistrationLastNameChangeEvent(lastName: t)),
            ),
          ),
        ],
      ),
      const SizedBox(height: 12),
      BaseTextField(
        labelText: 'Email address',
        onChanged: (t) => context
            .read<RegistrationBloc>()
            .add(RegistrationEmailChangeEvent(email: t)),
      ),
      const SizedBox(height: 12),
      const BaseTextField(
        labelText: 'Password',
        isHideText: true,
      ),
      const SizedBox(height: 12),
      const BaseTextField(
        labelText: 'Confirm Password',
        isHideText: true,
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
        onPressed: () {
          context.read<RegistrationBloc>().add(RegistrationNextStepEvent());
        },
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

Widget providePatientData() {
  return const Expanded(
    child: Column(
      children: [
        BaseTextField(labelText: "Patient ID"),
        BaseText(
          "If you don’t have a Patient ID yet, please skip this question.",
          fontSize: 10,
          color: ColorComponent.gray60,
        ),
        Row(
          children: [
            Expanded(
              child: BaseButton(
                text: "Skip",
                outlineColor: ColorComponent.primaryBlue60,
              ),
            ),
            Expanded(
              child: BaseButton(
                text: "Add Patient ID",
              ),
            ),
          ],
        )
      ],
    ),
  );
}
