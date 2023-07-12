import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/screen/bank_details/bankDetailsController.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;

class AddBankController extends GetxController {
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtACNo = TextEditingController();
  TextEditingController txtACType = TextEditingController();
  TextEditingController txtIFSC = TextEditingController();

  RxBool isValid = true.obs;
  RxString dropdownvalue = "Current A/C".obs;
  var formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

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

  var items = [
    'Current A/C',
    'Saving A/C',
  ];

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
          Get.find<BankDetailsController>().getAllBankDetailsData();

          // Get.toNamed(AppPages.payment);
          Get.back();

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
}
