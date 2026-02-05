import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krowdless/Utils/custom%20navigation.dart';
import 'package:krowdless/Views/Auth/signUp.dart';
import '../../Api services/cubit/Appcubit.dart';
import '../../Api services/cubit/appstate.dart';
import '../../Response model/loginResponse.dart';
import '../../Utils/colors.dart';
import '../../Utils/constant.dart';
import '../../Utils/custom widget.dart';
import '../../Utils/preference manager.dart';
import 'dashboard.dart';


class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  final TextEditingController signinEmailCtrl = TextEditingController();
  final TextEditingController signinPasswordCtrl = TextEditingController();
  final TextEditingController forgotEmailCtrl = TextEditingController();
  final TextEditingController newPasswordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();

  bool isPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  String? otpCode;

  /// ---------------- VALIDATIONS ----------------
  bool isValidSignin() {
    if (signinEmailCtrl.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    if (signinPasswordCtrl.text.isEmpty) {
      showToast(message: "Please enter password");
      return false;
    }
    return true;
  }

  bool isValidForgot() {
    if (forgotEmailCtrl.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    return true;
  }

  bool isValidNewPassword() {
    if (newPasswordCtrl.text.isEmpty) {
      showToast(message: "Please enter new password");
      return false;
    }
    if (confirmPasswordCtrl.text.isEmpty) {
      showToast(message: "Please enter confirm password");
      return false;
    }
    if (newPasswordCtrl.text != confirmPasswordCtrl.text) {
      showToast(message: "Passwords do not match");
      return false;
    }
    return true;
  }

  /// ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) async {
    if (state.status == AppStatus.loginSuccess) {
      LoginResponse loginResponse = state.responseData?.responseData as LoginResponse;
      showToast(message: loginResponse.message.toString() ?? "");
      await PreferenceManager.insertValue(
        key: "token",
        value: loginResponse.data?.token.toString() ?? "",
      );
      await PreferenceManager.insertValue(
        key: "userId",
        value: loginResponse.data?.userId.toString() ?? "",
      );
      await PreferenceManager.insertValue(
        key: "refreshToken",
        value: loginResponse.data?.refreshToken.toString() ?? "",
      );
      await PreferenceManager.insertValue(
        key: "username",
        value: loginResponse.data?.username.toString() ?? "",
      );
      await PreferenceManager.insertValue(
        key: "role",
        value: loginResponse.data?.role.toString() ?? "",
      );
      CustomNavigator.pushAndRemoveUntil(
        context: context,
        screen: BottomBar(),
      );
    }
    if (state.status == AppStatus.loginError) {
      String message = state.errorStatus?.message ?? state.error ?? "";
      showToast(context: context, message: message);
    }
  },
  builder: (context, state) {
    return Column(
          children: [
            SizedBox(height: height * 0.08),
            Icon(Icons.villa, size: 80, color: AppColors.darkBlue),
            SizedBox(height: height * 0.05),
            text(
              title: "SIGNIN",
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontcolor: AppColors.darkBlue,
            ),
            const SizedBox(height: 30),
            emailFormField(
              controller: signinEmailCtrl,
              labelText: "EMAIL",
              hintText: "example@gmail.com",
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 20),
            formField(
              controller: signinPasswordCtrl,
              labelText: "PASSWORD",
              hintText: "********",
              obscureText: isPasswordVisible,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                child: Icon(
                  isPasswordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.continueWith,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  forgotEmailCtrl.clear();
                  forgotPasswordSheet(context);
                },
                child: text(
                  title: "FORGOTPASSWORD",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontcolor: AppColors.black,
                ),
              ),
            ),

            const SizedBox(height: 40),

            buttonWithLightBackGround(
              title: "LOG IN",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              buttontextcolor: AppColors.white,
              onTap: () {
                Map<String, dynamic> loginDetails={
                  "email": signinEmailCtrl.text.trim(),
                  "password": signinPasswordCtrl.text.trim()
                };
                FocusScope.of(context).unfocus();
                if (!isValidSignin()) return;
                isInternetConnected().then((value) {
                  if (value) {
                    BlocProvider.of<AppCubit>(context).login(loginDetails);
                  } else {
                    showToast(context: context, message: notConnected);
                  }
                });



               // CustomNavigator.pushAndRemoveUntil(context: context, screen: BottomBar());
              },
              isLoading: state.status == AppStatus.loginLoading,
            ),
            sizeBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                text(title: "Already have an account ?"),
                sizeBox(width: 5),
                GestureDetector(
                    onTap: (){
                      CustomNavigator.push(context: context, screen: Signupscreen());
                    },
                    child: text(title: "Sign up",color: AppColors.orangeColor))
              ],
            ),
          ],
        );
  },
),
      ),
    );
  }

  /// ---------------- FORGOT PASSWORD ----------------
  void forgotPasswordSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: 320,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  text(
                    title: "FORGOT PASSWORD",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontcolor: AppColors.darkBlue,
                  ),

                  const SizedBox(height: 30),

                  emailFormField(
                    controller: forgotEmailCtrl,
                    labelText: "EMAIL",
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),

                  const SizedBox(height: 30),

                  buttonWithLightBackGround(
                    title: "SUBMIT",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    buttontextcolor: AppColors.white,
                    onTap: () {
                      if (!isValidForgot()) return;
                      Navigator.pop(context);
                      otpBottomSheet(context);
                    }, isLoading: false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// ---------------- OTP ----------------
  void otpBottomSheet(BuildContext context) {
    int timer = 30;
    bool canResend = false;
    Timer? t;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) {
        return StatefulBuilder(builder: (context, setState) {
          t ??= Timer.periodic(const Duration(seconds: 1), (_) {
            if (timer == 0) {
              t?.cancel();
              setState(() => canResend = true);
            } else {
              setState(() => timer--);
            }
          });

          return SizedBox(
            height: 380,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  text(
                    title: "VERIFICATION CODE",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontcolor: AppColors.darkBlue,
                  ),

                  const SizedBox(height: 20),

                  OtpTextField(
                    numberOfFields: 4,
                    onSubmit: (code) => otpCode = code,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    canResend
                        ? "Didn’t receive OTP?"
                        : "Resend OTP in $timer sec",
                    style: GoogleFonts.inter(fontSize: 14),
                  ),

                  TextButton(
                    onPressed: canResend
                        ? () {
                      setState(() {
                        timer = 30;
                        canResend = false;
                      });
                    }
                        : null,
                    child: const Text("Resend"),
                  ),

                  const SizedBox(height: 20),

                  buttonWithLightBackGround(
                    title: "VERIFY",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    buttontextcolor: AppColors.white,
                    onTap: () {
                      if (otpCode == null || otpCode!.length != 4) {
                        showToast(message: "Enter valid OTP");
                        return;
                      }
                      Navigator.pop(context);
                      newPasswordSheet(context);
                    }, isLoading: false,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  /// ---------------- NEW PASSWORD ----------------
  void newPasswordSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      text(
                        title: "NEW PASSWORD",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontcolor: AppColors.darkBlue,
                      ),

                      const SizedBox(height: 30),

                      formField(
                        controller: newPasswordCtrl,
                        labelText: "PASSWORD",
                        obscureText: !isNewPasswordVisible, // ✅ FIX
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isNewPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setModalState(() {
                              isNewPasswordVisible = !isNewPasswordVisible;
                            });
                          },
                        ),
                      ),


                      const SizedBox(height: 20),

                      formField(
                        controller: confirmPasswordCtrl,
                        labelText: "CONFIRM PASSWORD",
                        obscureText: !isConfirmPasswordVisible, // ✅ FIX
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setModalState(() {
                              isConfirmPasswordVisible =
                              !isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),


                      const SizedBox(height: 30),

                      buttonWithLightBackGround(
                        title: "SUBMIT",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        buttontextcolor: AppColors.white,
                        isLoading: false,
                        onTap: () {
                          if (!isValidNewPassword()) return;
                          Navigator.pop(context);
                          showToast(message: "Password updated (UI only)");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },

    );
  }

  @override
  void dispose() {
    signinEmailCtrl.dispose();
    signinPasswordCtrl.dispose();
    forgotEmailCtrl.dispose();
    newPasswordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }
}
