import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt _indexScreen = 0.obs;
  RxInt get indexScreen => _indexScreen;

  Future changeScreen(screen) async {
    switch (screen) {
      case 0:
        return await Get.toNamed('/');
      case 1:
        return await Get.toNamed('/closestHospital');
      case 2:
        return await Get.toNamed('/stateHospital');
      case 3:
        return await Get.toNamed('/aboutUs');
      default:
        return await Get.toNamed('/');
    }
  }
}
