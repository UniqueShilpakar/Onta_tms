// Create a binding class
import 'package:get/get.dart';
import 'package:onta_tms/src/controllers/dashboard_controller/sidebarController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Sidebarcontroller>(() => Sidebarcontroller());
  }
}

// Then in your route configuration
