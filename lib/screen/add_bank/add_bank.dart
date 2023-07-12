import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/add_bank/add_bank_controller.dart';

class AddBankScreen extends GetView<AddBankController> {
  const AddBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("Add Bank",onBackTap: (){
        Get.back();
      }),
      body: Obx(
        () => Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.sp)),
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
                      String val = '^[0-9]{9,18}\$';
                      debugPrint(val);
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
                    padding: EdgeInsets.only(left: 15, right: 5, top: 5.h),
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
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
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
                  SizedBox(
                    height: 20.h,
                  ),
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
                            "Add",
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
