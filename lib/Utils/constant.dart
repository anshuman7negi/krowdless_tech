import 'package:internet_connection_checker/internet_connection_checker.dart';


Future<bool> isInternetConnected() async {
  try {
    return await InternetConnectionChecker().hasConnection;
  } catch (_) {
    return false;
  }
}



//const BASEURL = "http://34.238.14.72:9091/api/";
const BASEURL = "https://krowdless-version.onrender.com/";

const TOKEN = "token";
const LOGIN = "users/login";
const SIGNUP = "users/register";














final RegExp emailRegex =
RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

final RegExp phoneRegex =
RegExp(r'^[0-9]{7,15}$'); // generic international length

final RegExp passwordRegex =
RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$');





const notConnected =
    "You are not connected to internet, Please check your internet connection";
