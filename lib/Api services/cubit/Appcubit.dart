// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../Utils/preference manager.dart';
// import '../../Utils/response status.dart';
// import '../repo/Apprepository.dart';
// import 'appstate.dart';
//
//
//
// class AppCubit extends Cubit<AppState> {
//   final AppRepository repository;
//   String? token;
//
//   AppCubit(this.repository) : super(const AppState());
//
//   Future<void> loadToken() async {
//     token = PreferenceManager.getStringValue(key: "token");
//     debugPrint("🔥 Token loaded in AppCubit: $token");
//   }
//
//   Future<void> login(Map<String, dynamic> loginDetails) async {
//     emit(state.copyWith(status: AppStatus.loginLoading));
//     try {
//       ResponseStatus response = await repository.login(loginDetails);
//       emit(state.copyWith(
//           status: AppStatus.loginSuccess, responseData: response));
//     } on ErrorStatus catch (errorstatus) {
//       emit(state.copyWith(
//           status: AppStatus.loginError,
//           error: null,
//           errorStatus: errorstatus));
//     } catch (e) {
//       emit(state.copyWith(
//         status: AppStatus.loginError,
//         error: e.toString(),
//         errorStatus: null,
//       ));
//     }
//   }
//
//   Future<void> signUp(Map<String, dynamic> details) async {
//     emit(state.copyWith(status: AppStatus. signUpLoading));
//     try {
//       ResponseStatus response = await repository.signUp(details);
//       emit(state.copyWith(
//           status: AppStatus. signUpSuccess, responseData: response));
//     } on ErrorStatus catch (errorstatus) {
//       emit(state.copyWith(
//           status: AppStatus. signUpError,
//           error: null,
//           errorStatus: errorstatus));
//     } catch (e) {
//       emit(state.copyWith(
//         status: AppStatus. signUpError,
//         error: e.toString(),
//         errorStatus: null,
//       ));
//     }
//   }
//
//   Future<void> getProfile() async {
//     emit(state.copyWith(status: AppStatus.profileLoading));
//
//     try {
//       if (token == null || token!.isEmpty) {
//         throw Exception("Token not found");
//       }
//
//       ResponseStatus response = await repository.getProfile(token!);
//
//       emit(state.copyWith(
//         status: AppStatus.profileSuccess,
//         responseData: response,
//       ));
//     } on ErrorStatus catch (errorstatus) {
//       emit(state.copyWith(
//         status: AppStatus.profileError,
//         error: null,
//         errorStatus: errorstatus,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         status: AppStatus.profileError,
//         error: e.toString(),
//         errorStatus: null,
//       ));
//     }
//   }
//
//
//
//
//
//
// }
//


import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utils/preference manager.dart';
import '../../Utils/response status.dart';
import '../repo/Apprepository.dart';
import 'appstate.dart';

class AppCubit extends Cubit<AppState> {
  final AppRepository repository;
  String? token;

  AppCubit(this.repository) : super(const AppState());

  /// Load token ONCE at app start
  Future<void> loadToken() async {
    token = PreferenceManager.getStringValue(key: "token");
    debugPrint("🔥 Token loaded in AppCubit: $token");
  }

  /// Save token after login
  Future<void> saveToken(String newToken) async {
    await PreferenceManager.insertValue(
      key: "token",
      value: newToken,
    );
    token = newToken;
    debugPrint("✅ Token saved: $token");
  }

  // /// Clear token on logout
  // Future<void> clearToken() async {
  //   await PreferenceManager.removeValue(key: "token");
  //   token = null;
  //   debugPrint("🧹 Token cleared");
  // }

  /// LOGIN
  Future<void> login(Map<String, dynamic> loginDetails) async {
    emit(state.copyWith(status: AppStatus.loginLoading));

    try {
      ResponseStatus response = await repository.login(loginDetails);
      emit(state.copyWith(
        status: AppStatus.loginSuccess,
        responseData: response,
      ));
    } on ErrorStatus catch (errorstatus) {
      emit(state.copyWith(
        status: AppStatus.loginError,
        error: null,
        errorStatus: errorstatus,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.loginError,
        error: e.toString(),
        errorStatus: null,
      ));
    }
  }

  /// SIGN UP
  Future<void> signUp(Map<String, dynamic> details) async {
    emit(state.copyWith(status: AppStatus.signUpLoading));

    try {
      ResponseStatus response = await repository.signUp(details);

      emit(state.copyWith(
        status: AppStatus.signUpSuccess,
        responseData: response,
      ));
    } on ErrorStatus catch (errorstatus) {
      emit(state.copyWith(
        status: AppStatus.signUpError,
        error: null,
        errorStatus: errorstatus,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.signUpError,
        error: e.toString(),
        errorStatus: null,
      ));
    }
  }

  Future<void> getProfile() async {
    emit(state.copyWith(status: AppStatus.profileLoading));

    try {
      if (token == null || token!.isEmpty) {
        throw Exception("Auth token not found");
      }

      ResponseStatus response = await repository.getProfile(token!);

      emit(state.copyWith(
        status: AppStatus.profileSuccess,
        responseData: response,
      ));
    } on ErrorStatus catch (errorstatus) {
      emit(state.copyWith(
        status: AppStatus.profileError,
        error: null,
        errorStatus: errorstatus,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.profileError,
        error: e.toString(),
        errorStatus: null,
      ));
    }
  }
}
