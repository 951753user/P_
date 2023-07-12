import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/model/signUp_model.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/routes.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:payment_app/settings/settings.dart';

class SignupController extends GetxController {
  TextEditingController txtpan = TextEditingController();

  final formKey = GlobalKey<FormState>();
  RxBool isValid = false.obs;

  var panDetails = <Data>[].obs;

  RxBool isLoading = false.obs;

  bool validatePAN(String pan) {
    RegExp regExp = RegExp('^[A-Z]{5}[0-9]{4}[A-Z]{1}\$');
    if (regExp.hasMatch(pan)) {
      return true;
    } else {
      return false;
    }
  }

  void validate(String panNo) {
    if (formKey.currentState!.validate()) {
      if (validatePAN(txtpan.text)) {
        isValid.value = true;

        Settings.setPanNo = panNo;

        getPanCardNo(panNo);
        update();
      } else {
        isValid.value = false;
        update();
      }
    }
  }

  getPanCardNo(String panNo) async {
    try {
      isLoading.value = true;
      if (await checkConnection()) {
        Map<String, dynamic> requestBody = {
          'PancardNumber': panNo,
        };
        debugPrint("----------requestBody$requestBody");
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.signUp}";
        
        var response =
            await http.post(Uri.parse(url), body: {'PancardNumber': panNo});
        
        debugPrint("getPanDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getPanDetails Body===>>>${response.body}");
        if (response.statusCode == 200) {
          
          isLoading.value = false;
          var result = SignUpDetailsModel.fromJson(json.decode(response.body));

          showToast("${result.status}");
          Get.offAllNamed(AppPages.pandetail);

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
}
