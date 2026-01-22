import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_health_care/core/string_extension.dart';

import '../../../shared/components/src.dart';
import '../bloc/src.dart';

class RegisterLastStep extends StatefulWidget {
  const RegisterLastStep({super.key});

  @override
  State<RegisterLastStep> createState() => _RegisterLastStepState();
}

class _RegisterLastStepState extends State<RegisterLastStep> {
  late final RegistrationBloc regisBloc;
  late final TextEditingController patientIdTxtCtrl;

  @override
  void initState() {
    super.initState();
    regisBloc = context.read<RegistrationBloc>();
    patientIdTxtCtrl = TextEditingController(text: regisBloc.state.patientId);
  }

  void handleSubmitRegistration() {
    regisBloc.add(const SubmitRegistration());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        final isPatientIdValid = regisBloc.state.patientId.isNotNullOrEmpty;
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              patientFormData(),
              Row(
                children: [
                  Expanded(
                    child: BaseButton(
                      text: "Skip",
                      outlineColor: ColorComponent.primaryBlue60,
                      txtColor: ColorComponent.primaryBlue60,
                      onPressed: () => handleSubmitRegistration(),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: BaseButton(
                      text: "Add Patient ID",
                      bgColor: isPatientIdValid
                          ? ColorComponent.primaryBlue60
                          : ColorComponent.gray30,
                      txtColor: Colors.white,
                      onPressed: () => handleSubmitRegistration(),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget patientFormData() {
    return Column(
      children: [
        BaseTextField(
          labelText: "Patient ID",
          textController: patientIdTxtCtrl,
          onChanged: (t) => regisBloc.add(
            RegistrationPatientDataChangeEvent(patientId: t),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: const BaseText(
            "If you don’t have a Patient ID yet, please skip this question.",
            fontSize: 10,
            color: ColorComponent.gray60,
          ),
        ),
      ],
    );
  }
}
