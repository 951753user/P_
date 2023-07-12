import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/screen/loginScreen/login_controller.dart';
import 'package:payment_app/settings/settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if(Settings.userLoggedIn == true){
      Get.find<LoginController>().getLoginDetails(Settings.panNo, Settings.password,false);
    }


    Timer(const Duration(seconds: 3), () { 
      if (Settings.userLoggedIn) {
      Get.offAllNamed(AppPages.home);
    } else {
      Get.toNamed(AppPages.signup);
    }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: 150.sp,
                ),
                Text(
                  "CA App",
                  style: TextStyle(
                      color: kprimaryColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: CircularProgressIndicator(
                color: kprimaryLightColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
