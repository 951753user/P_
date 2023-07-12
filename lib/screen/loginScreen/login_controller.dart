import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/settings/settings.dart';

class LoginController extends GetxController {
  TextEditingController txtpan = TextEditingController();
  TextEditingController txtpass = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isValid = false.obs;

  RxBool passObSecure = true.obs;

  bool validatePAN(String pan) {
    RegExp regExp = RegExp('^[A-Z]{5}[0-9]{4}[A-Z]{1}\$');
    if (regExp.hasMatch(pan)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~_.]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  void validate(String panCardNo, String passowrd) {
    if (formKey.currentState!.validate()) {
      if (validatePAN(txtpan.text) && validatePassword(txtpass.text)) {
        isValid.value = true;
        getLoginDetails(panCardNo, passowrd, true);
        update();
      } else {
        isValid.value = false;
        update();
      }
    }
  }

  RxBool isLoading = false.obs;

  getLoginDetails(String panCardNo, String passowrd, bool route) async {
    try {
      isLoading.value = true;
      if (await checkConnection()) {
        Map<String, dynamic> requestBody = {
          'PancardNumber': panCardNo,
          'Password': passowrd
        };
        debugPrint("----------requestBody$requestBody");
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.signIn}";
        var response = await http.post(Uri.parse(url),
            body: {'PancardNumber': panCardNo, 'Password': passowrd});
        debugPrint("getLoginDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getLoginDetails Body===>>>${response.body}");

        if (response.statusCode == 200) {
          isLoading.value = false;
          if (route == true) {
            if (response.body == "login is successfuly") {
              showToast("Login Successfully");
            } else {
              showToast(response.body);
            }
          }

          if (route == true) {
            if (response.body == "login is successfuly") {
              Settings.setPanNo = txtpan.text;
              Settings.setPassword = txtpass.text;
              Settings.setUserLogIn = true;
              debugPrint(
                  "============================================${Settings.panNo}");
              Get.offAllNamed(AppPages.home);
            }
          }
        }
      }
    } catch (e) {
      debugPrint("getPanDetails:- $e");
      if (route == true) {
        showToast(ServiceConfiguration.commonErrorMessage);
      }
      isLoading.value = false;
    }
  }
}
