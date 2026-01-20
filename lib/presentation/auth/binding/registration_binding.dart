import 'package:get_it/get_it.dart';

import '../viewmodel/src.dart';

final getIt = GetIt.instance;

void regisViewModelBinding() {
  // implement repository

  getIt.registerFactory<RegistrationBloc>(
    () => RegistrationBloc(),
  );
}
