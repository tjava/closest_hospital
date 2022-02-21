import 'package:dio/dio.dart';

class SingleHospitalService {
  late Dio _dio;

  final String baseUrl = "http://localhost:8080/api/v1/";

  SingleHospitalService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    // initializeInterceptors();
  }

  Future<Response> getSingleHospital(String endPoint) async {
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

  // initializeInterceptors() {
  //   _dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onError: (error, errorInterceptorHandler) {
  //         print(error.message);
  //       },
  //       onRequest: (request, requestInterceptorHandler) {
  //         print("${request.method} ${request.path}");
  //       },
  //       onResponse: (response, responseInterceptorHandler) {
  //         print(response.data);
  //       },
  //     ),
  //   );
  // }
}
