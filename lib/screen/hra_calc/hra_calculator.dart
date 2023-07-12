// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/hra_calc/hra_calculator_controller.dart';

class HraCalculator extends GetView<HraCalculatorController> {
  const HraCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("HRA Calculation", onBackTap: () {
        Get.back();
      }),
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Basic Salary Per Year",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA4A4A4),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.txtbs,
                    cursorColor: const Color(0xff0C2944),
                    onChanged: (value) {
                      controller.basicSalary.value = int.parse(value);
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // hintText: 'Basic Salary Per Year',
                      suffixText: "INR",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Basic Salary Per Year*';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "DA forming part of salary Per Year",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA4A4A4),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.txtda,
                    cursorColor: const Color(0xff0C2944),
                    onChanged: (value) {
                      controller.da.value = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // hintText: 'DA forming part of salary Per Year',
                      suffixText: "INR",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Commission \n(as of turnover achieved by the employee)",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA4A4A4),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.txtcummition,
                    cursorColor: const Color(0xff0C2944),
                    onChanged: (value) {
                      controller.cummition.value = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // hintText:
                      //     'Commission (as of turnover achieved by the employee)',
                      suffixText: "INR",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "HRA Received Per Year",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA4A4A4),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.txthra,
                    cursorColor: const Color(0xff0C2944),
                    onChanged: (value) {
                      controller.hraAmountone.value = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // hintText: 'HRA Received Per Year',
                      suffixText: "INR",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter HRA Received Per Year*';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rent Paid Per Year",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA4A4A4),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.txtrent,
                    cursorColor: const Color(0xff0C2944),
                    onChanged: (value) {
                      controller.actualrent.value = int.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      // hintText: 'Rent Paid Per Year',
                      suffixText: "INR",
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Rent Paid Per Year*';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tick if residing in metro city",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffA4A4A4),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.check.value = !controller.check.value;
                    },
                    child: Container(
                      height: 68.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: controller.check.value == true ? 2 : 1,
                            color: controller.check.value == true
                                ? kprimaryLightColor
                                : const Color(0xffA4A4A4),
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(5.sp))),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Row(
                            children: [
                              Text(
                                "(Tick if Yes)",
                                style: TextStyle(
                                    color: controller.check.value == true
                                        ? const Color(0xff0C2944)
                                        : const Color(0xffA4A4A4),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  controller.check.value =
                                      !controller.check.value;
                                },
                                icon: Icon(
                                  controller.check.value == true
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: controller.check.value == true
                                      ? const Color(0xff2A4965)
                                      : const Color(0xffA4A4A4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      Text(
                        'Exempted HRA:',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: Colors.black),
                      ),
                      const Spacer(),
                      if (controller.calc.value == true)
                        controller.taxablehrs.value <= 0
                            ? Text(
                                '${controller.exmeptedhra.value >= 0 ? currencyFormat(controller.newhraamount.value) : currencyFormat(controller.empty.value)}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: const Color(0xff45BA1C),
                                ),
                              )
                            : Text(
                                '${controller.exmeptedhra.value >= 0 ? currencyFormat(controller.exmeptedhra.value) : currencyFormat(controller.empty.value)}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: const Color(0xff45BA1C),
                                ),
                              ),
                      if (controller.calc.value == false)
                        Text(
                          '${currencyFormat(controller.empty.value)}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: const Color(0xff45BA1C),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Taxable HRA:',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: Colors.black),
                      ),
                      const Spacer(),
                      if (controller.calc.value == true)
                        controller.exmeptedhra.value <= 0
                            ? Text(
                                '${controller.taxablehrs.value >= 0 ? currencyFormat(controller.newhraamount.value) : currencyFormat(controller.empty.value)}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: const Color(0xff45BA1C),
                                ),
                              )
                            : Text(
                                '${controller.taxablehrs.value >= 0 ? currencyFormat(controller.taxablehrs.value) : currencyFormat(controller.empty.value)}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: const Color(0xff45BA1C),
                                ),
                              ),
                      if (controller.calc.value == false)
                        Text(
                          '${currencyFormat(controller.empty.value)}',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: const Color(0xff45BA1C),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          controller.calc.value = false;
                          controller.exmeptedhra.value = 0;
                          controller.taxablehrs.value = 0;
                          controller.newhraamount.value = 0;
                          controller.txtbs.clear();
                          controller.txtrent.clear();
                          controller.txthra.clear();
                          controller.txtda.clear();
                          controller.txtcummition.clear();
                          controller.check.value = false;
                        },
                        minWidth: 140.w,
                        height: 50.h,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.sp),
                        ),
                        color: Colors.blueGrey.shade200,
                        child: Text(
                          "Clear",
                          style: GoogleFonts.poppins(fontSize: 18.sp),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          controller.validate();
                          if (controller.ischeck.value == true) {
                            controller.calculateHra();
                          }
                        },
                        minWidth: 140.w,
                        height: 50.h,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.sp),
                        ),
                        color: const Color(0xff45BA1C),
                        child: Text(
                          "Calculate",
                          style: GoogleFonts.poppins(fontSize: 18.sp),
                        ),
                      ),
                    ],
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
// Container(
                //   height: 100.h,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.only(
                //       bottomLeft: Radius.circular(30.sp),
                //       bottomRight: Radius.circular(30.sp),
                //     ),
                //   ),
                //   alignment: Alignment.center,
                //   child: Row(
                //     children: [
                //       IconButton(
                //           onPressed: () {
                //             Get.back();
                //           },
                //           icon: const Icon(
                //             Icons.arrow_back_ios_new,
                //             color: Color(0xff2A4965),
                //           )),
                //       SizedBox(
                //         width: 55.w,
                //       ),
                //       Text(
                //         "HRA Calculation",
                //         style: GoogleFonts.poppins(
                //             fontWeight: FontWeight.w600,
                //             fontSize: 21.sp,
                //             color: const Color(0xff2A4965)),
                //       )
                //     ],
                //   ),
                // ),