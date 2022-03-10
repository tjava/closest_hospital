import 'package:closest_hospital/models/single_hospital_model.dart';
import 'package:closest_hospital/models/state_hospitals_model.dart';
import 'package:closest_hospital/services/single_hospital_service.dart';
import 'package:closest_hospital/services/state_hospitals_service.dart';
import 'package:get/get.dart';

class StateHospitalsController extends GetxController {
  SingleHospitalService? singleHospitalService;
  StateHospitalsService? stateHospitalsService;
  StateHospitalsModel? stateHospitalsModel;
  SingleHospitalModel? singleHospitalModel;

  RxString stateValue = 'Select State'.obs;
  // RxString get stateValue => _stateValue;

  RxList<SingleHospitalModel>? stateHospitals = <SingleHospitalModel>[].obs;
  RxBool isLoading = true.obs;

  Future changeState({String? state, int? index}) async {
    stateValue.value = state!;
    await getStateHospitals(index: index!);
  }

  Future getStateHospitals({int? index}) async {
    stateHospitalsService = StateHospitalsService();
    try {
      final response = await stateHospitalsService!
          .getStateHospitals("hospitals/?state=$index");
      if (response.statusCode == 200) {
        stateHospitalsModel = StateHospitalsModel.fromJson(response.data);
        stateHospitals!.value = stateHospitalsModel!.features!;
        isLoading.value = false;
        // print(stateHospitals);
      } else {
        print("there is error");
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  // @override
  // void onInit() async {
  //   //
  //   // getSingleHospital();
  //   // print(stateHospitals);
  //   // getStateHospitals();
  //   super.onInit();
  // }
}
