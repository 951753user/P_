// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/model/pan_details_model.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;

class PanDetailsController extends GetxController {
  TextEditingController txtfirst = TextEditingController();
  TextEditingController txtmiddle = TextEditingController();
  TextEditingController txtlast = TextEditingController();
  TextEditingController txtdob = TextEditingController();
  TextEditingController txtIFSC = TextEditingController();

  RxBool isValid = true.obs;
  var formKey = GlobalKey<FormState>();

  RxString gender = "".obs;

  var panDetails = <Data>[].obs;

  RxBool isLoading = false.obs;

  void validate(
      String firstName, String middleName, String lastName, String gender) {
    if (formKey.currentState!.validate()) {
      isValid.value = true;
      getPanDetails(firstName, middleName, lastName, gender);
      update();
    } else {
      isValid.value = false;
      update();
    }
  }

  getPanDetails(String firstName, String middleName, String lastName,
      String gender) async {
    try {
      isLoading.value = true;
      if (await checkConnection()) {
        Map<String, dynamic> requestBody = {
          'FirstName': firstName,
          "MiddleName": middleName,
          "LastName": lastName,
          "Gender": gender
        };
        debugPrint("----------requestBody$requestBody");
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.panCardDetails}";
        // Map<String, String> herader = {
        //   "Content-Type": "application/json",
        //   'Authorization': 'Bearer ${Settings.accessToken}'
        // };
        // isLoading.value = true;
        var response = await http.post(Uri.parse(url), body: {
          'FirstName': firstName,
          "MiddleName": middleName,
          "LastName": lastName,
          "Gender": gender
        });
        // isLoading.value = false;
        debugPrint("getPanDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getPanDetails Body===>>>${response.body}");
        if (response.statusCode == 200) {
          // leaderBoadrDataLoaded.value = true;
          isLoading.value = false;
          var result = PanCardDetailsModel.fromJson(json.decode(response.body));
          Get.offAllNamed(AppPages.register);

          panDetails.value = result.data as List<Data>;
          debugPrint(
              "getPanDetails STATUS CODE===>>> ${panDetails.first.pancardNumber}");
          // debugPrint(getCreateCricket.data!.records.first.);
          // Get.toNamed('/selected_team_view');
        }
      }
    } catch (e) {
      debugPrint("getPanDetails:- $e");
      isLoading.value = false;
    }
  }
}
