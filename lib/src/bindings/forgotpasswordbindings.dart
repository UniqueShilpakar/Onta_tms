import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/forgotpasswordcontroller.dart';

class ForgotPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
  }
}
