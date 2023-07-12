import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/personal_details/personalDetailsController.dart';

class EditPersonalDetails extends StatefulWidget {
  final String? dob;
  final String? fatherName;
  final String? address;
  final String? gender;
  final String? maritialStatus;
  final String? aadhaarNo;
  final String? residentialStatus;
  const EditPersonalDetails(
      {super.key,
      this.dob,
      this.fatherName,
      this.address,
      this.gender,
      this.maritialStatus,
      this.aadhaarNo,
      this.residentialStatus});

  @override
  State<EditPersonalDetails> createState() => _EditPersonalDetailsState();
}

class _EditPersonalDetailsState extends State<EditPersonalDetails> {
  PersonalDetailsController controller = Get.put(PersonalDetailsController());

  @override
  void initState() {
    controller.txtDOB.text = widget.dob ?? "";
    controller.txtFatherName.text = widget.fatherName ?? "";
    controller.txtAddress.text = widget.address ?? "";
    controller.gender.value = widget.gender ?? "";
    controller.txtMaritialStatus.text = widget.maritialStatus ?? "";
    controller.txtAadhaarNo.text = widget.aadhaarNo ?? "";
    controller.txtResidentialStatus.text = widget.residentialStatus ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("Personal Details", onBackTap: () {
        Get.back();
      }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Obx(
          () => Form(
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
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
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
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
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
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
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
                                  width:
                                      controller.gender.value == "male" ? 2 : 1,
                                  color: controller.gender.value == "male"
                                      ? kprimaryColor
                                      : const Color(0xffA4A4A4)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.sp))),
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
                      SizedBox(
                        width: 10.w,
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
                                      : const Color(0xffA4A4A4)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.sp))),
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
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
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
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
                      ),
                      // hintText: 'Aadhaar No.',
                      // hintStyle: GoogleFonts.poppins(
                      //     fontWeight: FontWeight.w400,
                      //     color: const Color(0xffA4A4A4))
                    ),
                    validator: (value) {
                      String val = '^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}\$';
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
                        borderSide:
                            BorderSide(color: kprimaryLightColor, width: 2.0),
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
}
