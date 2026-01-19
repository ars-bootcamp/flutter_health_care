import 'package:bloc/bloc.dart';
import 'package:flutter_health_care/core/registration_state_enum.dart';
import 'registration_event.dart';
import 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  // Inject Repo / Usecases
  RegistrationBloc()
      : super(
          const RegistrationState(
            firstName: '',
            lastName: '',
            email: '',
            password: '',
            confirmPassword: '',
          ),
        ) {
    on<RegistrationFirstNameChangeEvent>((event, emit) {
      if (event.firstName.isEmpty) {
        emit(state.copyWith(
          status: RegistrationStatus.initial, //failure
          errorMessage: 'First name cannot be empty',
        ));
        return;
      } else if (isValidName(event.firstName) == false) {
        emit(state.copyWith(
          status: RegistrationStatus.initial, //failure
          errorMessage: 'First name is invalid',
        ));
        return;
      } else {
        emit(state.copyWith(
          firstName: event.firstName,
          errorMessage: "",
        ));
      }
    });

    on<RegistrationLastNameChangeEvent>((event, emit) {
      if (event.lastName.isEmpty) {
        emit(state.copyWith(
          status: RegistrationStatus.initial, // failure
          errorMessage: 'Last name cannot be empty',
        ));
        // emit(state.copyWith(
        //   status: RegistrationStatus.initial,
        // ));
        return;
      } else if (isValidName(event.lastName) == false) {
        emit(state.copyWith(
          status: RegistrationStatus.initial, //failure,
          errorMessage: 'Last name is invalid',
        ));
        // emit(state.copyWith(
        //   status: RegistrationStatus.initial,
        // ));
        return;
      } else {
        emit(state.copyWith(
          lastName: event.lastName,
          errorMessage: "",
        ));
      }
    });

    on<RegistrationEmailChangeEvent>((event, emit) {
      if (event.email.isEmpty) {
        emit(state.copyWith(
          status: RegistrationStatus.initial, //failure,
          errorMessage: 'Email cannot be empty',
        ));
        // emit(state.copyWith(
        //   status: RegistrationStatus.initial,
        // ));
        return;
      } else if (isValidEmail(event.email) == false) {
        emit(state.copyWith(
          status: RegistrationStatus.initial,
          errorMessage: 'Invalid email',
        ));
        // emit(state.copyWith(
        //   status: RegistrationStatus.initial,
        // ));
      } else {
        emit(state.copyWith(
          email: event.email,
          errorMessage: "",
        ));
      }
    });

    on<RegistrationPasswordChangeEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RegistrationConfirmPasswordChangeEvent>((event, emit) {
      if (event.confirmPassword != state.password) {
        emit(state.copyWith(
          status: RegistrationStatus.initial, //failure,
          errorMessage: 'Password and confirm password do not match',
        ));
        // emit(state.copyWith(
        //   status: RegistrationStatus.initial,
        // ));
      } else {
        emit(state.copyWith(confirmPassword: event.confirmPassword));
      }
    });

    on<RegistrationNextStepEvent>(onMovingToNextStep);

    on<RegistrationReturnStepEvent>(
      (event, emit) {
        final isFirstStep =
            state.currentStep == RegistrationSteps.giveBasicInfo;
        if (isFirstStep) {
          event.handleGoBack?.call();
        } else {
          emit(state.copyWith(
            currentStep: RegistrationSteps.giveBasicInfo,
          ));
        }
      },
    );

    on<RegistrationPatientDataChangeEvent>((event, emit) {
      emit(state.copyWith(patientId: event.patientId));
    });

    on<SubmitRegistration>(onSubmitRegistration);

    on<RegistrationReturnHandler>(onReturnHandler);
  }

  void onMovingToNextStep(
    RegistrationNextStepEvent event,
    Emitter<RegistrationState> emit,
  ) {
    if (isAnyDataEmpty()) {
      emit(state.copyWith(
        status: RegistrationStatus.failure,
        errorMessage: 'Please fill all the fields',
      ));
      emit(state.copyWith(status: RegistrationStatus.initial));
      return;
    } else {
      emit(state.copyWith(
        currentStep: RegistrationSteps.givePatientInfo,
        status: RegistrationStatus.valid,
        errorMessage: "",
      ));
    }
  }

  Future<void> onSubmitRegistration(
    SubmitRegistration event,
    Emitter<RegistrationState> emit,
  ) async {
    // Implement registration logic here
    emit(
      state.copyWith(
        patientId: event.patientId,
        status: RegistrationStatus.loading,
      ),
    );
    try {
      // handle API call
      await Future.delayed(const Duration(seconds: 2));
      emit(
        state.copyWith(
          status: RegistrationStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegistrationStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  bool isAnyDataEmpty() {
    return isStringNullOrEmpty(state.firstName) &&
        isStringNullOrEmpty(state.lastName) &&
        isStringNullOrEmpty(state.email) &&
        isStringNullOrEmpty(state.password);
  }

  bool isStringNullOrEmpty(String? data) {
    return data == null || data.isEmpty;
  }

  void onReturnHandler(
    RegistrationReturnHandler event,
    Emitter<RegistrationState> emit,
  ) {
    if (state.currentStep == RegistrationSteps.givePatientInfo) {
      emit(state.copyWith(
        currentStep: RegistrationSteps.giveBasicInfo,
        status: RegistrationStatus.initial,
        errorMessage: null,
      ));
    }
  }

  bool isValidName(String? name) {
    if (name == null || name.trim().isEmpty) return false;
    if (name.trim().length < 2) return false;
    final regex = RegExp(r"^[\p{L}\s.'-]+$", unicode: true);

    return regex.hasMatch(name.trim());
  }

  bool isValidEmail(String? email) {
    if (email == null || email.trim().isEmpty) return false;
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email.trim());
  }

  bool isValidPassword(String? password) {
    if (password == null || password.isEmpty) return false;
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    return passwordRegex.hasMatch(password);
  }
}
