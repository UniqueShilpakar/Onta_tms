import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/resetpasswordcontroller.dart';

class ResetPasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordController>(
      () => ResetPasswordController(),
    );
  }
}
