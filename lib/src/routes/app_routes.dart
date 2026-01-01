import 'package:get/route_manager.dart';
import 'package:flutter/material.dart'; // ✅ Added this import
import 'package:onta_tms/src/bindings/dashboard_bindings/homebindings.dart';
import 'package:onta_tms/src/bindings/screens_bindings/createaccount_binding.dart';
import 'package:onta_tms/src/bindings/screens_bindings/forgotpasswordbindings.dart';
import 'package:onta_tms/src/bindings/screens_bindings/login_binding.dart';
import 'package:onta_tms/src/bindings/screens_bindings/resetpasswordbindings.dart';

import 'package:onta_tms/src/features/dashboards/homepage.dart';
import 'package:onta_tms/src/features/screens/createaccount.dart';
import 'package:onta_tms/src/features/screens/forgotpassword.dart';
import 'package:onta_tms/src/features/screens/login.dart';
import 'package:onta_tms/src/features/screens/resetpassword.dart';

class AppRoutes {
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String createAccount = '/create-account';
  static const String resetPassword = '/reset-password';
  static const String home = '/home'; 

  static List<GetPage> pages = [
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPassword(),
      binding: ForgotPasswordBindings(),
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBindings(),
    ),
    GetPage(
      name: createAccount,
      page: () => const CreateAccountScreen(),
      binding: CreateAccountBindings(),
    ),
    GetPage(
      name: home,
      page: () => HomePage( 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.dashboard, size: 64, color: Color(0xFF235BB1)),
              SizedBox(height: 16),
              Text(
                'Welcome to Onta TMS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      binding: HomeBinding(),
    ),
  ];
}