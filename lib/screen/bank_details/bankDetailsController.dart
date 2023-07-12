// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/model/bank_details_model.dart';
import 'package:payment_app/model/user_bank_details_model.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/settings/settings.dart';

class BankDetailsController extends GetxController {
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtACNo = TextEditingController();
  TextEditingController txtACType = TextEditingController();
  TextEditingController txtIFSC = TextEditingController();

  RxString dropdownvalue = "Current A/C".obs;

  var bankDetails = <BankData>[].obs;

  var items = [
    'Current A/C',
    'Saving A/C',
  ];

  RxBool isValid = true.obs;
  var formKey = GlobalKey<FormState>();

  var allBankDetails = <Datum>[].obs;
  // var allBankDetails = <BankData>[].obs;

  RxBool dataLoading = false.obs;

  RxBool dataAdded = false.obs;

  void validate(
    String bankName,
    String address,
    String acNo,
    String acType,
    String ifscNo,
  ) {
    if (formKey.currentState!.validate()) {
      isValid.value = true;
      getBankDetails(bankName, address, acNo, acType, ifscNo);
      update();
    } else {
      isValid.value = false;
      update();
    }
  }

  RxBool isLoading = false.obs;
  RxBool allDataLoading = false.obs;

  getAllBankDetailsData() async {
    allBankDetails.clear();
    try {
      allDataLoading.value = true;
      if (await checkConnection()) {
        allBankDetails.clear();
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.bankDetails}/${Settings.panNo}";

        var response = await http.get(Uri.parse(url));

        debugPrint("getBankDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getBankDetails Body===>>>${response.body}");
        if (response.statusCode == 200) {
          // leaderBoadrDataLoaded.value = true;
          var result =
              UserBankDetailsModel.fromJson(json.decode(response.body));

          if (result.data != null) {
            allBankDetails.value = result.data ?? [];
            allDataLoading.value = false;
          }

          isLoading.value = false;

          // if (result.data != null) {
          //   allBankDetails.value = result.data ?? [];
          //   // for(var bData in result.data!){
          //   //   if(Settings.panNo == bData.pancardNumber){
          //   //     allBankDetails.add(bData);
          //   //   }
          //   // }
          // }
          debugPrint(
              "getBankDetails STATUS CODE===>>> ${bankDetails.first.ifscNumber}");
        }
      } else {
        allDataLoading.value = false;
        // showToast("Check Internet Connection");
      }
    } catch (e) {
      // showToast("$e");
      allDataLoading.value = false;
    }
  }

  getBankDetails(
    String bankName,
    String address,
    String acNo,
    String acType,
    String ifscNo,
  ) async {
    try {
      if (await checkConnection()) {
        isLoading.value = true;
        // Map<String, dynamic> requestBody = {
        //   'FirstName': firstName,
        //   "MiddleName": middleName,
        //   "LastName": lastName,
        //   "Gender": gender
        // };
        // debugPrint("----------requestBody$requestBody");
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.bankDetails}";
        // Map<String, String> herader = {
        //   "Content-Type": "application/json",
        //   'Authorization': 'Bearer ${Settings.accessToken}'
        // };
        // isLoading.value = true;
        var response = await http.post(Uri.parse(url), body: {
          "bankName": bankName,
          "address": address,
          "acNumber": acNo,
          "acType": acType,
          "ifscNumber": ifscNo
        });
        // isLoading.value = false;
        debugPrint("getBankDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getBankDetails Body===>>>${response.body}");
        if (response.statusCode == 200) {
          //   // leaderBoadrDataLoaded.value = true;
          //   var result = BankDetailsModel.fromJson(json.decode(response.body));
          //   isLoading.value = false;
          //   showToast("${result.status}");
          getAllBankDetailsData();
          dataAdded.value = true;
          // storage.write('bankDetails', true);

          Settings.setBankDetails = true;

          dataAdded.value = Settings.bankDetails;
          Get.toNamed(AppPages.payment);

          //   bankDetails.value = result.data ?? [];
          //   debugPrint(
          //       "getBankDetails STATUS CODE===>>> ${bankDetails.first.ifscNumber}");
        }
      } else {
        showToast("Check Internet Connection");
      }
    } catch (e) {
      debugPrint("getBankDetails:- $e");
      showToast(ServiceConfiguration.commonErrorMessage);
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getAllBankDetailsData();
    // dataAdded.value = storage.read('bankDetails');
    dataAdded.value = Settings.bankDetails;

    super.onInit();
  }
}
