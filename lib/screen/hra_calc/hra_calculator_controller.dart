import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HraCalculatorController extends GetxController {
  TextEditingController txtbs = TextEditingController();
  TextEditingController txtrent = TextEditingController();
  TextEditingController txthra = TextEditingController();
  TextEditingController txtda = TextEditingController();
  TextEditingController txtcummition = TextEditingController();

  var formKey = GlobalKey<FormState>();
  RxInt da = 0.obs;
  RxInt basicSalary = 0.obs;
  RxInt exmeptedhra = 0.obs;
  RxInt hraAmountone = 0.obs;
  RxInt actualrent = 0.obs;
  RxInt taxablehrs = 0.obs;
  RxInt newhra = 0.obs;
  RxInt cummition = 0.obs;
  RxInt empty = 0.obs;
  RxInt newhraamount = 0.obs;

  void calculateHra() {
    calc.value = true;
    newhraamount.value = hraAmountone.value;
    exmeptedhra.value = actualrent.value -
        (basicSalary.value * 10 ~/ 100) -
        (da.value * 10 ~/ 100) -
        (cummition.value * 10 ~/ 100);
    newhra.value = exmeptedhra.value;
    taxablehrs.value = hraAmountone.value - newhra.value;

    debugPrint("exemted hra ===> ${exmeptedhra.value}");
    debugPrint("taxable hra ===> ${taxablehrs.value}");
    update();
  }

  RxBool check = false.obs;
  RxBool ischeck = false.obs;
  RxBool calc = false.obs;

  void validate() {
    if (formKey.currentState!.validate()) {
      ischeck.value = true;
      update();
    } else {
      ischeck.value = false;
      update();
    }
  }
}
