import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:huawei_ml_text/huawei_ml_text.dart';
import 'package:payment_app/settings/settings.dart';

class PickDocumentController extends GetxController {
  RxString panCardNo = "".obs;
  RxString tanOfDeductor = "".obs;

  RxBool allLoading = false.obs;

  RxList texts = [].obs;

  RxList q1 = [].obs;
  RxList q2 = [].obs;
  RxList q3 = [].obs;
  RxList q4 = [].obs;
  RxList total = [].obs;

  RxList grossAmountSection80 = [].obs;
  RxList deductAmountSection80 = [].obs;

  //DETAILS OF TAX DEDUCTED AND DEPOSITED IN THE CENTRAL GOVERNMENT ACCOUNT THROUGH CHALLAN
  RxList one = [].obs;
  RxList two = [].obs;
  RxList three = [].obs;
  RxList four = [].obs;
  RxList five = [].obs;
  RxList six = [].obs;
  RxList seven = [].obs;
  RxList eight = [].obs;
  RxList nine = [].obs;
  RxList ten = [].obs;
  RxList eleven = [].obs;
  RxList twelve = [].obs;
  RxString totalTds = "".obs;

  RxList section80G = [].obs;
  RxList section80TTA = [].obs;
  RxList deductibleUnderAnyOtherProvisions = [].obs;

  RxString bookExcemtion = "".obs;
  RxString foodExcemtion = "".obs;
  RxString gadgetExcemtion = "".obs;
  RxString giftExcemtion = "".obs;
  RxString internetExcemtion = "".obs;
  RxString professionExcemption = "".obs;
  RxString refurbishExcemption = "".obs;
  RxString telephoneExcemption = "".obs;

  RxString grossSalary = "".obs;
  RxString salaryAsPerProvisions = "".obs;
  RxString profitsInLieuOfSalary = "".obs;
  RxString valueOfPerquisites = "".obs;
  RxString travelAllowance = "".obs;
  RxString houseRent = "".obs;
  RxString pension = "".obs;
  RxString deathCum = "".obs;
  RxString leaveSalary = "".obs;
  RxString totalUnderSection10 = "".obs;
  RxString exemptionClaimedUnderSection10 = "".obs;
  RxString currentEmployer = "".obs;
  RxString standardDeduction = "".obs;
  RxString entertainmentAllowance = "".obs;
  RxString taxOnEmployment = "".obs;
  RxString totalAmountOfDeductions = "".obs;
  RxString incomeChargeable = "".obs;
  RxString employeeOfferedForTDS = "".obs;
  RxString sourceOfferedForTDS = "".obs;
  RxString incomeReportedByEmployee = "".obs;
  RxString grossTotalIncome = "".obs;
  RxString deductibleAmountUnderChapterVIA = "".obs;
  RxString totalTaxableIncome = "".obs;
  RxString taxOnTotalIncome = "".obs;
  RxString section87A = "".obs;
  RxString surchargeWhereverApplicable = "".obs;
  RxString healthAndEducationCess = "".obs;
  RxString taxPayable = "".obs;
  RxString section89 = "".obs;
  RxString netTaxPayable = "".obs;

  bool validateTAN(String pan) {
    RegExp regExp = RegExp('^[A-Z]{4}[0-9]{5}[A-Z]{1}\$');
    if (regExp.hasMatch(pan)) {
      return true;
    } else {
      return false;
    }
  }

  late MLFormRecognitionAnalyzer analyzer;

  RxList images = [].obs;

  String? galleryImage;
  ImagePicker picker = ImagePicker();

  Future<String?> getImage(ImageSource source) async {
    final XFile? image = await ImagePicker().pickImage(
      source: source,
    );
    return image?.path;
    // galleryImage = image?.path;
  }

  void analyze(String? path) async {
    texts.clear();

    if (path == null || path.isEmpty) {
      return;
    }
    try {
      final MLFormRecognitionTablesAttribute res =
          await analyzer.asyncAnalyseFrame(path);
      final TablesContent? tablesContent = res.tablesContent;
      if (tablesContent != null) {
        for (TableAttribute? e1 in tablesContent.tableAttributes) {
          if (e1 != null) {
            for (TableCellAttribute? e2 in e1.tableCellAttributes) {
              texts.add(e2?.textInfo);
              debugPrint("---------$texts");
            }
          }
        }
      }
    } on Exception catch (e) {
      log("$e");
    }
  }

  getData() async {
    galleryImage = await getImage(
      ImageSource.gallery,
    );

    if (galleryImage != null) {
      images.add(galleryImage);
      allLoading.value = true;
      analyze(galleryImage);
    } else {}
  }

  @override
  void onInit() {
    analyzer = MLFormRecognitionAnalyzer();
    getData();
    panCardNo.value = Settings.panNo;
    super.onInit();
  }

  @override
  void onReady() async {
    // update();
    super.onReady();
  }

  @override
  void onClose() {
    images.clear();
    allLoading.value = false;

    texts.clear();
    q1.clear();
    q2.clear();
    q3.clear();
    q4.clear();
    total.clear();

    one.clear();
    two.clear();
    three.clear();
    four.clear();
    five.clear();
    six.clear();
    seven.clear();
    eight.clear();
    nine.clear();
    ten.clear();
    eleven.clear();
    twelve.clear();

    grossAmountSection80.clear();
    deductAmountSection80.clear();

    section80G.clear();
    section80TTA.clear();
    deductibleUnderAnyOtherProvisions.clear();

    bookExcemtion.value = "";
    foodExcemtion.value = "";
    gadgetExcemtion.value = "";
    giftExcemtion.value = "";
    internetExcemtion.value = "";
    professionExcemption.value = "";
    refurbishExcemption.value = "";
    telephoneExcemption.value = "";

    houseRent.value = "";
    profitsInLieuOfSalary.value = "";
    salaryAsPerProvisions.value = "";
    valueOfPerquisites.value = "";
    travelAllowance.value = "";
    grossSalary.value = "";
    deathCum.value = "";
    pension.value = "";
    leaveSalary.value = "";
    totalUnderSection10.value = "";
    exemptionClaimedUnderSection10.value = "";
    currentEmployer.value = "";
    standardDeduction.value = "";
    entertainmentAllowance.value = "";
    taxOnEmployment.value = "";
    totalAmountOfDeductions.value = "";
    incomeChargeable.value = "";
    employeeOfferedForTDS.value = "";
    sourceOfferedForTDS.value = "";
    incomeReportedByEmployee.value = "";
    grossTotalIncome.value = "";
    deductibleAmountUnderChapterVIA.value = "";
    totalTaxableIncome.value = "";
    taxOnTotalIncome.value = "";
    section87A.value = "";
    surchargeWhereverApplicable.value = "";
    healthAndEducationCess.value = "";
    taxPayable.value = "";
    section89.value = "";
    netTaxPayable.value = "";

    super.onClose();
  }
}
