// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay/pay.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/helper/colors.dart';
import 'package:payment_app/screen/payment_screen/paymentController.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("Payment Method",onBackTap: (){
        Get.back();
      }),
      body: Form(
        key: controller.formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Container(
            //   height: 100.h,
            //   width: double.infinity,
            //   decoration: const BoxDecoration(
            //     color: Color(0xff2A4965),
            //     borderRadius: BorderRadius.only(
            //       bottomLeft: Radius.circular(30),
            //       bottomRight: Radius.circular(30),
            //     ),
            //   ),
            //   alignment: Alignment.center,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       IconButton(
            //           onPressed: () {
            //             Get.back();
            //           },
            //           icon: const Icon(
            //             Icons.arrow_back_ios_new,
            //             color: Colors.white,
            //           )),
            //       Text(
            //         "Payment Method",
            //         style: GoogleFonts.poppins(
            //             fontWeight: FontWeight.w600,
            //             fontSize: 21.sp,
            //             color: Colors.white),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.only(right: 20),
            //         child: InkWell(
            //           onTap: () {},
            //           child: SizedBox(
            //             height: 25.h,
            //             width: 25.w,
            //             child: Image.asset('assets/images/notification.png'),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.all(17.sp),
              child: Text(
                "Add  your payment  method",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  // SizedBox(
                  //   width: 15.w,
                  // ),
                  // Container(
                  //   height: 70.h,
                  //   width: 120.w,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(7),
                  //     border: Border.all(
                  //         width: 2, color: Colors.grey.shade200),
                  //   ),
                  //   padding: const EdgeInsets.all(7),
                  //   child:
                  // ),
                  FutureBuilder<PaymentConfiguration>(
                    future: controller.googlePayConfigFuture,
                    builder: (context, snapshot) => snapshot.hasData
                        ? Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: 15.h, left: 15.w),
                              child: GooglePayButton(
                                paymentConfiguration: snapshot.data!,
                                paymentItems: const [
                                  PaymentItem(
                                    label: 'Total',
                                    amount: "1",
                                    status: PaymentItemStatus.final_price,
                                  )
                                ],
                                type: GooglePayButtonType.pay,
                                margin: EdgeInsets.only(top: 15.h),
                                onPaymentResult: controller.onGooglePayResult,
                                loadingIndicator: const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xff2A4965),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 70.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.sp),
                        border:
                            Border.all(width: 2, color: Colors.grey.shade200),
                      ),
                      padding: const EdgeInsets.all(7),
                      child: Image.asset('assets/images/phonepe.png'),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 70.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.sp),
                        border:
                            Border.all(width: 2, color: Colors.grey.shade200),
                      ),
                      padding: EdgeInsets.all(7.sp),
                      child: Image.asset('assets/images/visa.png'),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsets.all(17.sp),
              child: Text(
                "Fill your card info",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Text(
                "Card Number",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 6.h),
              child: TextFormField(
                controller: controller.txtCardNumber,
                textInputAction: TextInputAction.next,
                cursorColor: kprimaryLightColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.sp)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: kprimaryLightColor, width: 2.0),
                  ),
                  hintText: 'XXXX XXXX XXXX X123',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffA4A4A4),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Card NO.\nEx. XXXX XXXX XXXX X123';
                  }
                  return null;
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 13.h),
              child: Text(
                "Card Holder Name",
                style: GoogleFonts.poppins(
                    fontSize: 15.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17.w, right: 17.w, top: 6.h),
              child: TextFormField(
                controller: controller.txtCardHolderName,
                textInputAction: TextInputAction.next,
                cursorColor: kprimaryLightColor,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.sp)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: kprimaryLightColor, width: 2.0),
                  ),
                  hintText: 'Full Name',
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffA4A4A4),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Card Holder Name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 17.w),
                      child: Text(
                        "Expire",
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 17.w, right: 17.w, top: 6.h),
                      child: SizedBox(
                        width: 135.w,
                        child: TextFormField(
                          controller: controller.txtExpire,
                          textInputAction: TextInputAction.next,
                          cursorColor: kprimaryLightColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.sp)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kprimaryLightColor, width: 2.0),
                            ),
                            hintText: '05/11',
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffA4A4A4),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Expire Date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 17.w),
                      child: Text(
                        "CVV",
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 17.w, right: 17.w, top: 6.h),
                      child: SizedBox(
                        width: 135.w,
                        child: TextFormField(
                          controller: controller.txtCvv,
                          textInputAction: TextInputAction.next,
                          cursorColor: kprimaryLightColor,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.sp)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: kprimaryLightColor, width: 2.0),
                            ),
                            hintText: '...',
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w900,
                              color: const Color(0xffA4A4A4),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter CVV';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),

            // const Spacer(),
            SizedBox(
              height: 20.h,
            ),

            Align(
              alignment: Alignment.center,
              child: MaterialButton(
                onPressed: () {
                  controller.validate(
                      controller.txtCardNumber.text,
                      controller.txtCardHolderName.text,
                      controller.txtExpire.text,
                      controller.txtCvv.text);
                },
                minWidth: 195.w,
                height: 47.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                ),
                color: const Color(0xff2A4965),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Confirm Payment",
                        style: GoogleFonts.poppins(
                            fontSize: 18.sp, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
