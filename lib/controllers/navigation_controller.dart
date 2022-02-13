import 'package:get/get.dart';

class NavigationController extends GetxController {
  final RxInt _indexScreen = 2.obs;
  RxInt get indexScreen => _indexScreen;

  void changeScreen(screen) {
    _indexScreen.value = screen;
  }
}
