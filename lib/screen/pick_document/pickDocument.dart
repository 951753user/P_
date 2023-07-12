// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/helper/json_creator.dart';
import 'package:payment_app/screen/pick_document/pick_document_controller.dart';

class PickDocument extends GetView<PickDocumentController> {
  const PickDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A4965),
        title: Text(
          "Form Text",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.getData();
              },
              icon: const Icon(Icons.camera_alt_outlined)),
          IconButton(
            onPressed: () async {
              final directory = await getApplicationDocumentsDirectory();
              debugPrint(
                  "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||${directory.path}");
              if (controller.grossSalary.value.isNotEmpty &&
                  controller.salaryAsPerProvisions.value.isNotEmpty &&
                  controller.panCardNo.value.isNotEmpty &&
                  controller.tanOfDeductor.value.isNotEmpty &&
                  controller.valueOfPerquisites.value.isNotEmpty &&
                  controller.profitsInLieuOfSalary.value.isNotEmpty &&
                  controller.travelAllowance.value.isNotEmpty &&
                  controller.houseRent.value.isNotEmpty &&
                  controller.totalAmountOfDeductions.value.isNotEmpty &&
                  controller.standardDeduction.value.isNotEmpty &&
                  controller.entertainmentAllowance.value.isNotEmpty &&
                  controller.taxOnEmployment.value.isNotEmpty &&
                  controller.incomeChargeable.value.isNotEmpty &&
                  controller.grossAmountSection80[0].isNotEmpty &&
                  controller.grossAmountSection80[1].isNotEmpty &&
                  controller.grossAmountSection80[2].isNotEmpty &&
                  controller.grossAmountSection80[4].isNotEmpty &&
                  controller.grossAmountSection80[5].isNotEmpty &&
                  controller.grossAmountSection80[6].isNotEmpty &&
                  controller.grossAmountSection80[7].isNotEmpty &&
                  controller.deductibleAmountUnderChapterVIA.value.isNotEmpty &&
                  controller.deductAmountSection80[0].isNotEmpty &&
                  controller.deductAmountSection80[4].isNotEmpty &&
                  controller.deductAmountSection80[5].isNotEmpty &&
                  controller.deductAmountSection80[6].isNotEmpty &&
                  controller.taxOnTotalIncome.value.isNotEmpty &&
                  controller.surchargeWhereverApplicable.value.isNotEmpty &&
                  controller.healthAndEducationCess.value.isNotEmpty &&
                  controller.taxPayable.value.isNotEmpty &&
                  controller.taxPayable.value.isNotEmpty &&
                  controller.section89.value.isNotEmpty &&
                  controller.netTaxPayable.value.isNotEmpty &&
                  controller.section87A.value.isNotEmpty &&
                  controller.section80G[0].isNotEmpty &&
                  controller.section80G[2].isNotEmpty &&
                  controller.section80TTA[2].isNotEmpty &&
                  controller.grossTotalIncome.isNotEmpty &&
                  controller.incomeReportedByEmployee.isNotEmpty &&
                  controller.bookExcemtion.isNotEmpty &&
                  controller.foodExcemtion.isNotEmpty &&
                  controller.gadgetExcemtion.isNotEmpty &&
                  controller.giftExcemtion.isNotEmpty &&
                  controller.internetExcemtion.isNotEmpty &&
                  controller.professionExcemption.isNotEmpty &&
                  controller.refurbishExcemption.isNotEmpty &&
                  controller.telephoneExcemption.isNotEmpty &&
                  controller.one[1].isNotEmpty &&
                  controller.twelve[1].isNotEmpty &&
                  controller.three[1].isNotEmpty &&
                  controller.four[1].isNotEmpty &&
                  controller.five[1].isNotEmpty &&
                  controller.six[1].isNotEmpty &&
                  controller.seven[1].isNotEmpty &&
                  controller.eight[1].isNotEmpty &&
                  controller.nine[1].isNotEmpty &&
                  controller.ten[1].isNotEmpty &&
                  controller.eleven[1].isNotEmpty &&
                  controller.twelve[1].isNotEmpty &&
                  controller.totalTds.isNotEmpty) {
                try {
                  updateJsonData(
                    controller.panCardNo.value,
                    "3675 9834 6015",
                    controller.tanOfDeductor.value,
                    double.parse(controller.grossSalary.value),
                    double.parse(controller.salaryAsPerProvisions.value),
                    double.parse(controller.valueOfPerquisites.value),
                    double.parse(controller.profitsInLieuOfSalary.value),
                    double.parse(controller.travelAllowance.value),
                    double.parse(controller.houseRent.value),
                    double.parse(controller.totalAmountOfDeductions.value),
                    double.parse(controller.standardDeduction.value),
                    double.parse(controller.entertainmentAllowance.value),
                    double.parse(controller.taxOnEmployment.value),
                    double.parse(controller.incomeChargeable.value),
                    double.parse(controller.grossAmountSection80[0]),
                    double.parse(controller.grossAmountSection80[1]),
                    double.parse(controller.grossAmountSection80[2]),
                    double.parse(controller.grossAmountSection80[4]),
                    double.parse(controller.grossAmountSection80[5]),
                    double.parse(controller.grossAmountSection80[6]),
                    double.parse(controller.grossAmountSection80[7]),
                    double.parse(
                        controller.deductibleAmountUnderChapterVIA.value),
                    double.parse(controller.deductAmountSection80[0]),
                    double.parse(controller.deductAmountSection80[4]),
                    double.parse(controller.deductAmountSection80[5]),
                    double.parse(controller.deductAmountSection80[6]),
                    double.parse(controller.taxOnTotalIncome.value),
                    double.parse(controller.surchargeWhereverApplicable.value),
                    double.parse(controller.healthAndEducationCess.value),
                    double.parse(controller.taxPayable.value),
                    double.parse(controller.taxPayable.value),
                    double.parse(controller.section89.value),
                    double.parse(controller.netTaxPayable.value),
                    double.parse(controller.section87A.value),
                    double.parse(controller.section80G[0]),
                    double.parse(controller.section80G[2]),
                    double.parse(controller.section80TTA[2]),
                    double.parse(controller.grossTotalIncome.value),
                    double.parse(controller.incomeReportedByEmployee.value),
                    double.parse(controller.bookExcemtion.value),
                    double.parse(controller.foodExcemtion.value),
                    double.parse(controller.gadgetExcemtion.value),
                    double.parse(controller.giftExcemtion.value),
                    double.parse(controller.internetExcemtion.value),
                    double.parse(controller.professionExcemption.value),
                    double.parse(controller.refurbishExcemption.value),
                    double.parse(controller.telephoneExcemption.value),
                    double.parse(controller.one[1]),
                    double.parse(controller.two[1]),
                    double.parse(controller.three[1]),
                    double.parse(controller.four[1]),
                    double.parse(controller.five[1]),
                    double.parse(controller.six[1]),
                    double.parse(controller.seven[1]),
                    double.parse(controller.eight[1]),
                    double.parse(controller.nine[1]),
                    double.parse(controller.ten[1]),
                    double.parse(controller.eleven[1]),
                    double.parse(controller.twelve[1]),
                    double.parse(controller.totalTds.value),
                  );
                  updateXmlData();
                  changexml("BNZAA2318J");
                } catch (e) {
                  debugPrint("$e");

                  if (e
                      .toString()
                      .contains("FormatException: Invalid double")) {
                    Fluttertoast.showToast(
                        msg: "Photos are not clear",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: kprimaryColor,
                        textColor: Colors.white,
                        fontSize: 16.sp);
                  } else {
                    Fluttertoast.showToast(
                        msg:
                            "Please Submit All photos some Photos is still missing",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: kprimaryColor,
                        textColor: Colors.white,
                        fontSize: 16.sp);
                  }
                }
              } else {
                Fluttertoast.showToast(
                    msg:
                        "Please Submit All photos some Photos is still missing",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kprimaryColor,
                    textColor: Colors.white,
                    fontSize: 16.sp);
              }
            },
            icon: const Icon(Icons.upload),
          ),
        ],
      ),
      body: Obx(() => controller.texts.isEmpty
              ? controller.allLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: kprimaryLightColor,
                      ),
                    )
                  : Center(
                      child: Text(
                        "No Photos Found",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                        ),
                      ),
                    )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemCount: controller.images.length,
                        itemBuilder: (context, index) {
                          for (int c = 0; c < controller.texts.length; c++) {
                            conditions(c);
                          }
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Stack(
                              // fit: StackFit.loose,
                              children: [
                                Image.file(
                                  File(controller.images[index]!),
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 30.h,
                                    width: 30.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black),
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade300),
                                    alignment: Alignment.center,
                                    child: Text("${index + 1}"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 90.h),
                    MaterialButton(
                      onPressed: () {
                        uploadDataLoading.value = true;
                        if (controller.grossSalary.value.isNotEmpty &&
                            controller.salaryAsPerProvisions.value.isNotEmpty &&
                            controller.panCardNo.value.isNotEmpty &&
                            controller.tanOfDeductor.value.isNotEmpty &&
                            controller.valueOfPerquisites.value.isNotEmpty &&
                            controller.profitsInLieuOfSalary.value.isNotEmpty &&
                            controller.travelAllowance.value.isNotEmpty &&
                            controller.houseRent.value.isNotEmpty &&
                            controller
                                .totalAmountOfDeductions.value.isNotEmpty &&
                            controller.standardDeduction.value.isNotEmpty &&
                            controller
                                .entertainmentAllowance.value.isNotEmpty &&
                            controller.taxOnEmployment.value.isNotEmpty &&
                            controller.incomeChargeable.value.isNotEmpty &&
                            controller.grossAmountSection80[0].isNotEmpty &&
                            controller.grossAmountSection80[1].isNotEmpty &&
                            controller.grossAmountSection80[2].isNotEmpty &&
                            controller.grossAmountSection80[4].isNotEmpty &&
                            controller.grossAmountSection80[5].isNotEmpty &&
                            controller.grossAmountSection80[6].isNotEmpty &&
                            controller.grossAmountSection80[7].isNotEmpty &&
                            controller.deductibleAmountUnderChapterVIA.value
                                .isNotEmpty &&
                            controller.deductAmountSection80[0].isNotEmpty &&
                            controller.deductAmountSection80[4].isNotEmpty &&
                            controller.deductAmountSection80[5].isNotEmpty &&
                            controller.deductAmountSection80[6].isNotEmpty &&
                            controller.taxOnTotalIncome.value.isNotEmpty &&
                            controller
                                .surchargeWhereverApplicable.value.isNotEmpty &&
                            controller
                                .healthAndEducationCess.value.isNotEmpty &&
                            controller.taxPayable.value.isNotEmpty &&
                            controller.taxPayable.value.isNotEmpty &&
                            controller.section89.value.isNotEmpty &&
                            controller.netTaxPayable.value.isNotEmpty &&
                            controller.section87A.value.isNotEmpty &&
                            controller.section80G[0].isNotEmpty &&
                            controller.section80G[2].isNotEmpty &&
                            controller.section80TTA[2].isNotEmpty &&
                            controller.grossTotalIncome.isNotEmpty &&
                            controller.incomeReportedByEmployee.isNotEmpty &&
                            controller.bookExcemtion.isNotEmpty &&
                            controller.foodExcemtion.isNotEmpty &&
                            controller.gadgetExcemtion.isNotEmpty &&
                            controller.giftExcemtion.isNotEmpty &&
                            controller.internetExcemtion.isNotEmpty &&
                            controller.professionExcemption.isNotEmpty &&
                            controller.refurbishExcemption.isNotEmpty &&
                            controller.telephoneExcemption.isNotEmpty &&
                            controller.one[1].isNotEmpty &&
                            controller.twelve[1].isNotEmpty &&
                            controller.three[1].isNotEmpty &&
                            controller.four[1].isNotEmpty &&
                            controller.five[1].isNotEmpty &&
                            controller.six[1].isNotEmpty &&
                            controller.seven[1].isNotEmpty &&
                            controller.eight[1].isNotEmpty &&
                            controller.nine[1].isNotEmpty &&
                            controller.ten[1].isNotEmpty &&
                            controller.eleven[1].isNotEmpty &&
                            controller.twelve[1].isNotEmpty &&
                            controller.totalTds.isNotEmpty) {
                          try {
                            updateJsonData(
                              controller.panCardNo.value,
                              "3675 9834 6015",
                              controller.tanOfDeductor.value,
                              double.parse(controller.grossSalary.value),
                              double.parse(
                                  controller.salaryAsPerProvisions.value),
                              double.parse(controller.valueOfPerquisites.value),
                              double.parse(
                                  controller.profitsInLieuOfSalary.value),
                              double.parse(controller.travelAllowance.value),
                              double.parse(controller.houseRent.value),
                              double.parse(
                                  controller.totalAmountOfDeductions.value),
                              double.parse(controller.standardDeduction.value),
                              double.parse(
                                  controller.entertainmentAllowance.value),
                              double.parse(controller.taxOnEmployment.value),
                              double.parse(controller.incomeChargeable.value),
                              double.parse(controller.grossAmountSection80[0]),
                              double.parse(controller.grossAmountSection80[1]),
                              double.parse(controller.grossAmountSection80[2]),
                              double.parse(controller.grossAmountSection80[4]),
                              double.parse(controller.grossAmountSection80[5]),
                              double.parse(controller.grossAmountSection80[6]),
                              double.parse(controller.grossAmountSection80[7]),
                              double.parse(controller
                                  .deductibleAmountUnderChapterVIA.value),
                              double.parse(controller.deductAmountSection80[0]),
                              double.parse(controller.deductAmountSection80[4]),
                              double.parse(controller.deductAmountSection80[5]),
                              double.parse(controller.deductAmountSection80[6]),
                              double.parse(controller.taxOnTotalIncome.value),
                              double.parse(
                                  controller.surchargeWhereverApplicable.value),
                              double.parse(
                                  controller.healthAndEducationCess.value),
                              double.parse(controller.taxPayable.value),
                              double.parse(controller.taxPayable.value),
                              double.parse(controller.section89.value),
                              double.parse(controller.netTaxPayable.value),
                              double.parse(controller.section87A.value),
                              double.parse(controller.section80G[0]),
                              double.parse(controller.section80G[2]),
                              double.parse(controller.section80TTA[2]),
                              double.parse(controller.grossTotalIncome.value),
                              double.parse(
                                  controller.incomeReportedByEmployee.value),
                              double.parse(controller.bookExcemtion.value),
                              double.parse(controller.foodExcemtion.value),
                              double.parse(controller.gadgetExcemtion.value),
                              double.parse(controller.giftExcemtion.value),
                              double.parse(controller.internetExcemtion.value),
                              double.parse(
                                  controller.professionExcemption.value),
                              double.parse(
                                  controller.refurbishExcemption.value),
                              double.parse(
                                  controller.telephoneExcemption.value),
                              double.parse(controller.one[1]),
                              double.parse(controller.two[1]),
                              double.parse(controller.three[1]),
                              double.parse(controller.four[1]),
                              double.parse(controller.five[1]),
                              double.parse(controller.six[1]),
                              double.parse(controller.seven[1]),
                              double.parse(controller.eight[1]),
                              double.parse(controller.nine[1]),
                              double.parse(controller.ten[1]),
                              double.parse(controller.eleven[1]),
                              double.parse(controller.twelve[1]),
                              double.parse(controller.totalTds.value),
                            );
                            updateXmlData();
                            changexml("BNZAA2318J");
                          } catch (e) {
                            debugPrint("$e");

                            if (e
                                .toString()
                                .contains("FormatException: Invalid double")) {
                              Fluttertoast.showToast(
                                  msg: "Photos are not clear",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: kprimaryColor,
                                  textColor: Colors.white,
                                  fontSize: 16.sp);
                            } else {
                              Fluttertoast.showToast(
                                  msg:
                                      "Please Submit All photos some Photos is still missing",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: kprimaryColor,
                                  textColor: Colors.white,
                                  fontSize: 16.sp);
                            }
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  "Please Submit All photos some Photos is still missing",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: kprimaryColor,
                              textColor: Colors.white,
                              fontSize: 16.sp);
                        }
                      },
                      minWidth: 140.w,
                      height: 50.h,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.sp),
                      ),
                      color: const Color(0xff45BA1C),
                      child: uploadDataLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Upload",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                )
          // Padding(
          //     padding: EdgeInsets.all(10.sp),
          //     child: SingleChildScrollView(
          //       child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           //
          //           children: [
          //             controller.galleryImage != null
          //                 ? InteractiveViewer(
          //                     maxScale: 500,
          //                     child: Image.file(
          //                       File(controller.galleryImage!),
          //                       // height: 300,
          //                       // width: double.infinity,
          //                     ),
          //                   )
          //                 : Container(),
          //             ListView(
          //               shrinkWrap: true,
          //               physics: const NeverScrollableScrollPhysics(),
          //               children:
          //                   List.generate(controller.texts.length, (index) {
          //                 conditions(index);
          //                 return Text(
          //                     "$index ==> ${controller.texts[index]}");
          //               }),
          //             ),
          //             list(controller.q1, "q1"),
          //             list(controller.q2, "q2"),
          //             list(controller.q3, "q3"),
          //             list(controller.q4, "q4"),
          //             list(controller.total, "total"),
          //             list(controller.one, "ONE"),
          //             list(controller.two, "TWO"),
          //             list(controller.three, "THREE"),
          //             list(controller.four, "FOUR"),
          //             list(controller.five, "FIVE"),
          //             list(controller.six, "SIX"),
          //             list(controller.seven, "SEVEN"),
          //             list(controller.eight, "EIGHT"),
          //             list(controller.nine, "NINE"),
          //             list(controller.ten, "TEN"),
          //             list(controller.eleven, "ELEVEN"),
          //             list(controller.twelve, "TWELVE"),
          //             text(
          //                 "--------------------------------------------------------------------------------------"),
          //             text("pan Card No. ===> ${controller.panCardNo.value}"),
          //             text(
          //                 "TAN of the Deductor ===> ${controller.tanOfDeductor.value}"),
          //             text(
          //                 "gross salary ===> ${controller.grossSalary.value}"),
          //             text(
          //                 "travel allowance ===> ${controller.travelAllowance.value}"),
          //             text(
          //                 "book Excemtion ===> ${controller.bookExcemtion.value}"),
          //             text(
          //                 "food Excemtion ===> ${controller.foodExcemtion.value}"),
          //             text(
          //                 "gadget Excemtion ===> ${controller.gadgetExcemtion.value}"),
          //             text(
          //                 "gift Excemtion ===> ${controller.giftExcemtion.value}"),
          //             text(
          //                 "internet Excemtion ===> ${controller.internetExcemtion.value}"),
          //             text(
          //                 "profession Excemtion ===> ${controller.professionExcemption.value}"),
          //             text(
          //                 "refurbish Excemtion ===> ${controller.refurbishExcemption.value}"),
          //             text(
          //                 "telephone Excemtion ===> ${controller.telephoneExcemption.value}"),
          //             text("house rent ===> ${controller.houseRent.value}"),
          //             text("death cum ===> ${controller.deathCum.value}"),
          //             text("pension ===> ${controller.pension.value}"),
          //             text(
          //                 "leave salary ===> ${controller.leaveSalary.value}"),
          //             text(
          //                 "total Under Section 10 ===> ${controller.totalUnderSection10.value}"),
          //             text(
          //                 "exemption claimed under section 10 ===> ${controller.exemptionClaimedUnderSection10.value}"),
          //             text(
          //                 "current employer[1(d)-2(h)] ===> ${controller.currentEmployer.value}"),
          //             text(
          //                 "Standard deduction under section 16(ia) ===> ${controller.standardDeduction.value}"),
          //             text(
          //                 "Entertainment allowance under section 16(ii) ===> ${controller.entertainmentAllowance.value}"),
          //             text(
          //                 "Tax on employment under section 16(iii) ===> ${controller.taxOnEmployment.value}"),
          //             text(
          //                 "section 16 [4(a)+4(b)+4(c)] ===> ${controller.totalAmountOfDeductions.value}"),
          //             text(
          //                 "Income chargeable under the head \"Salaries\" [(3+1(e)-5] ===> ${controller.incomeChargeable.value}"),
          //             text(
          //                 "employee offered for TDS ===> ${controller.employeeOfferedForTDS.value}"),
          //             text(
          //                 "Sources offered for TDS ===> ${controller.sourceOfferedForTDS.value}"),
          //             text(
          //                 "income reported by the employee ===> ${controller.incomeReportedByEmployee.value}"),
          //             text(
          //                 "Gross Total Income ===> ${controller.grossTotalIncome.value}"),
          //             text(
          //                 "--------------------------------------------------------------------------------------"),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       "grossAmountSection80",
          //                       style: TextStyle(fontSize: 13.sp),
          //                     ),
          //                     const SizedBox(
          //                       height: 7,
          //                     ),
          //                     Container(
          //                       height: 1,
          //                       width:
          //                           MediaQuery.of(context).size.height * 0.2,
          //                       color: Colors.black,
          //                     ),
          //                     list(controller.grossAmountSection80, ""),
          //                   ],
          //                 ),
          //                 Container(
          //                   height: MediaQuery.of(context).size.height * 0.27,
          //                   width: 1,
          //                   color: Colors.black,
          //                 ),
          //                 Column(
          //                   children: [
          //                     Text(
          //                       "deductAmountSection80",
          //                       style: TextStyle(fontSize: 13.sp),
          //                     ),
          //                     const SizedBox(
          //                       height: 7,
          //                     ),
          //                     Container(
          //                       height: 1,
          //                       width:
          //                           MediaQuery.of(context).size.height * 0.2,
          //                       color: Colors.black,
          //                     ),
          //                     list(controller.deductAmountSection80, ""),
          //                   ],
          //                 )
          //               ],
          //             ),
          //             list(controller.section80G, "Section 80G"),
          //             list(controller.section80TTA, "Section 80TTA"),
          //             list(controller.deductibleUnderAnyOtherProvisions,
          //                 "deductibleUnderAnyOtherProvisions"),
          //             text(
          //                 "--------------------------------------------------------------------------------------"),
          //             text(
          //                 "[10(d)+10(e)+10(f)+10(g)+10(h)+10(i)+10(j)+10(l)] ===> ${controller.deductibleAmountUnderChapterVIA.value}"),
          //             text(
          //                 "Total Taxable Income ===> ${controller.totalTaxableIncome.value}"),
          //             text(
          //                 "Tax on total income ===> ${controller.taxOnTotalIncome.value}"),
          //             text("section 87A ===> ${controller.section87A.value}"),
          //             text(
          //                 "Surcharge, wherever applicable ===> ${controller.surchargeWhereverApplicable.value}"),
          //             text(
          //                 "Health and education cess ===> ${controller.healthAndEducationCess.value}"),
          //             text(
          //                 "Tax payable (13+15+16-14) ===> ${controller.taxPayable.value}"),
          //             text("section 89 ===> ${controller.section89.value}"),
          //             text(
          //                 "Net tax payable ===> ${controller.netTaxPayable.value}"),
          //           ]),
          //     ),
          //   ),
          ),
    );
  }

  Widget list(List data, String name) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(data.length, (index) {
            return Text("$name ====> ${data[index]}");
          }),
        ),
      ),
    );
  }

  Widget text(String data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(data),
    );
  }

  void conditions(int index) {
    if (controller.texts[index]!.contains("Amount of tax deposited")) {
      controller.q1.clear();
      controller.q2.clear();
      controller.q3.clear();
      controller.q4.clear();
      controller.total.clear();

      int scannedIndex = index + 5;
      for (int i = index + 1; i < scannedIndex + 1; i++) {
        controller.q1.add(controller.texts[i]);
        debugPrint("-----------------Q1--------${controller.q1}");
      }

      for (int k = scannedIndex + 1; k < scannedIndex + 6; k++) {
        controller.q2.add(controller.texts[k]);
        debugPrint("-----------------Q2--------${controller.q2}");
      }

      for (int k = scannedIndex + 6; k < scannedIndex + 11; k++) {
        controller.q3.add(controller.texts[k]);
        debugPrint("-----------------Q3--------${controller.q3}");
      }

      for (int k = scannedIndex + 11; k < scannedIndex + 16; k++) {
        controller.q4.add(controller.texts[k]);
        debugPrint("-----------------Q4--------${controller.q4}");
      }

      for (int k = scannedIndex + 16; k < scannedIndex + 21; k++) {
        controller.total.add(controller.texts[k]);
        debugPrint("-----------------Total--------${controller.total}");
      }
    }

    if (controller.texts[index]!.contains("Status of matching withOLTAS*") ||
        controller.texts[index]!.contains("Status of matching with OLTAS*")) {
      controller.one.clear();
      controller.two.clear();
      controller.three.clear();
      controller.four.clear();

      int scannedIndex = index + 6;

      for (int i = index + 1; i < scannedIndex + 1; i++) {
        controller.one.add(controller.texts[i]);
        debugPrint("-----------------ONE--------${controller.one}");
      }

      for (int i = scannedIndex + 1; i < scannedIndex + 7; i++) {
        controller.two.add(controller.texts[i]);
        debugPrint("-----------------TWO--------${controller.two}");
      }

      for (int i = scannedIndex + 7; i < scannedIndex + 13; i++) {
        controller.three.add(controller.texts[i]);
        debugPrint("-----------------THREE--------${controller.three}");
      }

      for (int i = scannedIndex + 13; i < scannedIndex + 19; i++) {
        controller.four.add(controller.texts[i]);
        debugPrint("-----------------FOUR--------${controller.four}");
      }
    }

    if (controller.texts[index] == "OLTAS*" ||
        controller.texts[index] == "Status of matching withO TAS*" ||
        controller.texts[index] == "Status of matching with OTAS*" ||
        controller.texts[index] == "Status of matching with OLTAS*" ||
        controller.texts[index] == "OLTAS") {
      if (controller.one.isEmpty) {
        controller.one.clear();
        controller.two.clear();
        controller.three.clear();
        controller.four.clear();

        int scannedIndex = index + 6;

        for (int i = index + 1; i < scannedIndex + 1; i++) {
          controller.one.add(controller.texts[i]);
          debugPrint("-----------------ONE--------${controller.one}");
        }

        for (int i = scannedIndex + 1; i < scannedIndex + 7; i++) {
          controller.two.add(controller.texts[i]);
          debugPrint("-----------------TWO--------${controller.two}");
        }

        for (int i = scannedIndex + 7; i < scannedIndex + 13; i++) {
          controller.three.add(controller.texts[i]);
          debugPrint("-----------------THREE--------${controller.three}");
        }

        for (int i = scannedIndex + 13; i < scannedIndex + 19; i++) {
          controller.four.add(controller.texts[i]);
          debugPrint("-----------------FOUR--------${controller.four}");
        }
      } else {
        controller.five.clear();
        controller.six.clear();
        controller.seven.clear();
        controller.eight.clear();
        controller.nine.clear();
        controller.ten.clear();
        controller.eleven.clear();
        controller.twelve.clear();

        int scannedIndex = index + 6;
        for (int i = index + 1; i < scannedIndex + 1; i++) {
          controller.five.add(controller.texts[i]);
          debugPrint("-----------------FIVE--------${controller.five}");
        }

        for (int i = scannedIndex + 1; i < scannedIndex + 7; i++) {
          controller.six.add(controller.texts[i]);
          debugPrint("-----------------SIX--------${controller.six}");
        }

        for (int i = scannedIndex + 7; i < scannedIndex + 13; i++) {
          controller.seven.add(controller.texts[i]);
          debugPrint("-----------------SEVEN--------${controller.seven}");
        }

        for (int i = scannedIndex + 13; i < scannedIndex + 19; i++) {
          controller.eight.add(controller.texts[i]);
          debugPrint("-----------------EIGHT--------${controller.eight}");
        }

        for (int i = scannedIndex + 19; i < scannedIndex + 25; i++) {
          controller.nine.add(controller.texts[i]);
          debugPrint("-----------------NINE--------${controller.nine}");
        }

        for (int i = scannedIndex + 25; i < scannedIndex + 31; i++) {
          controller.ten.add(controller.texts[i]);
          debugPrint("-----------------TEN--------${controller.ten}");
        }

        for (int i = scannedIndex + 31; i < scannedIndex + 37; i++) {
          controller.eleven.add(controller.texts[i]);
          debugPrint("-----------------ELEVEN--------${controller.eleven}");
        }

        for (int i = scannedIndex + 37; i < scannedIndex + 43; i++) {
          controller.twelve.add(controller.texts[i]);
          debugPrint("-----------------TWELVE--------${controller.twelve}");
        }

        controller.totalTds.value = controller.texts[scannedIndex + 44];
        debugPrint(
            "--------------total TDS-------------${controller.totalTds.value}");
      }
    }

    if (controller.texts[index]!.contains("Employee Reference No, provided by theEmployer/Pension Payment order no.providedby the Emplover (f available)") ||
        controller.texts[index]!.contains(
            "Employee Reference No,provided by theEmployer/Pension Payment order no. providedby the Employer(If available)") ||
        controller.texts[index]!.contains("by the Employer (If available)") ||
        controller.texts[index]!
            .contains("providedby the Employer (If available)") ||
        controller.texts[index]!
            .contains("no.providedby the Employer (If available)")) {
      if (controller.validateTAN(controller.texts[index + 2])) {
        controller.tanOfDeductor.value = controller.texts[index + 2];
      }

      debugPrint(
          "--------------TAN of Deductor----------${controller.tanOfDeductor.value}");
      // txttravel.text = controller.travelAllowance.value;
    }

    if (controller.texts[index]!.contains("10(5)")) {
      controller.travelAllowance.value = controller.texts[index + 1];
      debugPrint(
          "--------------travel allowance----------${controller.travelAllowance.value}");
      // txttravel.text = controller.travelAllowance.value;
    }

    if (controller.texts[index]!
            .contains("Salary as per provisions contained in section 17(1)") ||
        controller.texts[index]!.contains("17(1)")) {
      controller.salaryAsPerProvisions.value = controller.texts[index + 1];
      debugPrint(
          "--------------salaryAsPerProvisions----------${controller.salaryAsPerProvisions.value}");
    }

    if (controller.texts[index]!.contains(
            "Value of perquisites under section 17(2) (as per Form No. 12BA,wherever applicable)") ||
        controller.texts[index]!.contains("17(2)")) {
      controller.valueOfPerquisites.value = controller.texts[index + 1];
      debugPrint(
          "--------------valueOfPerquisites----------${controller.valueOfPerquisites.value}");
    }

    if (controller.texts[index]!.contains(
            "Profits in lieu of salary under section 17(3) (as per Form No.12BA, wherever applicable) ") ||
        controller.texts[index]!.contains("17(3)")) {
      controller.profitsInLieuOfSalary.value = controller.texts[index + 1];
      debugPrint(
          "--------------profitsInLieuOfSalary----------${controller.profitsInLieuOfSalary.value}");
    }

    if (controller.texts[index]!.contains("10(13A)")) {
      controller.houseRent.value = controller.texts[index + 1];
      debugPrint(
          "--------------house rent----------${controller.houseRent.value}");
      // txthouse.text = controller.houseRent.value;
    }

    if (controller.texts[index]!.contains("10(10)")) {
      if (controller.texts[index + 1] == "") {
        controller.deathCum.value = controller.texts[index + 2];
      } else {
        controller.deathCum.value = controller.texts[index + 1];
      }
      debugPrint(
          "--------------Death-cum-retirement----------${controller.deathCum.value}");
      // txtdeath.text = controller.deathCum.value;
    }

    if (controller.texts[index]!.contains("10(10A)")) {
      controller.pension.value = controller.texts[index + 1];
      debugPrint("--------------pension----------${controller.pension.value}");
      // txtpension.text = controller.pension.value;
    }

    if (controller.texts[index]!.contains("10(10AA)")) {
      controller.leaveSalary.value = controller.texts[index + 1];
      debugPrint(
          "--------------leave salary----------${controller.leaveSalary.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index] == "Total" ||
        controller.texts[index] == "total") {
      controller.grossSalary.value = controller.texts[index + 1];
      debugPrint(
          "---------------gross salary---------${controller.grossSalary.value}");
      // txtgross.text = controller.grossSalary.value;
    }

    if (controller.texts[index]!.contains("Books And Periodicals Exemption") ||
        controller.texts[index]!.contains("Books And Periodicals")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.bookExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          // controller.bookExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.bookExcemtion.value = item[0] + item[1];
          } else {
            controller.bookExcemtion.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.bookExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          // controller.bookExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.bookExcemtion.value = item[0] + item[1];
          } else {
            controller.bookExcemtion.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.bookExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          // controller.bookExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.bookExcemtion.value = item[0] + item[1];
          } else {
            controller.bookExcemtion.value = controller.texts[index + 1];
          }
        }
      }
      // controller.bookExcemtion.value = controller.texts[index + 1];
      debugPrint(
          "--------------books excemption----------${controller.bookExcemtion.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("Food Exemption") ||
        controller.texts[index]!.contains("Food")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.foodExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          // controller.foodExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.foodExcemtion.value = item[0] + item[1];
          } else {
            controller.foodExcemtion.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.foodExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          // controller.foodExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.foodExcemtion.value = item[0] + item[1];
          } else {
            controller.foodExcemtion.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.foodExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          // controller.foodExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.foodExcemtion.value = item[0] + item[1];
          } else {
            controller.foodExcemtion.value = controller.texts[index + 1];
          }
        }
      }
      // controller.foodExcemtion.value = controller.texts[index + 1];
      debugPrint(
          "--------------food excemption----------${controller.foodExcemtion.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("Gadget Exemption") ||
        controller.texts[index]!.contains("Gadget")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.gadgetExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          // controller.gadgetExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.gadgetExcemtion.value = item[0] + item[1];
          } else {
            controller.gadgetExcemtion.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.gadgetExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          // controller.gadgetExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.gadgetExcemtion.value = item[0] + item[1];
          } else {
            controller.gadgetExcemtion.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.gadgetExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          // controller.gadgetExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.gadgetExcemtion.value = item[0] + item[1];
          } else {
            controller.gadgetExcemtion.value = controller.texts[index + 1];
          }
        }
      }
      // controller.gadgetExcemtion.value = controller.texts[index + 1];
      debugPrint(
          "--------------Gadget excemption----------${controller.gadgetExcemtion.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("Gift Exemption") ||
        controller.texts[index]!.contains("Gift")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.giftExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          // controller.giftExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.giftExcemtion.value = item[0] + item[1];
          } else {
            controller.giftExcemtion.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.giftExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          // controller.giftExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.giftExcemtion.value = item[0] + item[1];
          } else {
            controller.giftExcemtion.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.giftExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          // controller.giftExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.giftExcemtion.value = item[0] + item[1];
          } else {
            controller.giftExcemtion.value = controller.texts[index + 1];
          }
        }
      }
      // controller.giftExcemtion.value = controller.texts[index + 1];
      debugPrint(
          "--------------Gift excemption----------${controller.giftExcemtion.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("Internet Exemption") ||
        controller.texts[index]!.contains("Internet")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.internetExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          // controller.internetExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.internetExcemtion.value = item[0] + item[1];
          } else {
            controller.internetExcemtion.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.internetExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          // controller.internetExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.internetExcemtion.value = item[0] + item[1];
          } else {
            controller.internetExcemtion.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.internetExcemtion.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          // controller.internetExcemtion.value = item[0] + item[1];
          if (item.length == 3) {
            controller.internetExcemtion.value = item[0] + item[1];
          } else {
            controller.internetExcemtion.value = controller.texts[index + 1];
          }
        }
      }
      // controller.internetExcemtion.value = controller.texts[index + 1];
      debugPrint(
          "--------------Internet Exemption----------${controller.internetExcemtion.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("PROFESSIONAL, EXEMPTION") ||
        controller.texts[index]!.contains("PROFESSIONAL EXEMPTION") ||
        controller.texts[index]!.contains("PROFESSIONAL")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.professionExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          // controller.professionExcemption.value = item[0] + item[1];
          if (item.length == 3) {
            controller.professionExcemption.value = item[0] + item[1];
          } else {
            controller.professionExcemption.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.professionExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          // controller.professionExcemption.value = item[0] + item[1];
          if (item.length == 3) {
            controller.professionExcemption.value = item[0] + item[1];
          } else {
            controller.professionExcemption.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.professionExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          // controller.professionExcemption.value = item[0] + item[1];
          if (item.length == 3) {
            controller.professionExcemption.value = item[0] + item[1];
          } else {
            controller.professionExcemption.value = controller.texts[index + 1];
          }
        }
      }
      // controller.professionExcemption.value = controller.texts[index + 1];
      debugPrint(
          "--------------PROFESSIONAL EXEMPTION----------${controller.professionExcemption.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("Refurbish Exemption") ||
        controller.texts[index]!.contains("Refurbish")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.refurbishExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          if (item.length == 3) {
            controller.refurbishExcemption.value = item[0] + item[1];
          } else {
            controller.refurbishExcemption.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.refurbishExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          if (item.length == 3) {
            controller.refurbishExcemption.value = item[0] + item[1];
          } else {
            controller.refurbishExcemption.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.refurbishExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          if (item.length == 3) {
            controller.refurbishExcemption.value = item[0] + item[1];
          } else {
            controller.refurbishExcemption.value = controller.texts[index + 1];
          }
        }
      }
      // controller.refurbishExcemption.value = controller.texts[index + 1];
      debugPrint(
          "--------------Refurbish Exemption----------${controller.refurbishExcemption.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("Telephone Exemption") ||
        controller.texts[index]!.contains("Telephone")) {
      if (controller.texts[index + 1]!.contains(" ") ||
          controller.texts[index + 1]!.contains(")") ||
          controller.texts[index + 1]!.contains("(") ||
          controller.texts[index + 1]!.contains("|")) {
        if (controller.texts[index + 2]!.contains(",")) {
          var item = controller.texts[index + 2].split(",");
          controller.telephoneExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 2].split(".");
          // controller.telephoneExcemption.value = item[0] + item[1];
          if (item.length == 3) {
            controller.telephoneExcemption.value = item[0] + item[1];
          } else {
            controller.telephoneExcemption.value = controller.texts[index + 2];
          }
        }
      } else if (controller.texts[index + 2]!.contains(" ") ||
          controller.texts[index + 2]!.contains(")") ||
          controller.texts[index + 2]!.contains("(") ||
          controller.texts[index + 2]!.contains("|")) {
        if (controller.texts[index + 3]!.contains(",")) {
          var item = controller.texts[index + 3].split(",");
          controller.telephoneExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 3].split(".");
          // controller.telephoneExcemption.value = item[0] + item[1];
          if (item.length == 3) {
            controller.telephoneExcemption.value = item[0] + item[1];
          } else {
            controller.telephoneExcemption.value = controller.texts[index + 3];
          }
        }
      } else {
        if (controller.texts[index + 1]!.contains(",")) {
          var item = controller.texts[index + 1].split(",");
          controller.telephoneExcemption.value = item[0] + item[1];
        } else {
          var item = controller.texts[index + 1].split(".");
          // controller.telephoneExcemption.value = item[0] + item[1];
          if (item.length == 3) {
            controller.telephoneExcemption.value = item[0] + item[1];
          } else {
            controller.telephoneExcemption.value = controller.texts[index + 1];
          }
        }
      }
      // if(controller.texts[index + 1]!.contains(".00")){
      //
      //   var item = controller.texts[index + 1].split(".00");
      //
      //   controller.telephoneExcemption.value = item[0];
      // } else if(controller.texts[index + 1]!.contains(".0")){
      //   var item = controller.texts[index + 1].split(".0");
      //
      //   controller.telephoneExcemption.value = item[0];
      // }

      debugPrint(
          "--------------Telephone Exemption----------${controller.telephoneExcemption.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!
            .contains("Total amount of any other exemption under setion 10") ||
        controller.texts[index]!
            .contains("Total amount of any other exemption under section 10")) {
      controller.totalUnderSection10.value = controller.texts[index + 1];
      debugPrint(
          "--------------total Under Section 10----------${controller.totalUnderSection10.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!
            .contains("section 10[2a/2(0b)2(c9)2@d+2(e)2g)]") ||
        controller.texts[index]!
            .contains("section 10[2(a)+2(b)+2(c)+2(d)+2(e)+2(g)") ||
        controller.texts[index]!
            .contains("section 10[2(a)+2(b)+2(c)+2(d)+2(e)+2(g)]")) {
      controller.exemptionClaimedUnderSection10.value =
          controller.texts[index + 2];
      debugPrint(
          "--------------exemption claimed under section 10----------${controller.exemptionClaimedUnderSection10.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("Total amount of salary received from current employer[1(d-2(b)") ||
        controller.texts[index]!.contains(
            "Total amount of salary received from current employer[1(d-2(b)]") ||
        controller.texts[index]!.contains(
            "Total amount of salary received from current employer[(d)-2(bh)") ||
        controller.texts[index]!.contains(
            "Total amount of salary received from current employer[(d)-2(b)]") ||
        controller.texts[index]!.contains(
            "Total amount of salary received from current employer[1(d)-2(h)]") ||
        controller.texts[index]!.contains(
            "Total amount of salary received from current employer[1(d-2(h)]")) {
      controller.currentEmployer.value = controller.texts[index + 2];
      debugPrint(
          "--------------current employer[1(d)-2(h)]----------${controller.currentEmployer.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("16(im)") ||
        controller.texts[index]!.contains("16(ia)")) {
      controller.standardDeduction.value = controller.texts[index + 1];
      debugPrint(
          "--------------Standard deduction under section 16(ia)----------${controller.standardDeduction.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!
            .contains("Entertainment allowance under section 16(i)") ||
        controller.texts[index]!
            .contains("Entertainment allowance under section 16(ii)") ||
        controller.texts[index]!
            .contains("Entertainment allowance under section 16(iii)")) {
      controller.entertainmentAllowance.value = controller.texts[index + 1];

      if (controller.entertainmentAllowance.contains(')')) {
        var n = controller.entertainmentAllowance.value.split(')');

        controller.entertainmentAllowance.value = n[0];
      }
      debugPrint(
          "--------------Entertainment allowance under section 16(ii)----------${controller.entertainmentAllowance.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("16(m)") ||
        controller.texts[index]!
            .contains("Tax on employment under section 16(i)") ||
        controller.texts[index]!
            .contains("Tax on employment under section 16(mi)") ||
        controller.texts[index]!
            .contains("Tax on employment under section 16(ii)") ||
        controller.texts[index]!
            .contains("Tax on employment under section 16(iii)") ||
        controller.texts[index]!.contains("16(iii)")) {
      controller.taxOnEmployment.value = controller.texts[index + 1];
      debugPrint(
          "--------------Tax on employment under section 16(iii)----------${controller.taxOnEmployment.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("[4(a)+4(b)+4()]") ||
        controller.texts[index]!.contains("[4(a)+4(b)+4(c)]")) {
      controller.totalAmountOfDeductions.value = controller.texts[index + 2];
      debugPrint(
          "--------------section 16 [4(a)+4(b)+4(c)]----------${controller.totalAmountOfDeductions.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("\"Salaries\"(3+1(e)-S]") ||
        controller.texts[index]!.contains("\"Salaries\" (3+1(e)-5]") ||
        controller.texts[index]!.contains("\"Salaries\"(3+1(e)-5]") ||
        controller.texts[index]!.contains("\"Salaries\"[(3+1(e)-S]")) {
      controller.incomeChargeable.value = controller.texts[index + 2];
      debugPrint(
          "--------------Income chargeable under the head \"Salaries\" [(3+1(e)-5]----------${controller.incomeChargeable.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains(
            "Income (or admissible loss) from house property reported byemployee offered for TDS") ||
        controller.texts[index]!.contains(
            "Income (or admissible loss) from house property reported by employee offered for TDS")) {
      controller.employeeOfferedForTDS.value = controller.texts[index + 1];
      debugPrint(
          "--------------employee offered for TDS----------${controller.employeeOfferedForTDS.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!
        .contains("Income under the head Other Sources offered for TDS")) {
      controller.sourceOfferedForTDS.value = controller.texts[index + 1];
      debugPrint(
          "--------------Income under the head Other Sources offered for TDS----------${controller.sourceOfferedForTDS.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("employee[7a)+7(b)") ||
        controller.texts[index]!.contains("employeeI7(a)+7(b)]") ||
        controller.texts[index]!.contains("employee[7(a)+7(b)]")) {
      controller.incomeReportedByEmployee.value = controller.texts[index + 2];
      debugPrint(
          "--------------income reported by the employee----------${controller.incomeReportedByEmployee.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Gross total income (6+8)") ||
        controller.texts[index]!.contains("(6+8)")) {
      controller.grossTotalIncome.value = controller.texts[index + 2];
      debugPrint(
          "--------------Gross total income----------${controller.grossTotalIncome.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Deduction in respect of life insurance premia, contributions toprovident fund ete. under section 80C") ||
        controller.texts[index]!.contains(
            "Deduction in respect of life insurance premia, contributions toprovident fund etc. under section 80C") ||
        controller.texts[index]!.contains(
            "Deduction in respect of life insurance premia, contributions to provident fund etc. under section 80C") ||
        controller.texts[index]!.contains(
            "Deduction in respect of life insurance premia,contributions to provident fund etc. under section 80C") ||
        controller.texts[index]!.contains(
            "Deduction in respect of life insurance premia,contributions toprovident fund etc. under section 80C")) {
      controller.grossAmountSection80.clear();
      controller.deductAmountSection80.clear();
      controller.grossAmountSection80.add(controller.texts[index + 1]);
      controller.deductAmountSection80.add(controller.texts[index + 2]);
      debugPrint(
          "--------------under section 80C----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("section 80CCC") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution to certain pension fundsunder section 80CCC") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution to certain pension funds under section 80CCC")) {
      controller.grossAmountSection80.add(controller.texts[index + 1]);
      controller.deductAmountSection80.add(controller.texts[index + 2]);
      debugPrint(
          "--------------under section 80CCC----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("section 80CCD(1)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by taxpayer to pensionscheme under section 80CCD(1)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by taxpayer to pensionscheme under section 80CCD(I)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by taxpayer to pension scheme under section 80CCD(I)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by taxpayer to pension scheme under section 80CCD (1)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by taxpayer to pensionscheme under section 80CCD (1)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by taxpayer to pension scheme under section 80CCD(1)")) {
      controller.grossAmountSection80.add(controller.texts[index + 1]);
      controller.deductAmountSection80.add(controller.texts[index + 2]);
      debugPrint(
          "--------------under section 80CCD(1)----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("8OC, 8oCCC and 80CCD(1)") ||
        controller.texts[index]!.contains("80C, 80CCC and 80CCD(1)") ||
        controller.texts[index]!.contains("8OC, 8oCCC and 8OCCD()") ||
        controller.texts[index]!.contains("8OC, 8OCCC and 8OCCD(1)") ||
        controller.texts[index]!.contains(
            "Total deduction under section 8OC, 8oCCC and 80CCD(1)") ||
        controller.texts[index]!.contains(
            "Total deduction under section 80C, 80CCC and 80CCD(1)") ||
        controller.texts[index]!.contains(
            "Total deduction under section 80C, 80CCC and 8OCCD(1)") ||
        controller.texts[index]!
            .contains("Total deduction under section 80C,80CCC and 80CCD(1)")) {
      controller.grossAmountSection80.add(controller.texts[index + 1]);
      controller.deductAmountSection80.add(controller.texts[index + 2]);
      debugPrint(
          "--------------80C, 80CCC and 80CCD(1)----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("80CCD(1B)") ||
        controller.texts[index]!.contains(
            "Deductions in respect of amount paid'deposited to notifiedpension scheme under section 80CCD(1B)") ||
        controller.texts[index]!.contains(
            "Deductions in respect of amount paid/deposited to notifiedpension scheme under section 80CCD(1B)") ||
        controller.texts[index]!.contains(
            "Deductions in respect of amount paid'deposited to notified pension scheme under section 80CCD (1B)") ||
        controller.texts[index]!.contains(
            "Deductions in respect of amount paid/deposited to notified pension scheme under section 80CCD (1B)") ||
        controller.texts[index]!.contains(
            "Deductions in respect of amount paid/deposited to notifiedpension scheme under section 80CCD(IB)") ||
        controller.texts[index]!.contains(
            "Deductions in respect of amount paid/deposited to notified pension scheme under section 80CCD(IB)")) {
      controller.grossAmountSection80.add(controller.texts[index + 1]);
      controller.deductAmountSection80.add(controller.texts[index + 1]);
      debugPrint(
          "--------------80CCD (1B)----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("8OCCD(2)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by Employer to pensionscheme under section 8OCCD(2)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by Employer to pensionscheme under section 8OCCD (2)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by Employer to pensionscheme under section 80CCD (2)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by Employer to pension scheme under section 80CCD (2)") ||
        controller.texts[index]!.contains(
            "Deduction in respect of contribution by Employer to pensionscheme under section 80CCD(2)")) {
      if (controller.grossAmountSection80.length <= 7) {
        controller.grossAmountSection80.add(controller.texts[index + 1]);
        controller.deductAmountSection80.add(controller.texts[index + 2]);
      }
      debugPrint(
          "--------------80CCD (2)----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("section80D") ||
        controller.texts[index]!.contains("section 80D") ||
        controller.texts[index]!.contains(
            "Deduction in respect of health insurance premia under section80D") ||
        controller.texts[index]!.contains(
            "Deduction in respect of health insurance premia under section8oD") ||
        controller.texts[index]!.contains(
            "Deduction in respect of health insurance premia under section 80D")) {
      if (controller.grossAmountSection80.length <= 7) {
        controller.grossAmountSection80.add(controller.texts[index + 1]);
        controller.deductAmountSection80.add(controller.texts[index + 2]);
      }
      // controller.grossAmountSection80.add(controller.texts[index + 1]);
      // controller.deductAmountSection80.add(controller.texts[index + 2]);
      debugPrint(
          "--------------80D----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("section 80E") ||
        controller.texts[index]!.contains("section80E") ||
        controller.texts[index]!.contains("80E") ||
        controller.texts[index]!.contains(
            "Deduction in respect of interest on loan taken for highereducation under section 80E") ||
        controller.texts[index]!.contains(
            "Deduction in respect of interest on loan taken for higher education under section 80E") ||
        controller.texts[index]!.contains(
            "Deduction in respect of interest on loan taken for highereducation under section 8OE") ||
        controller.texts[index]!.contains(
            "Deduction in respect of interest on loan taken for highereducation under section80E") ||
        controller.texts[index]!.contains(
            "Deduction in respect of interest on loan taken for higher education under section80E")) {
      if (controller.grossAmountSection80.length <= 7) {
        controller.grossAmountSection80.add(controller.texts[index + 1]);
        controller.deductAmountSection80.add(controller.texts[index + 2]);
      }
      // controller.grossAmountSection80.add(controller.texts[index + 1]);
      // controller.deductAmountSection80.add(controller.texts[index + 2]);
      debugPrint(
          "--------------80E----------${controller.grossAmountSection80} -- ${controller.deductAmountSection80}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("section 80G") ||
        controller.texts[index]!.contains("section80g") ||
        controller.texts[index]!.contains("80G") ||
        controller.texts[index]!.contains(
            "Total Deduction in respect of donations to certain funds,charitable institutions, etc.under section 80G") ||
        controller.texts[index]!.contains(
            "Total Deduction in respect of donations to certain funds, charitable institutions, etc. under section 80G")) {
      controller.section80G.clear();
      controller.section80G.add(controller.texts[index + 1]);
      controller.section80G.add(controller.texts[index + 2]);
      controller.section80G.add(controller.texts[index + 3]);
      debugPrint("--------------80G----------${controller.section80G}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains("section 80TTA") ||
        controller.texts[index]!.contains("section80TTA") ||
        controller.texts[index]!.contains("80TTA") ||
        controller.texts[index]!.contains(
            "Deduction in respect of interest on deposits in savings accountunder section 80TTA") ||
        controller.texts[index]!.contains(
            "Deduction in respect of interest on deposits in savings account under section 80TTA")) {
      controller.section80TTA.clear();
      controller.section80TTA.add(controller.texts[index + 1]);
      controller.section80TTA.add(controller.texts[index + 2]);
      controller.section80TTA.add(controller.texts[index + 3]);
      debugPrint("--------------80TTA----------${controller.section80TTA}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains(
            "Total of amount deductible under any other provision(s) ofChapter VI-A") ||
        controller.texts[index]!.contains(
            "Total of amount deductible under any other provision(s) of Chapter VI-A")) {
      controller.deductibleUnderAnyOtherProvisions.clear();
      controller.deductibleUnderAnyOtherProvisions
          .add(controller.texts[index + 1]);
      controller.deductibleUnderAnyOtherProvisions
          .add(controller.texts[index + 2]);
      controller.deductibleUnderAnyOtherProvisions
          .add(controller.texts[index + 3]);
      debugPrint(
          "--------------deductible under any other provisions------------${controller.deductibleUnderAnyOtherProvisions}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    if (controller.texts[index]!.contains(
            "Chapter VI-A[10(dJ+10(e)+10(1+10(g)+10(h)+100)+10()+100]") ||
        controller.texts[index]!
            .contains("[10(d)+10(e)+10(f)+10(g)+10(h)+10(i)+10(j)+10(l)]") ||
        controller.texts[index]!
            .contains("Aggregate of deductible amount under Chapter VI-A") ||
        controller.texts[index]!.contains(
            "Aggregate of deductible amount under Chapter VI-A [10(d)+10(e)+10(f)+10(g)+10(h)+10(i)+10(j)+10(l)]") ||
        controller.texts[index]!.contains(
            "Aggregate of deductible amount under Chapter VI-A [10(d)+10(e)+10(f)+10(g)+10(h)+10(i)+10(j)+10(l)]") ||
        controller.texts[index]!.contains(
            "Aggregate of deductible amount under Chapter VI-A[10(dJ+10(e)+10(1+10(g)+10(h)+100)+10()+100]") ||
        controller.texts[index]!.contains(
            "Aggregate of deductible amount under Chapter VI-A[10(d)+10(e)+10(f)+10(g)+10(h)+10(i)+10(j)+10(l)]")) {
      controller.deductibleAmountUnderChapterVIA.value =
          controller.texts[index + 1];
      debugPrint(
          "-------------[10(d)+10(e)+10(f)+10(g)+10(h)+10(i)+10(j)+10(l)]------------${controller.deductibleAmountUnderChapterVIA.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Total taxable income (9-11)") ||
        controller.texts[index]!.contains("(9-11)") ||
        controller.texts[index]!.contains("income (9-11)")) {
      if (controller.texts[index + 1] == "") {
        controller.totalTaxableIncome.value = controller.texts[index + 2];
      } else {
        controller.totalTaxableIncome.value = controller.texts[index + 1];
      }

      debugPrint(
          "-------------Total Taxable income----------${controller.totalTaxableIncome.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Tax on total income")) {
      if (controller.texts[index + 1] == "") {
        controller.taxOnTotalIncome.value = controller.texts[index + 2];
      } else {
        controller.taxOnTotalIncome.value = controller.texts[index + 1];
      }

      debugPrint(
          "-------------Tax on Total income----------${controller.taxOnTotalIncome.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!
        .contains("Rebate under section 87A, if applicable")) {
      if (controller.texts[index + 1] == "") {
        controller.section87A.value = controller.texts[index + 2];
      } else {
        controller.section87A.value = controller.texts[index + 1];
      }

      debugPrint(
          "-------------section 87A----------${controller.section87A.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Surcharge, wherever applicable")) {
      if (controller.texts[index + 1] == "") {
        controller.surchargeWhereverApplicable.value =
            controller.texts[index + 2];
      } else {
        controller.surchargeWhereverApplicable.value =
            controller.texts[index + 1];
      }

      debugPrint(
          "-------------Surcharge, wherever applicable----------${controller.surchargeWhereverApplicable.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Health and education cess")) {
      if (controller.texts[index + 1] == "") {
        if (controller.texts[index + 2] == "") {
          controller.healthAndEducationCess.value = controller.texts[index + 3];
        } else {
          controller.healthAndEducationCess.value = controller.texts[index + 2];
        }
      } else {
        controller.healthAndEducationCess.value = controller.texts[index + 1];
      }

      debugPrint(
          "-------------Health and education cess----------${controller.healthAndEducationCess.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Tax payable (13+15+16-14)") ||
        controller.texts[index]!.contains("Tax payable(13+15+16-14)")) {
      if (controller.texts[index + 1] == "") {
        controller.taxPayable.value = controller.texts[index + 2];
      } else {
        controller.taxPayable.value = controller.texts[index + 1];
      }

      debugPrint(
          "-------------Tax payable (13+15+16-14)----------${controller.taxPayable.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!
        .contains("Less: Relief under section 89 (attach details)")) {
      if (controller.texts[index + 1] == "") {
        controller.section89.value = controller.texts[index + 2];
      } else {
        controller.section89.value = controller.texts[index + 1];
      }

      debugPrint(
          "-------------section 89----------${controller.section89.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }
    if (controller.texts[index]!.contains("Net tax payable(17-18)") ||
        controller.texts[index]!.contains("Net tax payable (17-18)")) {
      if (controller.texts[index + 1] == "") {
        controller.netTaxPayable.value = controller.texts[index + 2];
      } else {
        controller.netTaxPayable.value = controller.texts[index + 1];
      }

      debugPrint(
          "-------------Net tax payable----------${controller.netTaxPayable.value}");
      // txtleavesalary.text = controller.leaveSalary.value;
    }

    debugPrint("${controller.texts[index]}");
  }
}

/*

Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    //
    children: List.generate(controller.texts.length, (index) {
      if (controller.texts[index]!
          .contains("Amount of tax deposited")) {
        controller.q1.clear();
        controller.q2.clear();
        controller.q3.clear();
        controller.q4.clear();
        controller.total.clear();

        int scannedIndex = index + 5;
        for (int i = index + 1; i < scannedIndex + 1; i++) {
          controller.q1.add(controller.texts[i]);
          debugPrint(
              "-----------------Q1--------${controller.q1}");
        }

        for (int k = scannedIndex + 1;
            k < scannedIndex + 6;
            k++) {
          controller.q2.add(controller.texts[k]);
          debugPrint(
              "-----------------Q2--------${controller.q2}");
        }

        for (int k = scannedIndex + 6;
            k < scannedIndex + 11;
            k++) {
          controller.q3.add(controller.texts[k]);
          debugPrint(
              "-----------------Q3--------${controller.q3}");
        }

        for (int k = scannedIndex + 11;
            k < scannedIndex + 16;
            k++) {
          controller.q4.add(controller.texts[k]);
          debugPrint(
              "-----------------Q4--------${controller.q4}");
        }

        for (int k = scannedIndex + 16;
            k < scannedIndex + 21;
            k++) {
          controller.total.add(controller.texts[k]);
          debugPrint(
              "-----------------total--------${controller.total}");
        }


        txtQ1rn.text = controller.q1[1];
        txtQ1apc.text = controller.q1[2];
        txtQ1tDeducted.text = controller.q1[3];
        txtQ1tDeposited.text = controller.q1[4];

        txtQ2rn.text = controller.q2[1];
        txtQ2apc.text = controller.q2[2];
        txtQ2tDeducted.text = controller.q2[3];
        txtQ2tDeposited.text = controller.q2[4];

        txtQ3rn.text = controller.q3[1];
        txtQ3apc.text = controller.q3[2];
        txtQ3tDeducted.text = controller.q3[3];
        txtQ3tDeposited.text = controller.q3[4];

        txtQ4rn.text = controller.q4[1];
        txtQ4apc.text = controller.q4[2];
        txtQ4tDeducted.text = controller.q4[3];
        txtQ4tDeposited.text = controller.q4[4];

        txtTotalapc.text = controller.total[2];
        txtTotaltDeducted.text = controller.total[3];
        txtTotaltDeposited.text = controller.total[4];
      }

      if (controller.texts[index]!.contains("10(5)")) {
        controller.travelAllowance.value =
            controller.texts[index + 1];
        debugPrint(
            "--------------travel allowance----------${controller.travelAllowance.value}");
        txttravel.text = controller.travelAllowance.value;
      }

      if (controller.texts[index]!.contains("10(13A)")) {
        controller.houseRent.value = controller.texts[index + 1];
        debugPrint(
            "--------------house rent----------${controller.houseRent.value}");
        txthouse.text = controller.houseRent.value;
      }

      if (controller.texts[index]!.contains("10(10)")) {
        controller.deathCum.value = controller.texts[index + 1];
        debugPrint(
            "--------------Death-cum-retirement----------${controller.deathCum.value}");
        txtdeath.text = controller.deathCum.value;
      }

      if (controller.texts[index]!.contains("10(10A)")) {
        controller.pension.value = controller.texts[index + 1];
        debugPrint(
            "--------------pension----------${controller.pension.value}");
        txtpension.text = controller.pension.value;
      }

      if (controller.texts[index]!.contains("10(10AA)")) {
        controller.leaveSalary.value =
            controller.texts[index + 1];
        debugPrint(
            "--------------leave salary----------${controller.leaveSalary.value}");
        txtleavesalary.text = controller.leaveSalary.value;
      }

      if (controller.texts[index] == "Total" ||
          controller.texts[index] == "total") {
        controller.grossSalary.value =
            controller.texts[index + 1];
        debugPrint(
            "---------------gross salary---------${controller.grossSalary.value}");
        txtgross.text = controller.grossSalary.value;
      }

      return Text("$index ==> ${controller.texts[index]}");
    }),
  ),
),


 */

// SingleChildScrollView(
//     child: Column(
//       children: [
//         Container(
//           padding: EdgeInsets.all(30.sp),
//           child: SelectableText("${controller.texts}"),
//         ),
//       ],
//     ),
//   ),
