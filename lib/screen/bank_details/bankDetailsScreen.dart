// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/screen/bank_details/bankDetailsController.dart';

class BankDetailsScreen extends GetView<BankDetailsController> {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("Bank Details", onBackTap: () {
        Get.back();
      }),
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  if (controller.allDataLoading.value == true)
                    Center(
                      child: CircularProgressIndicator(
                        color: kprimaryColor,
                      ),
                    )
                  else if (controller.allBankDetails.isNotEmpty)
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.allBankDetails.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // height: 100.h,
                            margin: EdgeInsets.symmetric(vertical: 15.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 5.0,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            width: double.infinity,
                            padding: const EdgeInsets.all(15),
                            // alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text("PAN No.  :  ",
                                    "${controller.allBankDetails[index].pancardNumber}"),
                                text("Bank Name  :  ",
                                    "${controller.allBankDetails[index].bankName}"),
                                text("Address  :  ",
                                    "${controller.allBankDetails[index].address}"),
                                text("A/C No.  :  ",
                                    "${controller.allBankDetails[index].acNumber}"),
                                text("A/C Type  :  ",
                                    "${controller.allBankDetails[index].acType}"),
                                text("IFSC No.  :  ",
                                    "${controller.allBankDetails[index].ifscNumber}"),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  else
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Bank Name",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA4A4A4))),
                        ),
                        TextFormField(
                          controller: controller.txtBankName,
                          textInputAction: TextInputAction.next,
                          cursorColor: kprimaryLightColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.sp)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kprimaryLightColor, width: 2.0),
                            ),
                            // hintText: 'Bank Name',
                            // hintStyle: GoogleFonts.poppins(
                            //     fontWeight: FontWeight.w400,
                            //     color: const Color(0xffA4A4A4))
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Bank Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Address",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA4A4A4))),
                        ),
                        TextFormField(
                          controller: controller.txtAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: kprimaryLightColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.sp)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kprimaryLightColor, width: 2.0),
                            ),
                            // hintText: 'Address',
                            // hintStyle: GoogleFonts.poppins(
                            //     fontWeight: FontWeight.w400,
                            //     color: const Color(0xffA4A4A4))
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("A/C No.",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA4A4A4))),
                        ),
                        TextFormField(
                          controller: controller.txtACNo,
                          textInputAction: TextInputAction.next,
                          cursorColor: kprimaryLightColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.sp)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kprimaryLightColor, width: 2.0),
                            ),
                            // hintText: 'A/C No.',
                            // hintStyle: GoogleFonts.poppins(
                            //     fontWeight: FontWeight.w400,
                            //     color: const Color(0xffA4A4A4))
                          ),
                          validator: (value) {
                            String val = '^[0-9]{9,18}\$';
                            RegExp regExp = RegExp(val);
                            if (value!.isEmpty) {
                              debugPrint("not done");
                              return 'Please Enter Bank Account Number';
                            } else if (!regExp.hasMatch(value)) {
                              debugPrint("done");
                              return 'Please Enter Valid Bank Account Number\nEx. 0123456789';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("A/C Type",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA4A4A4))),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 15, right: 5, top: 5.h),
                          height: 65.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xffA4A4A4)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.sp))),
                          child: DropdownButton(
                            hint: Text(
                              "Select A/C Type",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA4A4A4),
                                  fontSize: 15.sp),
                            ),

                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 36.sp,
                            isExpanded: true,
                            underline: const SizedBox(),
                            value: controller.dropdownvalue.value,

                            // Array list of items
                            items: controller.items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              (value) {
                                if (value == null) {
                                  return 'Relationship is required';
                                }
                              };

                              controller.dropdownvalue.value = newValue!;
                            },
                          ),
                        ),
                        // TextFormField(
                        //   controller: txtACType,
                        //   textInputAction: TextInputAction.next,
                        //   decoration: InputDecoration(
                        //       border:  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                        //       // hintText: 'A/C Type',
                        //       // hintStyle: GoogleFonts.poppins(
                        //       //     fontWeight: FontWeight.w400,
                        //       //     color: const Color(0xffA4A4A4))
                        //   ),
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Required';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("IFSC",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffA4A4A4))),
                        ),
                        TextFormField(
                          controller: controller.txtIFSC,
                          textInputAction: TextInputAction.next,
                          cursorColor: kprimaryLightColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.sp)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kprimaryLightColor, width: 2.0),
                            ),
                            // hintText: 'IFSC',
                            // hintStyle: GoogleFonts.poppins(
                            //     fontWeight: FontWeight.w400,
                            //     color: const Color(0xffA4A4A4))
                          ),
                          validator: (value) {
                            String val = '^[A-Z]{4}0[A-Z0-9]{6}\$';
                            RegExp regExp = RegExp(val);
                            if (value!.isEmpty) {
                              return 'Please Enter IFSC Code';
                            } else if (!regExp.hasMatch(value)) {
                              return 'Please Enter Valid IFSC Code \nEx. XXXX0123456';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 20.h,
                  ),

                  if (controller.allDataLoading.value == true)
                    Container()
                  else if (controller.allBankDetails.isEmpty)
                    MaterialButton(
                      onPressed: () {
                        controller.validate(
                            controller.txtBankName.text,
                            controller.txtAddress.text,
                            controller.txtACNo.text,
                            controller.dropdownvalue.value,
                            controller.txtIFSC.text);
                        // Get.toNamed(AppPages.payment);
                      },
                      minWidth: 140.w,
                      height: 50.h,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.sp),
                      ),
                      color: const Color(0xff2A4965),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Submit",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.sp, color: Colors.white),
                            ),
                    )
                  else
                    MaterialButton(
                      onPressed: () {
                        // _validate();

                        Get.toNamed(AppPages.addbank);
                      },
                      minWidth: 140.w,
                      height: 50.h,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.sp),
                      ),
                      color: const Color(0xff2A4965),
                      child: Text(
                        "Add Bank",
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp, color: Colors.white),
                      ),
                    ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [

                  //   ],
                  // ),
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

  Widget text(String title, String details) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          details,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

















/*

// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/screen/bank_details/bankDetailsController.dart';

class BankDetailsScreen extends GetView<BankDetailsController> {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "Bank Details",
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
        body: Obx(
          () => Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),

                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.allBankDetails.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              height: 100.h,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                      "${controller.allBankDetails[index].acNumber}")
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("Bank Name",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xffA4A4A4))),
                    // ),
                    // TextFormField(
                    //   controller: controller.txtBankName,
                    //   textInputAction: TextInputAction.next,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(6.sp)),
                    //     // hintText: 'Bank Name',
                    //     // hintStyle: GoogleFonts.poppins(
                    //     //     fontWeight: FontWeight.w400,
                    //     //     color: const Color(0xffA4A4A4))
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please Enter Bank Name';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("Address",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xffA4A4A4))),
                    // ),
                    // TextFormField(
                    //   controller: controller.txtAddress,
                    //   textInputAction: TextInputAction.next,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(6.sp)),
                    //     // hintText: 'Address',
                    //     // hintStyle: GoogleFonts.poppins(
                    //     //     fontWeight: FontWeight.w400,
                    //     //     color: const Color(0xffA4A4A4))
                    //   ),
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Please Enter Address';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("A/C No.",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xffA4A4A4))),
                    // ),
                    // TextFormField(
                    //   controller: controller.txtACNo,
                    //   textInputAction: TextInputAction.next,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(6.sp)),
                    //     // hintText: 'A/C No.',
                    //     // hintStyle: GoogleFonts.poppins(
                    //     //     fontWeight: FontWeight.w400,
                    //     //     color: const Color(0xffA4A4A4))
                    //   ),
                    //   validator: (value) {
                    //     String val = '^[0-9]{9,18}\$';
                    //     debugPrint(val);
                    //     RegExp regExp = RegExp(val);
                    //     if (value!.isEmpty) {
                    //       debugPrint("not done");
                    //       return 'Please Enter Bank Account Number';
                    //     } else if (!regExp.hasMatch(value)) {
                    //       debugPrint("done");
                    //       return 'Please Enter Valid Bank Account Number\nEx. 0123456789';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("A/C Type",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xffA4A4A4))),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 15, right: 5, top: 5.h),
                    //   height: 65.h,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           width: 1, color: const Color(0xffA4A4A4)),
                    //       borderRadius:
                    //           BorderRadius.all(Radius.circular(6.sp))),
                    //   child: DropdownButton(
                    //     hint: Text(
                    //       "Select A/C Type",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xffA4A4A4),
                    //           fontSize: 15.sp),
                    //     ),

                    //     icon: const Icon(Icons.arrow_drop_down),
                    //     iconSize: 36.sp,
                    //     isExpanded: true,
                    //     underline: const SizedBox(),
                    //     value: controller.dropdownvalue.value,

                    //     // Array list of items
                    //     items: controller.items.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     onChanged: (String? newValue) {
                    //       (value) {
                    //         if (value == null) {
                    //           return 'Relationship is required';
                    //         }
                    //       };

                    //       controller.dropdownvalue.value = newValue!;
                    //     },
                    //   ),
                    // ),
                    // // TextFormField(
                    // //   controller: txtACType,
                    // //   textInputAction: TextInputAction.next,
                    // //   decoration: InputDecoration(
                    // //       border:  OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                    // //       // hintText: 'A/C Type',
                    // //       // hintStyle: GoogleFonts.poppins(
                    // //       //     fontWeight: FontWeight.w400,
                    // //       //     color: const Color(0xffA4A4A4))
                    // //   ),
                    // //   validator: (value) {
                    // //     if (value!.isEmpty) {
                    // //       return 'Required';
                    // //     }
                    // //     return null;
                    // //   },
                    // // ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text("IFSC",
                    //       style: GoogleFonts.poppins(
                    //           fontWeight: FontWeight.w400,
                    //           color: const Color(0xffA4A4A4))),
                    // ),
                    // TextFormField(
                    //   controller: controller.txtIFSC,
                    //   textInputAction: TextInputAction.next,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(6.sp)),
                    //     // hintText: 'IFSC',
                    //     // hintStyle: GoogleFonts.poppins(
                    //     //     fontWeight: FontWeight.w400,
                    //     //     color: const Color(0xffA4A4A4))
                    //   ),
                    //   validator: (value) {
                    //     String val = '^[A-Z]{4}0[A-Z0-9]{6}\$';
                    //     RegExp regExp = RegExp(val);
                    //     if (value!.isEmpty) {
                    //       return 'Please Enter IFSC Code';
                    //     } else if (!regExp.hasMatch(value)) {
                    //       return 'Please Enter Valid IFSC Code \nEx. XXXX0123456';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            controller.validate(
                                controller.txtBankName.text,
                                controller.txtAddress.text,
                                controller.txtACNo.text,
                                controller.dropdownvalue.value,
                                controller.txtIFSC.text);
                          },
                          minWidth: 140.w,
                          height: 50.h,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.sp),
                          ),
                          color: const Color(0xff2A4965),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Submit",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            // _validate();

                            Get.toNamed(AppPages.addbank);
                          },
                          minWidth: 140.w,
                          height: 50.h,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.sp),
                          ),
                          color: const Color(0xff2A4965),
                          child: Text(
                            "Add Bank",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp, color: Colors.white),
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
      ),
    );
  }
}



 */
