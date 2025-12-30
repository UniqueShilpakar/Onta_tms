import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onta_tms/src/routes/app_routes.dart';

class CreateAccountController extends GetxController {
  //formkey
  final formKey = GlobalKey<FormState>();

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  //observable variables
  final isPasswordVisible = false.obs;
  final acceptTerms = false.obs;
  final isLoading = false.obs;

  //tooglepassword visibility
  void tooglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  //toogle accept terms
  void toogleAcceptTerms(bool? value) {
    acceptTerms.value = value ?? false;
  }

  //email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }

    //Regular expression for email validation
    final emailRegx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegx.hasMatch(value)) {
      return 'Please enter a valid email address format';
    }
    return null;
  }

  //Username validator
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    if (value.length < 3) {
      return 'Username must be at least 5 characters';
    }
    if (value.length > 20) {
      return 'Usernmae must be less than 20 characters';
    }
    return null;
  }

  //password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  //signup functions
  Future<void> signUp() async {
    // Check if terms are accepted
    if (!acceptTerms.value) {
      Get.snackbar(
        'Terms Required',
        'Please accept the terms and conditions',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;

        Get.offAllNamed(AppRoutes.homePage);

        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));

        // Show success message
        Get.snackbar(
          'Success',
          'Account created successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      } catch (e) {
        // Show error message
        Get.snackbar(
          'Error',
          'Failed to create account: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Navigate to forgot password
  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  // Navigate to login
  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void goToHomePage() {
    Get.toNamed(AppRoutes.homePage);
  }

  @override
  void onClose() {
    // Dispose controllers when not needed
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
