import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onta_tms/src/routes/app_routes.dart';

class LoginController extends GetxController {
  //form keys
  final formKey = GlobalKey<FormState>();

  //text editing controllers of login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //obserable for password visibility
  final rememberPassword = false.obs;
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  //toogle password visibility nad remember oassword
  void tooglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toogleRememberPassword(bool? value) {
    rememberPassword.value = value ?? false;
  }

  //email validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  //password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  //login function
  //------------------------------------------------
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        //simulate api calls
        await Future.delayed(Duration(seconds: 2));

        //navigating to home page on successful login
        Get.offAllNamed(AppRoutes.homePage);
      } finally {
        isLoading.value = false;
      }
    }
  }

  //navigating to forgot pasword
  //---------------------------------------------------
  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  // Navigate to create account -
  void goToCreateAccount() {
    Get.toNamed(AppRoutes.createAccount);
  }

  void goToHomePage() {
    Get.toNamed(AppRoutes.homePage);
  }

  //dispose controllers when not needed
  //-----------------------------------------------------
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
