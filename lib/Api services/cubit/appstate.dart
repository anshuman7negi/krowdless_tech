

import 'package:equatable/equatable.dart';

import '../../Utils/response status.dart';



enum AppStatus {
  initial,


  loginLoading,
  loginSuccess,
  loginError,

  signUpSuccess,
  signUpLoading,
  signUpError,

  profileSuccess,
  profileLoading,
  profileError,

  verifyOtpSuccess,
  verifyOtpLoading,
  verifyOtpError,




  // New status for image updates
}

class AppState extends Equatable {
  final AppStatus status;
  final ResponseStatus? responseData;
  final ErrorStatus? errorStatus;
  final String? error;
  final String? token;

  const AppState({
    this.status = AppStatus.initial,
    this.responseData,
    this.errorStatus,
    this.error,
    this.token,
  });

  @override
  List<Object?> get props => [status, responseData, errorStatus, error, token];

  AppState copyWith({
    AppStatus? status,
    ResponseStatus? responseData,
    ErrorStatus? errorStatus,
    String? error,

    String? token,
  }) {
    return AppState(
      status: status ?? this.status,
      responseData: responseData ?? this.responseData,
      errorStatus: errorStatus ?? this.errorStatus,
      error: error ?? this.error,
      token: token ?? this.token,
    );
  }
}
