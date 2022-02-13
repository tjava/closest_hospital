import 'package:get/get.dart';

class StateHospitalsController extends GetxController {
  final RxString _stateValue = 'Abia'.obs;
  RxString get stateValue => _stateValue;

  void changeState(state) {
    _stateValue.value = state;
  }
}
