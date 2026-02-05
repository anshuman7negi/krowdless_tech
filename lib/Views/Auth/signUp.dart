import 'dart:async';
import 'dart:io';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krowdless/Api%20services/cubit/Appcubit.dart';
import 'package:krowdless/Api%20services/cubit/appstate.dart';
import 'package:krowdless/Utils/custom%20navigation.dart';

import '../../Response model/signUpResponse.dart';
import '../../Utils/colors.dart';
import '../../Utils/constant.dart';
import '../../Utils/custom widget.dart';
import 'Signin.dart';


class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final GlobalKey<CountryCodePickerState> _countryPickerKey = GlobalKey();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();

  bool acceptTerms = false;
  bool showPassword = true;
  bool showConfirmPassword = true;
  String countryCode = "+1";
  String? otp;

  /// ---------------- VALIDATION ----------------
  bool isValid() {
    // NAME
    if (nameCtrl.text.trim().isEmpty) {
      showToast(message: "Name is required");
      return false;
    }

    if (nameCtrl.text.trim().length < 3) {
      showToast(message: "Name must be at least 3 characters");
      return false;
    }

    // EMAIL
    if (emailCtrl.text.trim().isEmpty) {
      showToast(message: "Email is required");
      return false;
    }

    if (!emailRegex.hasMatch(emailCtrl.text.trim())) {
      showToast(message: "Enter a valid email address");
      return false;
    }

    // PHONE (NO COUNTRY CODE VALIDATION)
    if (phoneCtrl.text.trim().isEmpty) {
      showToast(message: "Phone number is required");
      return false;
    }

    if (!phoneRegex.hasMatch(phoneCtrl.text.trim())) {
      showToast(message: "Enter a valid phone number");
      return false;
    }

    // PASSWORD
    if (passwordCtrl.text.isEmpty) {
      showToast(message: "Password is required");
      return false;
    }

    if (!passwordRegex.hasMatch(passwordCtrl.text)) {
      showToast(
        message:
        "Password must be 8+ chars, include uppercase, lowercase, number & special character",
      );
      return false;
    }

    // CONFIRM PASSWORD
    if (confirmPasswordCtrl.text.isEmpty) {
      showToast(message: "Confirm password is required");
      return false;
    }

    if (passwordCtrl.text != confirmPasswordCtrl.text) {
      showToast(message: "Passwords do not match");
      return false;
    }

    // TERMS
    if (!acceptTerms) {
      showToast(message: "Accept terms & conditions");
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
        centerTitle: true,
        title: text(
          title: "CREATE YOUR ACCOUNT",
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: AppColors.darkBlue,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    if(state.status == AppStatus.signUpSuccess){
      SignUpResponse Response = state.responseData?.responseData as SignUpResponse;
      showToast(message:Response.message.toString());
      Navigator.pop(context);

      // CustomNavigator.push(context: context, screen: Verifyotp(isFrom: 'Signup', email: emailController.text.trim(), deviceToken: '',));

    }
    if (state.status == AppStatus.signUpError) {
      String message = state.errorStatus?.message ?? state.error ?? "";
      showToast(context: context, message: message);
    }
  },
  builder: (context, state) {
    return Column(
          children: [
            customsizedbox(height: 20),

            /// NAME
            formField(
              controller: nameCtrl,
              labelText: "NAME",
              hintText: "XXXXXXXX",
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
              ],
              prefixIcon: const Icon(Icons.person_outline),
            ),

            customsizedbox(height: 20),

            /// EMAIL
            emailFormField(
              controller: emailCtrl,
              labelText: "EMAIL",
              hintText: "example@gmail.com",
              prefixIcon: const Icon(Icons.email_outlined),
            ),

            customsizedbox(height: 20),

            /// PHONE
            formField(
              controller: phoneCtrl,
              labelText: "PHONENUMBER",
              inputType: TextInputType.number,
              maxLength: 16,
              hintText: "XXXXXXXXX",
              // prefixIcon: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     // CountryCodePicker(
              //     //   key: _countryPickerKey,
              //     //   initialSelection: 'US',
              //     //   favorite: const ['+1', 'US'],
              //     //   showCountryOnly: true,
              //     //   showOnlyCountryWhenClosed: true,
              //     //   onChanged: (code) {
              //     //     countryCode = code.dialCode ?? "+1";
              //     //   },
              //     // ),
              //     // text(
              //     //   title: countryCode,
              //     //   fontSize: 14,
              //     //   fontWeight: FontWeight.w600,
              //     //   fontcolor: AppColors.black,
              //     // ),
              //     // const Icon(Icons.keyboard_arrow_down),
              //   ],
              // ),
            ),

            customsizedbox(height: 20),

            /// PASSWORD
            formField(
              controller: passwordCtrl,
              labelText: "PASSWORD",
              obscureText: showPassword,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  showPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() => showPassword = !showPassword);
                },
              ),
            ),

            customsizedbox(height: 20),

            /// CONFIRM PASSWORD
            formField(
              controller: confirmPasswordCtrl,
              labelText: "CONFIRMPASSWORD",
              obscureText: showConfirmPassword,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  showConfirmPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() =>
                  showConfirmPassword = !showConfirmPassword);
                },
              ),
            ),

            customsizedbox(height: 20),

            /// TERMS
            Row(
              children: [
                Checkbox(
                  value: acceptTerms,
                  activeColor: AppColors.continueBorder,
                  onChanged: (v) => setState(() => acceptTerms = v!),
                ),
                textOpen(title: "IACCEPT", fontSize: 14),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (_) => Termsandconditions()),
                    // );
                  },
                  child: textOpen(
                    title: "TERMSANDCONDITIONS",
                    fontSize: 14,
                    color: AppColors.continueBorder,
                  ),
                ),
              ],
            ),

            customsizedbox(height: 20),

            /// SIGN UP
            buttonWithLightBackGround(
              title: "SIGN UP",
              fontSize: 16,
              fontWeight: FontWeight.w700,
              buttontextcolor: AppColors.white,
              onTap: () {
                FocusScope.of(context).unfocus();
                if (!isValid()) return;
                Map<String, dynamic> details =
                {"username": nameCtrl.text.trim(),
                  "email": emailCtrl.text.trim(),
                  "phone": phoneCtrl.text.trim(),
                  "password": passwordCtrl.text.trim()};
                isInternetConnected().then((value) {
                  if (value) {
                    BlocProvider.of<AppCubit>(context).signUp(details);
                  } else {
                    showToast(context: context, message: notConnected);
                  }
                });
                // verifyOtpBottomSheet(context);
              },
              isLoading: state.status ==AppStatus.signUpLoading,
            ),
            customsizedbox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                InkWell(
                  onTap: () {

                  },
                  child: const Text(
                    " SignIn",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            customsizedbox(height: height * 0.05),
          ],
        );
  },
),
      ),
    );
  }

  void verifyOtpBottomSheet(BuildContext context) {
    int timer = 30;
    bool canResend = false;
    Timer? t;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (_) {
        return StatefulBuilder(builder: (_, setState) {
          t ??= Timer.periodic(const Duration(seconds: 1), (_) {
            if (timer == 0) {
              t?.cancel();
              setState(() => canResend = true);
            } else {
              setState(() => timer--);
            }
          });

          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  text(
                    title: "VERIFICATION CODE",
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontcolor: AppColors.darkBlue,
                  ),

                  customsizedbox(height: 20),

                  OtpTextField(
                    numberOfFields: 4,
                    onSubmit: (code) => otp = code,
                  ),

                  customsizedbox(height: 20),

                  Text(
                    canResend
                        ? "Didn’t receive OTP?"
                        : "Resend OTP in $timer sec",
                    style: GoogleFonts.inter(),
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

                  customsizedbox(height: 20),

                  buttonWithLightBackGround(
                    title: "SUBMIT",
                    onTap: () {
                      if (otp == null || otp!.length != 4) {
                        showToast(message: "Enter valid OTP");
                        return;
                      }
                      Navigator.pop(context);
                      showToast(
                          message:
                          "Signup completed (UI only)");
                    }, isLoading: false,
                  ),
                ],
              ),
            ),
          );
        });
      },
    ).whenComplete(() => t?.cancel());
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPasswordCtrl.dispose();
    super.dispose();
  }
}
