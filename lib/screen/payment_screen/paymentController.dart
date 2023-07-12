// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/model/payment_method_model.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  @override
  void onInit() {
    googlePayConfigFuture =
        PaymentConfiguration.fromAsset('sample_payment_configuration.json');
    super.onInit();
  }

  TextEditingController txtCardNumber = TextEditingController();
  TextEditingController txtCardHolderName = TextEditingController();
  TextEditingController txtExpire = TextEditingController();
  TextEditingController txtCvv = TextEditingController();

  RxBool isValid = true.obs;
  var formKey = GlobalKey<FormState>();

  late final Future<PaymentConfiguration> googlePayConfigFuture;

  void onGooglePayResult(paymentResult) {
    log(paymentResult.toString());
    // debugPrint(
    //     "==============================================${paymentResult.toString()}");
  }

  void validate(String cardNo,
    String cardHolderName,
    String expireDate,
    String cvv,) {
    if (formKey.currentState!.validate()) {
      isValid.value = true;
      getPaymentMethodData(cardNo, cardHolderName, expireDate, cvv);
      update();
    } else {
      isValid.value = false;
      update();
    }
  }

  var paymentMethod = <Data>[].obs;

  RxBool isLoading = false.obs;

  getPaymentMethodData(
    String cardNo,
    String cardHolderName,
    String expireDate,
    String cvv,
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
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.paymentMethod}";
        // Map<String, String> herader = {
        //   "Content-Type": "application/json",
        //   'Authorization': 'Bearer ${Settings.accessToken}'
        // };
        // isLoading.value = true;
        var response = await http.post(Uri.parse(url), body: {
          "cardNumber": cardNo,
          "cardHolderName": cardHolderName,
          "expireDate": expireDate,
          "cvvNumber": cvv
        });
        // isLoading.value = false;
        debugPrint(
            "getPaymentMethodData STATUS CODE===>>>${response.statusCode}");
        debugPrint("getPaymentMethodData Body===>>>${response.body}");
        if (response.statusCode == 200) {
          // leaderBoadrDataLoaded.value = true;
          var result =
              PaymentMethodModel.fromJson(json.decode(response.body));
          isLoading.value = false;
          showToast("${result.status}");

          Get.back();

          paymentMethod.value = result.data as List<Data>;
          debugPrint(
              "getPaymentMethodData STATUS CODE===>>> ${paymentMethod.first.cardNumber}");

          // debugPrint(getCreateCricket.data!.records.first.);
          // Get.toNamed('/selected_team_view');
        }
      }
    } catch (e) {
      debugPrint("getPaymentMethodData:- $e");
    }
  }
}
