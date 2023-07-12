// ignore_for_file: camel_case_types, file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/pandetail/panDetailsController.dart';

class PanDetailsScreen extends GetView<PanDetailsController> {
  const PanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("PAN CARD Details", onBackTap: () {
        Get.back();
      }),
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("First Name as Per Pan Card",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA4A4A4))),
                  ),
                  TextFormField(
                    controller: controller.txtfirst,
                    textInputAction: TextInputAction.next,
                    cursorColor: kprimaryLightColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                      // hintText: 'Bank Name',
                      // hintStyle: GoogleFonts.poppins(
                      //     fontWeight: FontWeight.w400,
                      //     color: const Color(0xffA4A4A4))
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter First Name as Per Pan Card';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Middle Name as Per pan",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA4A4A4))),
                  ),
                  TextFormField(
                    controller: controller.txtmiddle,
                    textInputAction: TextInputAction.next,
                    cursorColor: kprimaryLightColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                      // hintText: 'Address',
                      // hintStyle: GoogleFonts.poppins(
                      //     fontWeight: FontWeight.w400,
                      //     color: const Color(0xffA4A4A4))
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Middle Name as Per Pan Card';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Last Name as Per pan",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA4A4A4))),
                  ),
                  TextFormField(
                    controller: controller.txtlast,
                    textInputAction: TextInputAction.next,
                    cursorColor: kprimaryLightColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                      // hintText: 'A/C No.',
                      // hintStyle: GoogleFonts.poppins(
                      //     fontWeight: FontWeight.w400,
                      //     color: const Color(0xffA4A4A4))
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Last Name as Per Pan Card';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Gender",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA4A4A4))),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 65.h,
                          // width: 103.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: controller.gender.value == "male"
                                      ? 2
                                      : 1,
                                  color: controller.gender.value == "male"
                                      ? kprimaryColor
                                      : const Color(0xffA4A4A4)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: RadioListTile(
                            title: Text(
                              "Male",
                              style: TextStyle(
                                  color: controller.gender.value == "male"
                                      ? kprimaryColor
                                      : const Color(0xffA4A4A4),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            activeColor: const Color(0xff2A4965),
                            value: "male",
                            groupValue: controller.gender.value,
                            onChanged: (value) {
                              controller.gender.value = value.toString();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 65.h,
                          // width: 103.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: controller.gender.value == "female"
                                    ? 2
                                    : 1,
                                color: controller.gender.value == "female"
                                    ? kprimaryColor
                                    : const Color(0xffA4A4A4),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: RadioListTile(
                            title: Text(
                              "Female",
                              style: TextStyle(
                                  color: controller.gender.value == "female"
                                      ? kprimaryColor
                                      : const Color(0xffA4A4A4),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            activeColor: const Color(0xff2A4965),
                            value: "female",
                            groupValue: controller.gender.value,
                            onChanged: (value) {
                              controller.gender.value = value.toString();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller.validate(
                          controller.txtfirst.text,
                          controller.txtmiddle.text,
                          controller.txtlast.text,
                          controller.gender.value);

                      // Get.toNamed(AppPages.otp);

                      var chech = controller.gender.value;
                      if (kDebugMode) {
                        debugPrint("==================$chech");
                      }
                      if (controller.isValid.value == true) {}
                    },
                    minWidth: 140.w,
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    color: const Color(0xff2A4965),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Continue",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, color: Colors.white),
                          ),
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
