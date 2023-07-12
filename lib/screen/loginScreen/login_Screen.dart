// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/loginScreen/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
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
                Padding(
                  padding: EdgeInsets.only(top: 380.h),
                  child: Column(
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
                              borderSide: BorderSide(
                                  color: kprimaryLightColor, width: 2.0),
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
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: TextFormField(
                          controller: controller.txtpass,
                          textInputAction: TextInputAction.next,
                          obscureText: controller.passObSecure.value,
                          cursorColor: kprimaryLightColor,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500),
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
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kprimaryLightColor, width: 2.0),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.sp))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            }
                            if (!controller.validatePassword(value)) {
                              return '1 Upper case,1 lowercase\n1 Numeric Number,1 Special Character';
                            }

                            return null;
                          },
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 30, right: 30),
                      //   child: Text(
                      //     "Forget Password?",
                      //     style: GoogleFonts.poppins(),
                      //   ),
                      // ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Center(
                        child: MaterialButton(
                          onPressed: () {
                            // callLoginApi();
                            controller.validate(controller.txtpan.text,
                                controller.txtpass.text);
                            // // if (apiController.status == true) {
                            //   apiController.getapi(txtPan.text);
                            // } else {
                            //   print(
                            //       "+++============================invalid pan no.");
                            // }

                            // if (controller.isValid.value == true) {
                            //   Get.offAllNamed(AppPages.home);
                            //   userPanCardNo = controller.txtpan.text;
                            //   controller.isValid.value = false;
                            // }
                          },
                          minWidth: 140.w,
                          height: 50.h,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.sp),
                          ),
                          color: const Color(0xff45BA1C),
                          child: controller.isLoading.value
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
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
