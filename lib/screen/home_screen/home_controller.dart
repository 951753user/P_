87p[]\pimport 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/model/user_all_details_model.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/settings/settings.dart';

class Homecontroller extends GetxController {
  var userAllDetails = <Datum>[].obs;

  RxBool userDetailsLoading = false.obs;
  RxBool hasData = false.obs;

  getAllUserDetails() async {
    userAllDetails.clear();
    try {
      userDetailsLoading.value = true;
      if (await checkConnection()) {
        userAllDetails.clear();
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.allData}/${Settings.panNo}";

        var response = await http.get(Uri.parse(url));

        debugPrint("getAllUserDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getAllUserDetails Body===>>>${response.body}");
        if (response.statusCode == 200) {
          // leaderBoadrDataLoaded.value = true;
          var result = UserAllDetailsModel.fromJson(json.decode(response.body));

          if(result.data != null){
            userAllDetails.value = result.data ?? [];
          }

          if (userAllDetails.isNotEmpty) {
            userDetailsLoading.value = false;
            hasData.value = true;
          }
        } else {
          userDetailsLoading.value = false;
          hasData.value = false;
        }
      } else {
        userDetailsLoading.value = false;
        hasData.value = false;
        showToast("Check Internet Connection");
      }
    } catch (e) {
      // showToast("$e");
      userDetailsLoading.value = false;
      hasData.value = false;
    }
  }

  @override
  void onInit() {
    getAllUserDetails();
    super.onInit();
  }
}
