import 'package:closest_hospital/models/single_hospital_model.dart';
import 'package:closest_hospital/models/single_hospital_properties_model.dart';
import 'package:closest_hospital/services/single_hospital_service.dart';
import 'package:get/get.dart';

class StateHospitalsController extends GetxController {
  SingleHospitalService? singleHospitalService;
  SingleHospitalModel? singleHospitalModel;
  SingleHospitalPropertiesModel? singleHospitalPropertiesModel;

  final RxString _stateValue = 'Abia'.obs;
  RxString get stateValue => _stateValue;

  Rx get single => singleHospitalPropertiesModel.obs;

  void changeState(state) {
    _stateValue.value = state;
  }

  Future getSingleHospital() async {
    Response response;

    try {
      response = (await singleHospitalService!
          .getSingleHospital("/hospitals/1")) as Response;
      if (response.statusCode == 200) {
        singleHospitalModel = SingleHospitalModel.fromJson(response.body);
        singleHospitalPropertiesModel = singleHospitalModel!.properties;
        print(response.body);
      } else {
        print("there is error");
      }
    } on Exception catch (error) {
      print(error);
    }
  }
}
