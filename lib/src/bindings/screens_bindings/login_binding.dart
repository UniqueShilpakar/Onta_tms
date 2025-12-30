import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/screens_controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
