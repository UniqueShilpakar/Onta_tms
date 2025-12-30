import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/screens_controllers/createaccount_controller.dart';

class CreateAccountBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(
      () => CreateAccountController(),
    );
  }
}
