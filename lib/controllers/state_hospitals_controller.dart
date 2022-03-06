import 'package:closest_hospital/models/single_hospital_model.dart';
import 'package:closest_hospital/models/single_hospital_properties_model.dart';
import 'package:closest_hospital/models/state_hospitals_model.dart';
import 'package:closest_hospital/services/single_hospital_service.dart';
import 'package:closest_hospital/services/state_hospitals_service.dart';
import 'package:get/get.dart';

class StateHospitalsController extends GetxController {
  SingleHospitalService? singleHospitalService;
  StateHospitalsService? stateHospitalsService;
  StateHospitalsModel? stateHospitalsModel;
  SingleHospitalModel? singleHospitalModel;
  SingleHospitalPropertiesModel? singleHospitalPropertiesModel;

  RxString stateValue = 'Select State'.obs;
  // RxString get stateValue => _stateValue;

  List<SingleHospitalModel>? stateHospitals = <SingleHospitalModel>[].obs;

  void changeState({String? state, int? index}) async {
    stateValue.value = state!;
    await getStateHospitals(index: index!);
    print(index);
  }

  void call(index) {}

  Future getStateHospitals({int? index}) async {
    stateHospitalsService = StateHospitalsService();
    try {
      final response = await stateHospitalsService!
          .getStateHospitals("hospitals/?state=$index");
      print("hospitals/?state=$index");
      if (response.statusCode == 200) {
        stateHospitalsModel = StateHospitalsModel.fromJson(response.data);
        stateHospitals = stateHospitalsModel!.features;
      } else {
        print("there is error");
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  // Future getSingleHospital() async {
  //   singleHospitalService = SingleHospitalService();
  //   try {
  //     final response =
  //         await singleHospitalService!.getSingleHospital("hospitals/1");
  //     if (response.statusCode == 200) {
  //       singleHospitalModel = SingleHospitalModel.fromJson(response.data);
  //       singleHospitalPropertiesModel = singleHospitalModel!.properties;
  //       print(response.data);
  //     } else {
  //       print("there is error");
  //     }
  //   } on Exception catch (error) {
  //     print(error);
  //   }
  // }

  @override
  void onInit() async {
    //
    // getSingleHospital();
    // print(stateHospitals);
    // getStateHospitals();
    super.onInit();
  }
}
