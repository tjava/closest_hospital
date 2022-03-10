import 'package:dio/dio.dart';

class ClosestHospitalsService {
  late Dio _dio;

  final String baseUrl = "http://localhost:8080/api/v1/";

  ClosestHospitalsService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    // initializeInterceptors();
  }

  Future<Response> getClosestHospitals(String endPoint) async {
    Response response;
    try {
      response = await _dio.get(endPoint);
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
