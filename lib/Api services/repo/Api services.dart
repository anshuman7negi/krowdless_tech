import 'package:dio/dio.dart';
import 'package:krowdless/Api%20services/repo/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../Utils/constant.dart';




class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService({String? token, String? apiToken}) {
    _instance._addTokenInterceptor(params: token, apiToken: apiToken);
    return _instance;
  }

  final Dio _dio = Dio();

  ApiService._internal() {
    _dio.options = BaseOptions(
      baseUrl: BASEURL,
      connectTimeout: const Duration(seconds: 60), // ⏳ Connection timeout
      receiveTimeout: const Duration(seconds: 60), // ⏳ Receiving timeout
      sendTimeout: const Duration(seconds: 60), // ⏳ Sending timeout
    );
    _dio.interceptors.add(PrettyDioLogger());
  }

  _addTokenInterceptor({String? params, String? apiToken}) {
    _dio.interceptors.removeWhere((interceptor) => interceptor is TokenInterceptor);
    _dio.interceptors.add(TokenInterceptor(token: params, apiToken: apiToken));
  }

  Dio get sendRequest => _dio;
}
