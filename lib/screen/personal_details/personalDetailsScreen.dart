// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/personal_details/personalDetailsController.dart';
import 'package:payment_app/screen/personal_details/widget/edit_personal_details.dart';

class PersonalDetailsScreen extends GetView<PersonalDetailsController> {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("Personal Details", onBackTap: () {
        Get.back();
      }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Obx(
          () => controller.personalDetailsLoading.value
              ? Center(
                  child: CircularProgressIndicator(color: kprimaryLightColor),
                )
              : controller.personalDetails.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.personalDetails.length,
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
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text("PAN No.  :  ",
                                      "${controller.personalDetails[index].pancardNumber}"),
                                  text("DOB  :  ",
                                      "${controller.personalDetails[index].dataOfBirth}"),
                                  text("Address  :  ",
                                      "${controller.personalDetails[index].address}"),
                                  text("Father Name  :  ",
                                      "${controller.personalDetails[index].fatherName}"),
                                  text("Residential Status  :  ",
                                      "${controller.personalDetails[index].martial}"),
                                  text("Gender  :  ",
                                      "${controller.personalDetails[index].gender}"),
                                  text("Aadhaar No.  :  ",
                                      "${controller.personalDetails[index].aadhaarNumber}"),
                                  text("Residential Status  :  ",
                                      "${controller.personalDetails[index].residential}"),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    //update names
                                    Get.to(() => EditPersonalDetails(
                                          dob: controller.personalDetails[index]
                                              .dataOfBirth!,
                                          address: controller
                                              .personalDetails[index].address!,
                                          fatherName: controller
                                              .personalDetails[index]
                                              .fatherName!,
                                          maritialStatus: controller
                                              .personalDetails[index].martial!,
                                          gender: controller
                                              .personalDetails[index].gender!,
                                          aadhaarNo: controller
                                              .personalDetails[index]
                                              .aadhaarNumber!,
                                          residentialStatus: controller
                                              .personalDetails[index]
                                              .residential!,
                                        ));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: kprimaryLightColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Form(
                      key: controller.formKey,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Pan No.",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffA4A4A4))),
                            ),
                            TextFormField(
                              controller: controller.txtPanNo,
                              textInputAction: TextInputAction.next,
                              cursorColor: kprimaryLightColor,
                              onChanged: (value) {
                                // paymentController.panno.value = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6.sp),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kprimaryLightColor, width: 2.0),
                                ),
                                // hintText: "Pan No.",
                                // hintStyle: GoogleFonts.poppins(
                                //     fontWeight: FontWeight.w400,
                                //     color: const Color(0xffA4A4A4)),
                              ),
                              validator: (value) {
                                String val = '^[A-Z]{5}[0-9]{4}[A-Z]{1}\$';
                                RegExp regExp = RegExp(val);
                                if (value!.isEmpty) {
                                  return 'Please Enter Pan Card NO.';
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please Enter Pan Card NO. \nEx.XXXXX1234X';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Date of Birth",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffA4A4A4))),
                            ),
                            TextFormField(
                              controller: controller.txtDOB,
                              textInputAction: TextInputAction.next,
                              cursorColor: kprimaryLightColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kprimaryLightColor, width: 2.0),
                                ),
                                // hintText: 'Date Of Birth',
                                // hintStyle: GoogleFonts.poppins(
                                //     fontWeight: FontWeight.w400,
                                //     color: const Color(0xffA4A4A4))
                              ),
                              onTap: () {
                                controller.getDateOfBirth(context);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter DOB';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Father Name",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffA4A4A4))),
                            ),
                            TextFormField(
                              controller: controller.txtFatherName,
                              textInputAction: TextInputAction.next,
                              cursorColor: kprimaryLightColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kprimaryLightColor, width: 2.0),
                                ),
                                // hintText: 'Father Name',
                                // hintStyle: GoogleFonts.poppins(
                                //     fontWeight: FontWeight.w400,
                                //     color: const Color(0xffA4A4A4))
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Father Name';
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
                                            width: controller.gender.value ==
                                                    "male"
                                                ? 2
                                                : 1,
                                            color: controller.gender.value ==
                                                    "male"
                                                ? kprimaryColor
                                                : const Color(0xffA4A4A4)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.sp))),
                                    child: RadioListTile(
                                      title: Text(
                                        "Male",
                                        style: TextStyle(
                                            color: controller.gender.value ==
                                                    "male"
                                                ? kprimaryColor
                                                : const Color(0xffA4A4A4),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      activeColor: const Color(0xff2A4965),
                                      value: "male",
                                      groupValue: controller.gender.value,
                                      onChanged: (value) {
                                        controller.gender.value =
                                            value.toString();
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 65.h,
                                    // width: 103.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: controller.gender.value ==
                                                    "female"
                                                ? 2
                                                : 1,
                                            color: controller.gender.value ==
                                                    "female"
                                                ? kprimaryColor
                                                : const Color(0xffA4A4A4)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.sp))),
                                    child: RadioListTile(
                                      title: Text(
                                        "Female",
                                        style: TextStyle(
                                            color: controller.gender.value ==
                                                    "female"
                                                ? kprimaryColor
                                                : const Color(0xffA4A4A4),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      activeColor: const Color(0xff2A4965),
                                      value: "female",
                                      groupValue: controller.gender.value,
                                      onChanged: (value) {
                                        controller.gender.value =
                                            value.toString();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Martial Status",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffA4A4A4))),
                            ),
                            TextFormField(
                              controller: controller.txtMaritialStatus,
                              textInputAction: TextInputAction.next,
                              cursorColor: kprimaryLightColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kprimaryLightColor, width: 2.0),
                                ),
                                // hintText: 'Martial Status',
                                // hintStyle: GoogleFonts.poppins(
                                //     fontWeight: FontWeight.w400,
                                //     color: const Color(0xffA4A4A4))
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Martial Status';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Aadhaar No.",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffA4A4A4))),
                            ),
                            TextFormField(
                              controller: controller.txtAadhaarNo,
                              textInputAction: TextInputAction.next,
                              // keyboardType: TextInputType.number,
                              cursorColor: kprimaryLightColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kprimaryLightColor, width: 2.0),
                                ),
                                // hintText: 'Aadhaar No.',
                                // hintStyle: GoogleFonts.poppins(
                                //     fontWeight: FontWeight.w400,
                                //     color: const Color(0xffA4A4A4))
                              ),
                              validator: (value) {
                                String val =
                                    '^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}\$';
                                RegExp regExp = RegExp(val);
                                if (value!.isEmpty) {
                                  return 'Please Enter Aadhaar NO.\nEx. 1234 5678 9101';
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please Enter Aadhaar NO.\nEx. 1234 5678 9101';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Residential Status",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffA4A4A4))),
                            ),
                            TextFormField(
                              controller: controller.txtResidentialStatus,
                              textInputAction: TextInputAction.next,
                              cursorColor: kprimaryLightColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.sp)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: kprimaryLightColor, width: 2.0),
                                ),
                                // hintText: 'Residential Status',
                                // hintStyle: GoogleFonts.poppins(
                                //     fontWeight: FontWeight.w400,
                                //     color: const Color(0xffA4A4A4))
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Residential Status';
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MaterialButton(
                              onPressed: () {
                                // paymentController.name = txtFatherName.text;

                                // setState(() {
                                //   paymentController.panno.value =
                                //       controller.txtPanNo.text;
                                //   paymentController.date.value = "0";
                                //   paymentController.city.value = "0";
                                //   paymentController.year.value = "2023";
                                //   paymentController.fullname.value =
                                //       controller.txtFatherName.text;
                                //   paymentController.resident.value =
                                //       controller.txtAddress.text;
                                //   paymentController.dob.value =
                                //       controller.txtDOB.text;
                                //   paymentController.aadhar.value =
                                //       controller.txtAadhaarNo.text;
                                // });
                                // paymentController.updateJsonData(
                                //     controller.txtPanNo.text,
                                //     controller.txtFatherName.text,
                                //     controller.txtAddress.text,
                                //     controller.txtDOB.text,
                                //     controller.txtAadhaarNo.text);
                                // paymentController.updateXmlData(
                                //     controller.txtPanNo.text,
                                //     paymentController.date.value,
                                //     "0",
                                //     "2023",
                                //     controller.txtFatherName.text,
                                //     controller.txtAddress.text,
                                //     controller.txtDOB.text,
                                //     controller.txtAadhaarNo.text);
                                controller.validate(
                                  controller.txtPanNo.text,
                                  controller.txtDOB.text,
                                  controller.txtFatherName.text,
                                  controller.txtAddress.text,
                                  controller.gender.value,
                                  controller.txtMaritialStatus.text,
                                  controller.txtAadhaarNo.text,
                                  controller.txtResidentialStatus.text,
                                );
                                if (controller.isValid.value == true) {
                                  if (kDebugMode) {
                                    debugPrint(
                                        "==============================================DONE");
                                  }
                                  // Get.to(Account_Status());
                                }
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            details,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
