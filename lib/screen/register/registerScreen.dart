// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/register/registerController.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String strDigits(int n) => n.toString().padLeft(2, '0');

    // var seconds = strDigits(controller.myDuration.inSeconds.remainder(60));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.h,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xff2A4965),
            ),
          ),
          title: Text(
            "Register",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 21.sp,
                color: const Color(0xff2A4965)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.sp),
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30.h),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter Mobile NO.",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA4A4A4))),
                  ),
                  TextFormField(
                    controller: controller.txtnum,
                    textInputAction: TextInputAction.next,
                    cursorColor: kprimaryLightColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      String val = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      debugPrint(val);
                      RegExp regExp = RegExp(val);
                      if (value!.isEmpty) {
                        debugPrint("not done");
                        return 'Please enter mobile number';
                      } else if (!regExp.hasMatch(value)) {
                        debugPrint("done");
                        return 'Please enter mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter Password",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA4A4A4))),
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.txtpass,
                      obscureText: controller.passObSecure.value,
                      textInputAction: TextInputAction.next,
                      cursorColor: kprimaryLightColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        if (!controller.validatePassword(value)) {
                          return '1 Upper case,1 lowercase\n1 Numeric Number,1 Special Character';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kprimaryLightColor, width: 2.0),
                        ),
                        suffixIcon: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.sp),
                          ),
                          onTap: () {
                            controller.passObSecure.value == false
                                ? controller.passObSecure.value = true
                                : controller.passObSecure.value = false;
                          },
                          child: Icon(
                            controller.passObSecure.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter Confirm Password",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA4A4A4))),
                  ),
                  Obx(
                    () => TextFormField(
                      controller: controller.txtConfirmPassword,
                      obscureText: controller.passObSecure.value,
                      textInputAction: TextInputAction.next,
                      cursorColor: kprimaryLightColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Confirm Enter Password';
                        }
                        if (!controller.validateConfirmPassword(value)) {
                          return 'both password is not same';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kprimaryLightColor, width: 2.0),
                        ),
                        suffixIcon: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.sp),
                          ),
                          onTap: () {
                            controller.passObSecure.value == false
                                ? controller.passObSecure.value = true
                                : controller.passObSecure.value = false;
                          },
                          child: Icon(
                            controller.passObSecure.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  MaterialButton(
                    onPressed: () {

                      controller.validate(
                          controller.txtnum.text, controller.txtConfirmPassword.text);
                    },
                    minWidth: 140.w,
                    height: 50.h,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    color: const Color(0xff2A4965),
                    child: Obx(
                      () => controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Verify",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.sp, color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
