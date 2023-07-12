// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/model/personal_details_model.dart';
import 'package:payment_app/model/user_personal_details_model.dart';
import 'package:payment_app/services/service_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/settings/settings.dart';

class PersonalDetailsController extends GetxController {
  TextEditingController txtPanNo = TextEditingController(text: Settings.panNo);
  TextEditingController txtDOB = TextEditingController();
  TextEditingController txtFatherName = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtGender = TextEditingController();
  TextEditingController txtMaritialStatus = TextEditingController();
  TextEditingController txtAadhaarNo = TextEditingController();
  TextEditingController txtResidentialStatus = TextEditingController();

  RxString gender = "".obs;

  RxBool isValid = false.obs;
  RxBool check = false.obs;
  RxBool fcheck = false.obs;

  var formKey = GlobalKey<FormState>();

  var personalDetails = <Datum>[].obs;
  RxBool personalDetailsLoading = false.obs;

  void validate(
    String panNo,
    String dob,
    String fatherName,
    String address,
    String gender,
    String martial,
    String aadhaarNo,
    String residential,
  ) {
    if (formKey.currentState!.validate()) {
      isValid.value = true;
      getPerosonalDetails(panNo, dob, fatherName, address, gender, martial,
          aadhaarNo, residential);
      update();
    } else {
      isValid.value = false;
      update();
    }
  }

  RxBool isLoading = false.obs;

  getAllPerosonalDetails() async {
    personalDetails.clear();
    try {
      personalDetailsLoading.value = true;
      if (await checkConnection()) {
        personalDetails.clear();
        String url =
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.personalDetails}/${Settings.panNo}";

        var response = await http.get(
          Uri.parse(url),
        );

        debugPrint(
            "getAllPerosonalDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getAllPerosonalDetails Body===>>>${response.body}");
        if (response.statusCode == 200) {
          // leaderBoadrDataLoaded.value = true;
          var result =
              UserPersonalDetailsModel.fromJson(json.decode(response.body));

          if (result.data != null) {
            personalDetails.value = result.data ?? [];
            isLoading.value = false;

            // if (personalDetails.isNotEmpty) {
            personalDetailsLoading.value = false;
            // } else {
            // }
          }
        }
      } else {
        personalDetailsLoading.value = false;
        showToast("Check Internet Connection");
      }
    } catch (e) {
      // showToast("$e");
      personalDetailsLoading.value = false;
    }
  }

  getPerosonalDetails(
    String panNo,
    String dob,
    String fatherName,
    String address,
    String gender,
    String martial,
    String aadhaarNo,
    String residential,
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
            "${ServiceConfiguration.baseUrl}${ServiceConfiguration.personalDetails}";
        // Map<String, String> herader = {
        //   "Content-Type": "application/json",
        //   'Authorization': 'Bearer ${Settings.accessToken}'
        // };
        // isLoading.value = true;
        var response = await http.post(Uri.parse(url), body: {
          "Pancard": panNo,
          "DataOfBirth": dob,
          "FatherName": fatherName,
          "Address": address,
          "Gender": gender,
          "Martial": martial,
          "AadhaarNumber": aadhaarNo,
          "Residential": residential
        });
        // isLoading.value = false;
        debugPrint(
            "getPerosonalDetails STATUS CODE===>>>${response.statusCode}");
        debugPrint("getPerosonalDetails Body===>>>${response.body}");

        if (response.statusCode == 200) {
          // leaderBoadrDataLoaded.value = true;
          if (response.body == "Data updated successfully") {
            isLoading.value = false;
            showToast(response.body);
            getAllPerosonalDetails();
            Get.back();
          } else {
            var result =
                PersonalDetailsModel.fromJson(json.decode(response.body));
            isLoading.value = false;
            getAllPerosonalDetails();
            showToast("${result.status}");

            Get.back();
          }

          // personalDetails.value = result.data as List<Data>;
          // debugPrint(
          //     "getPerosonalDetails STATUS CODE===>>> ${personalDetails.first.aadhaarNumber}");

          // debugPrint(getCreateCricket.data!.records.first.);
          // Get.toNamed('/selected_team_view');
        }
      }
    } catch (e) {
      debugPrint("getPerosonalDetails:- $e");
      isLoading.value = false;
      showToast(ServiceConfiguration.commonErrorMessage);
    }
  }

  getDateOfBirth(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF174977), // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: kprimaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      txtDOB.text = formattedDate;
      update();
    } else {}
  }

  @override
  void onInit() {
    getAllPerosonalDetails();
    super.onInit();
  }
}
