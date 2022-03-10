import 'package:closest_hospital/models/single_hospital_model.dart';
import 'package:closest_hospital/models/state_hospitals_model.dart';
import 'package:closest_hospital/services/closest_hospitals_service.dart';
import 'package:closest_hospital/services/single_hospital_service.dart';
import 'package:get/get.dart';

class ClosestHospitalsController extends GetxController {
  SingleHospitalService? singleHospitalService;
  ClosestHospitalsService? closestHospitalsService;
  StateHospitalsModel? stateHospitalsModel;
  SingleHospitalModel? singleHospitalModel;

  RxList<SingleHospitalModel>? closestHospitals = <SingleHospitalModel>[].obs;
  RxBool isLoading = true.obs;

  Future getClosestHospitals({double? lon, double? lat}) async {
    closestHospitalsService = ClosestHospitalsService();
    try {
      final response = await closestHospitalsService!.getClosestHospitals(
          "hospitals/closest_hospitals/?lon=$lon&lat=$lat");
      if (response.statusCode == 200) {
        stateHospitalsModel = StateHospitalsModel.fromJson(response.data);
        closestHospitals!.value = stateHospitalsModel!.features!;
        isLoading.value = false;
      } else {
        print("there is error");
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  @override
  void onInit() async {
    await getClosestHospitals(lon: 7.3844110965729, lat: 5.9706401824951);
    super.onInit();
  }
}
