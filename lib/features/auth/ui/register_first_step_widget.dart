import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/components/src.dart';
import '../bloc/src.dart';

class RegisterFirstStep extends StatefulWidget {
  const RegisterFirstStep({super.key});

  @override
  State<RegisterFirstStep> createState() => _RegisterFirstStepState();
}

class _RegisterFirstStepState extends State<RegisterFirstStep> {
  late final TextEditingController firstNameCtrl;
  late final TextEditingController lastNameCtrl;
  late final TextEditingController emailTxtCtrl;
  late final TextEditingController passwordTxtCtrl;
  late final TextEditingController confirmPassTxtCtrl;

  late final RegistrationBloc regisBloc;
  @override
  void initState() {
    super.initState();
    regisBloc = context.read<RegistrationBloc>();
    firstNameCtrl = TextEditingController(text: regisBloc.state.firstName);
    lastNameCtrl = TextEditingController(text: regisBloc.state.lastName);
    emailTxtCtrl = TextEditingController(text: regisBloc.state.email);
    passwordTxtCtrl = TextEditingController(text: regisBloc.state.password);
    confirmPassTxtCtrl =
        TextEditingController(text: regisBloc.state.confirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BaseTextField(
                    labelText: 'First Name',
                    textController: firstNameCtrl,
                    onChanged: (t) => context.read<RegistrationBloc>().add(
                          RegistrationFirstNameChangeEvent(firstName: t),
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BaseTextField(
                    labelText: 'Last Name',
                    textController: lastNameCtrl,
                    onChanged: (t) => context.read<RegistrationBloc>().add(
                          RegistrationLastNameChangeEvent(lastName: t),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            BaseTextField(
              labelText: 'Email address',
              textController: emailTxtCtrl,
              onChanged: (t) => context.read<RegistrationBloc>().add(
                    RegistrationEmailChangeEvent(email: t),
                  ),
            ),
            const SizedBox(height: 12),
            BaseTextField(
              labelText: 'Password',
              textController: passwordTxtCtrl,
              isHideText: true,
              onChanged: (t) => regisBloc.add(
                RegistrationPasswordChangeEvent(password: t),
              ),
            ),
            const SizedBox(height: 12),
            BaseTextField(
              labelText: 'Confirm Password',
              textController: confirmPassTxtCtrl,
              isHideText: true,
              onChanged: (t) => regisBloc.add(
                RegistrationConfirmPasswordChangeEvent(confirmPassword: t),
              ),
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
                context
                    .read<RegistrationBloc>()
                    .add(RegistrationNextStepEvent());
              },
            ),
            const SizedBox(height: 24),
            BaseButton(
              text: 'Sign Up with Google',
              icon: SvgPicture.asset("assets/icons/google.svg"),
              outlineColor: ColorComponent.primaryBlue60,
              txtColor: ColorComponent.primaryBlue60,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            BaseButton(
              text: 'Sign Up with Apple',
              icon: SvgPicture.asset("assets/icons/apple.svg"),
              outlineColor: ColorComponent.primaryBlue60,
              txtColor: ColorComponent.primaryBlue60,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
  }
}
