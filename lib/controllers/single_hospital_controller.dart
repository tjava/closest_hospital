import 'package:closest_hospital/models/single_hospital_model.dart';
import 'package:closest_hospital/models/single_hospital_properties_model.dart';
import 'package:closest_hospital/models/state_hospitals_model.dart';
import 'package:closest_hospital/services/single_hospital_service.dart';
import 'package:closest_hospital/services/state_hospitals_service.dart';
import 'package:get/get.dart';

class SingleHospitalController extends GetxController {
  SingleHospitalService? singleHospitalService;
  StateHospitalsService? stateHospitalsService;
  StateHospitalsModel? stateHospitalsModel;
  SingleHospitalModel? singleHospitalModel;

  Rx<SingleHospitalPropertiesModel>? singleHospitalPropertiesModel =
      SingleHospitalPropertiesModel().obs;

  Future goToSingleHospital({int? id}) async {
    await getSingleHospital(id: id);
    Get.toNamed("/singleHospital");
  }

  Future getSingleHospital({int? id}) async {
    singleHospitalService = SingleHospitalService();
    try {
      final response =
          await singleHospitalService!.getSingleHospital("hospitals/$id");
      if (response.statusCode == 200) {
        singleHospitalModel = SingleHospitalModel.fromJson(response.data);
        singleHospitalPropertiesModel!.value = singleHospitalModel!.properties!;
      } else {
        print("there is error");
      }
    } on Exception catch (error) {
      print(error);
    }
  }
}
