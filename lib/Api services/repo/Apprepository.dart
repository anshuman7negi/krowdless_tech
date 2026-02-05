import 'package:dio/dio.dart';
import '../../Response model/loginResponse.dart';
import '../../Response model/signUpResponse.dart';
import '../../Utils/constant.dart';
import '../../Utils/response status.dart';
import 'Api services.dart';



class AppRepository {

  Future<ResponseStatus> login(Map<String, dynamic> loginDetails) async {
    try {
      print("user request");
      print(loginDetails);
      final response = await ApiService().sendRequest.post(
        LOGIN,
        data: loginDetails,
      );
      return ResponseStatus(
        statusCode: response.statusCode,
        responseData: LoginResponse.fromJson(response.data),
      );
    } on DioException catch (e) {
      print(e.toString());
      print("error");
      throw ErrorStatus(
        message: e.response!.data['message'],
        code: e.response!.statusCode,
      );
    } on Exception catch (e) {
      print(e.toString());
      print("error");
      rethrow;
    }
  }

  Future<ResponseStatus> signUp(Map<String, dynamic> details) async {
    try {
      print("user request");
      print(details);
      final response = await ApiService().sendRequest.post(
        SIGNUP,
        data: details,
      );
      return ResponseStatus(
        statusCode: response.statusCode,
        responseData: SignUpResponse.fromJson(response.data),
      );
    } on DioException catch (e) {
      print(e.toString());
      print("error");
      throw ErrorStatus(
        message: e.response!.data['message'],
        code: e.response!.statusCode,
      );
    } on Exception catch (e) {
      print(e.toString());
      print("error");
      rethrow;
    }
  }

}
