import 'dart:async';
import 'package:flutter/material.dart';
import 'package:krowdless/Utils/colors.dart';
import 'package:sizer/sizer.dart';
import '../../Utils/preference manager.dart';
import 'Signin.dart';
import 'dashboard.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String token = "";
  @override

  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async {
      token = await PreferenceManager.getStringValue(key: "token") ?? "";
      print("token in Splash:");
      print(token);

      if (token.isNotEmpty) {
        // ✅ User already logged in
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomBar()), // change to your home screen
              (route) => false,
        );
      } else {
        // ❌ No token → Login
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Signinscreen()),
              (route) => false,
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       height: 100.h,
        width: 100.w,
        color: AppColors.borderLight,
      ),
    );
  }
}
