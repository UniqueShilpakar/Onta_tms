import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/createaccount_controller.dart';

class CreateAccountBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAccountController>(
      () => CreateAccountController(),
    );
  }
}
