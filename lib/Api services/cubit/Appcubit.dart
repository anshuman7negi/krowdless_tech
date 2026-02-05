import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utils/response status.dart';
import '../repo/Apprepository.dart';
import 'appstate.dart';



class AppCubit extends Cubit<AppState> {
  final AppRepository repository;
//
  AppCubit(this.repository) : super(const AppState());

  Future<void> login(Map<String, dynamic> loginDetails) async {
    emit(state.copyWith(status: AppStatus.loginLoading));
    try {
      ResponseStatus response = await repository.login(loginDetails);
      emit(state.copyWith(
          status: AppStatus.loginSuccess, responseData: response));
    } on ErrorStatus catch (errorstatus) {
      emit(state.copyWith(
          status: AppStatus.loginError,
          error: null,
          errorStatus: errorstatus));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus.loginError,
        error: e.toString(),
        errorStatus: null,
      ));
    }
  }

  Future<void> signUp(Map<String, dynamic> details) async {
    emit(state.copyWith(status: AppStatus. signUpLoading));
    try {
      ResponseStatus response = await repository.signUp(details);
      emit(state.copyWith(
          status: AppStatus. signUpSuccess, responseData: response));
    } on ErrorStatus catch (errorstatus) {
      emit(state.copyWith(
          status: AppStatus. signUpError,
          error: null,
          errorStatus: errorstatus));
    } catch (e) {
      emit(state.copyWith(
        status: AppStatus. signUpError,
        error: e.toString(),
        errorStatus: null,
      ));
    }
  }




}

