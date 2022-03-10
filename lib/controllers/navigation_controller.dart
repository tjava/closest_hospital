import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt _indexScreen = 0.obs;
  RxInt get indexScreen => _indexScreen;

  void changeScreen(screen) {
    _indexScreen.value = screen;
  }
}
