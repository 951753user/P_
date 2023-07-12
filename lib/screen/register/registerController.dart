// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/model/register_model.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/settings/settings.dart';

class RegisterController extends GetxController {
  @override
  void onInit() {
    txtnum.text = "+91";
    super.onInit();
  }

  RxString verificationId = "".obs;

  TextEditingController txtnum = TextEditingController();
  TextEditingController txtpass = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  // FlutterOtp otp = FlutterOtp();

  RxString phoneNumber = "7862952601".obs; //enter your 10 digit number
  RxInt minNumber = 1000.obs;
  RxInt maxNumber = 6000.obs;
  RxString countryCode = "+91".obs;

  // FirebaseAuth auth = FirebaseAuth.instance;

  RxString verifyId = "".obs;
  Duration myDuration = const Duration(seconds: 60);
  Timer? countdownTimer;

  RxBool passObSecure = true.obs;

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_.]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validateConfirmPassword(String value) {
    if (txtConfirmPassword.text == txtpass.text) {
      return true;
    } else {
      return false;
    }
  }

  RxBool isValid = true.obs;
  var formKey = GlobalKey<FormState>();

  RxBool visible = false.obs;

  void validate(String number, String password) {
    if (formKey.currentState!.validate()) {
      isValid.value = true;
      getRegisterDetails(number, password);
      update();
    } else {
      isValid.value = false;
      update();
    }
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    countdownTimer!.cancel();
    update();
  }

  void resetTimer() {
    stopTimer();
    myDuration = const Duration(seconds: 60);
    update();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;

    final seconds = myDuration.inSeconds - reduceSecondsBy;

    if (seconds < 0) {
      countdownTimer!.cancel();
      resetTimer();
      visible.value = false;
    } else {
      myDuration = Duration(seconds: seconds);
      update();
    }
    update();
  }

  RxBool isLoading = false.obs;

  getRegisterDetails(String number, String password) async {
    try {
      isLoading.value = true;
      if (await checkConnection()) {
        Map<String, dynamic> requestBody = {
          "MobileNumber": number,
          "Password": password
        };
        debugPrint("----------requestBody$requestBody");
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.register}";

        var response = await http.post(Uri.parse(url),
            body: {"MobileNumber": number, "Password": password});

        debugPrint(
            "getRegisterDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getRegisterDetails Body===>>>${response.body}");
        if (response.statusCode == 200) {
          isLoading.value = false;
          var result = RegisterModel.fromJson(json.decode(response.body));

          Settings.setUserLogIn = true;
          Settings.setPassword = txtConfirmPassword.text;

          showToast("${result.status}");
          Get.offAllNamed(AppPages.home);

          // panDetails.value = result.data as List<Data>;
          // debugPrint(
          //     "getPanDetails STATUS CODE===>>> ${panDetails.first.pancardNumber}");
        }
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint("getPanDetails:- $e");
      showToast(ServiceConfiguration.commonErrorMessage);
    }
  }

  // void sendOtp(String phoneNumber, String otp) {
  //   SmsSender sender = new SmsSender();
  //   String message = "Your OTP is: $otp";
  //   sender.sendSms(new SmsMessage(phoneNumber, message));
  // }
}
