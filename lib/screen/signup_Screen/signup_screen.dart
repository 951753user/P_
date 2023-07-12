// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/screen/signup_Screen/signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140.h,
                        width: 140.w,
                        child: Image.asset(
                          'assets/images/login.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Welcome",
                        style: GoogleFonts.poppins(
                            fontSize: 30.sp,
                            color: const Color(0xff2A4965),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: TextFormField(
                      controller: controller.txtpan,
                      textInputAction: TextInputAction.next,
                      cursorColor: kprimaryLightColor,
                      decoration: InputDecoration(
                        hintText: 'Pancard Number',
                        hintStyle: GoogleFonts.poppins(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.w500),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kprimaryLightColor, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.sp)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a PAN card number\nEx. XXXXX1234X';
                        }
                        if (!controller.validatePAN(value)) {
                          return 'Please enter a valid PAN card number\nEx. XXXXX1234X';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Get.toNamed(AppPages.login);
                          },
                          minWidth: 140.w,
                          height: 50.h,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.sp),
                          ),
                          color: Colors.blueGrey.shade500,
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // MaterialButton(
                        //   onPressed: () {
                        //     signInWithGoogle().then((value) {
                        //       if (FirebaseAuth.instance.currentUser != null) {
                        //         Get.toNamed(AppPages.login);
                        //       }
                        //     });
                        //   },
                        //   minWidth: 140.w,
                        //   height: 50.h,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(14.0),
                        //   ),
                        //   color: Colors.blueGrey.shade500,
                        //   child: Text(
                        //     "Login",
                        //     style: GoogleFonts.poppins(
                        //         fontSize: 18.sp,
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        MaterialButton(
                          onPressed: () {
                            // callLoginApi();
                            controller.validate(controller.txtpan.text);
                            //
                            // // if (apiController.status == true) {
                            //   apiController.getapi(txtPan.text);
                            // } else {
                            //   debugPrint(
                            //       "+++============================invalid pan no.");
                            // }

                            // controller.getPanDetails(controller.txtpan.text);

                            // if (controller.isValid.value == true) {
                            // Get.toNamed(AppPages.pandetail);
                            //   controller.isValid.value = false;
                            // }
                          },
                          minWidth: 140.w,
                          height: 50.h,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.sp),
                          ),
                          color: const Color(0xff45BA1C),
                          child: Obx(
                            () => controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Continue",
                                    style: GoogleFonts.poppins(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
