import 'package:equatable/equatable.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
  @override
  List<Object> get props => [];
}

// class StartRegistration extends RegistrationEvent {
//   final String email;

//   const StartRegistration({required this.email});

//   @override
//   List<Object> get props => [email];
// }

class RegistrationFirstNameChangeEvent extends RegistrationEvent {
  final String firstName;

  const RegistrationFirstNameChangeEvent({required this.firstName});

  @override
  List<Object> get props => [firstName];
}

class RegistrationLastNameChangeEvent extends RegistrationEvent {
  final String lastName;

  const RegistrationLastNameChangeEvent({required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class RegistrationEmailChangeEvent extends RegistrationEvent {
  final String email;

  const RegistrationEmailChangeEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChangeEvent extends RegistrationEvent {
  final String password;

  const RegistrationPasswordChangeEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class RegistrationConfirmPasswordChangeEvent extends RegistrationEvent {
  final String confirmPassword;

  const RegistrationConfirmPasswordChangeEvent({required this.confirmPassword});

  @override
  List<Object> get props => [confirmPassword];
}

class RegistrationNextStepEvent extends RegistrationEvent {
  // final String patiendId;
  // const RegistrationNextStepEvent({required this.patiendId});

  // @override
  // List<Object> get props => [patiendId];
}

class RegistrationPatientDataChangeEvent extends RegistrationEvent {
  final String? patientId;

  const RegistrationPatientDataChangeEvent({required this.patientId});

  @override
  List<Object> get props => [patientId ?? ""];
}

class RegistrationReturnStepEvent extends RegistrationEvent {
  final void Function()? handleGoBack;
  const RegistrationReturnStepEvent(this.handleGoBack);

  @override
  List<Object> get props => [];
}

class SubmitRegistration extends RegistrationEvent {
  const SubmitRegistration();

  @override
  List<Object> get props => [];
}