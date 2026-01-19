import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_health_care/core/registration_state_enum.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../component/src.dart';
import '../../routes/route_paths.dart';
import '../bloc/registration_bloc.dart';
import '../bloc/registration_event.dart';
import '../bloc/registration_state.dart';
import 'register_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: const RegistrationView(),
    );
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      // listenWhen: (previous, current) =>
      //     previous.currentStep != current.currentStep,
      listener: (context, state) {
        if (state.status == RegistrationStatus.failure) {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(message: state.errorMessage ?? 'Lỗi hệ thống'),
          );
        }
        if (state.status == RegistrationStatus.success) {
          // Do sth after successful registration
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(message: "Registration Successful!"),
          );
          context.goNamed(RoutePaths.home);
        }
      },
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          final isFirstStep =
              state.currentStep == RegistrationSteps.giveBasicInfo;
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 100,
              leading: BaseButton(
                text: 'Back',
                icon: SvgPicture.asset(
                  "assets/icons/arrow_left.svg",
                  width: 9,
                  height: 16,
                ),
                outlineColor: ColorComponent.primaryBlue60,
                isHideOutline: true,
                onPressed: () {
                  log("Test back button pressed");
                  context.read<RegistrationBloc>().add(
                      RegistrationReturnStepEvent(
                          () => context.goNamed(RoutePaths.login)));
                },
              ),
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      headerText(isFirstStep),
                      const SizedBox(height: 24),
                      buildErrorText(state.errorMessage),
                      const SizedBox(height: 12),
                      isFirstStep
                          ? buildBodyForm(context)
                          : providePatientData(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget headerText(bool isFirstStep) => Container(
      alignment: Alignment.centerLeft,
      child: BaseText(
        isFirstStep
            ? "Sign Up"
            : "Do you have a Patient ID?", // Do you have a Patient ID?
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
