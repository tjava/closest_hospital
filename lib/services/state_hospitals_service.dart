import 'package:dio/dio.dart';

class StateHospitalsService {
  late Dio _dio;

  final String baseUrl = "http://localhost:8080/api/v1/";

  StateHospitalsService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    // initializeInterceptors();
  }

  Future<Response> getStateHospitals(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
      // print(response);
    } on DioError catch (error) {
      print(error.message);
      throw Exception(error.message);
    }

    return response;
  }
}
