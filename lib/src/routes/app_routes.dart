//routes name only
import 'package:get/route_manager.dart';
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
  static const createAccount = '/create-account';
  static const String resetPassword = '/reset-password';
  static const String homePage = '/home-page';
  // static const String sidebar = '/sidebar',

  //getxpages
  static List<GetPage> pages = [
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding()
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPassword(),
      binding: ForgotPasswordBindings(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
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
  name: '/home',
  page: () => const HomePage(),
  binding: HomeBinding(),
)

    // GetPage(
    //   name: sidebar,
    //   page: 
    // ),
  ];
}