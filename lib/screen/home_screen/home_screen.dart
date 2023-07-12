// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/demo.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/screen/home_screen/home_controller.dart';
import 'package:payment_app/settings/settings.dart';

class HomeScreen extends GetView<Homecontroller> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        toolbarHeight: 100.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Home",
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
        iconTheme: IconThemeData(color: kprimaryColor),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     child: IconButton(
        //       onPressed: () {
        //         // _signOut();
        //         Settings.setPanNo = "BNZAA6371I";
        //         Settings.setPassword = "Saliya.1234";
        //         debugPrint(
        //             "--------------------${Settings.panNo}    ${Settings.password}");
        //       },
        //       icon: const Icon(
        //         Icons.logout,
        //         color: Color(0xff2A4965),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            categoriesContainer("File your ITR", "assets/images/file itr.png",
                ontap: () {
              Get.toNamed(AppPages.fileItr);
            }),
            categoriesContainer(
                "HRA Calculator", "assets/images/calculator.png", ontap: () {
              Get.toNamed(AppPages.hracalc);
            }),
            categoriesContainer("Refund Status", "assets/images/refund.png",
                ontap: () {
              showToast("Refund Status");
            }),
            categoriesContainer("Text Expert", "assets/images/text.png",
                ontap: () {
              Get.to(() => const PrintedData());
              showToast("Text Expert");
            }),
          ],
        ),
      ),
      drawer: Drawer(
        child: DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => controller.userDetailsLoading.value
                    ? CircularProgressIndicator(
                        color: kprimaryLightColor,
                      )
                    : controller.hasData.isFalse
                        ? Container()
                        : SizedBox(
                            height: 110.h,
                            width: 110.w,
                            child: Image.asset(
                              'assets/images/login.png',
                              fit: BoxFit.cover,
                            ),
                          ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () => controller.userDetailsLoading.value
                    ? Container()
                    : controller.hasData.isFalse
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "${controller.userAllDetails.first.firstName!} ${controller.userAllDetails.first.lastName!}",
                              style: TextStyle(
                                  fontSize: 21.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
              ),
              Obx(
                () => controller.userDetailsLoading.value
                    ? Container()
                    : controller.hasData.isFalse
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              controller.userAllDetails.first.pancardNumber!,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFB4B4B4)),
                            ),
                          ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: TextButton(
                    onPressed: () {
                      _signOut();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(color: Colors.red, fontSize: 17.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoriesContainer(String title, String photo, {Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.sp),
            border: Border.all(width: 2, color: Colors.grey.shade200),
          ),
          height: 70.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Row(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: Image.asset(
                    photo,
                    color: const Color(0xff0D3355),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 20.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    // storage.write('login', false);
    Settings.setUserLogIn = false;
    Settings.setBankDetails = false;
    Get.offAllNamed(AppPages.signup);
    // await FirebaseAuth.instance
    //     .signOut()
    //     .then((value) => Get.offAllNamed(AppPages.signup));
  }
}
