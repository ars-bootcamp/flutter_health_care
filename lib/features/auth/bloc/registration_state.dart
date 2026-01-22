import 'package:equatable/equatable.dart';
import 'package:flutter_health_care/core/registration_state_enum.dart';

class RegistrationState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String? patientId;
  final RegistrationSteps currentStep;
  final RegistrationStatus status;
  final String? errorMessage;

  const RegistrationState({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.patientId,
    this.errorMessage,
    this.currentStep = RegistrationSteps.giveBasicInfo,
    this.status = RegistrationStatus.initial,
  });

  RegistrationState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? patientId,
    RegistrationSteps? currentStep,
    RegistrationStatus? status,
    String? errorMessage,
  }) {
    return RegistrationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      patientId: patientId ?? this.patientId,
      currentStep: currentStep ?? this.currentStep,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        currentStep,
        status,
        patientId ?? '',
        errorMessage ?? '',
      ];
}
