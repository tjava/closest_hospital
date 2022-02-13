import 'package:closest_hospital/controllers/navigation_controller.dart';
import 'package:closest_hospital/controllers/state_hospitals_controller.dart';
import 'package:get/get.dart';

class InitDependencies implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => StateHospitalsController());
  }
}
