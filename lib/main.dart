import 'package:flutter/material.dart';
import 'package:flutter_health_care/presentation/auth/binding/registration_binding.dart';
import 'presentation/routes/app_router.dart';

void main() {
  runApp(const MyApp());
  regisViewModelBinding();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
