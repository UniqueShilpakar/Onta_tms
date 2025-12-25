import 'package:flutter/material.dart';
import 'package:onta_tms/src/features/screens/createaccount.dart';
import 'package:onta_tms/src/features/screens/forgotpassword.dart';
import 'package:onta_tms/src/features/screens/login.dart';
import 'package:onta_tms/src/features/screens/resetpassword.dart';
import 'package:onta_tms/src/routes/app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.forgotPassword: (context) => const ForgotPassword(),
    AppRoutes.createAccount : (context) => const CreateAccountScreen(),
    AppRoutes.resetPassword: (context) => const ResetPasswordScreen(),
  };
}
