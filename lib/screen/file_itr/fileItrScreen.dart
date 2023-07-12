// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:payment_app/routes.dart';
import 'package:payment_app/screen/file_itr/fileItrController.dart';
import 'package:payment_app/screen/file_itr/widgets/share_details.dart';

class FileItrScreen extends GetView<FileItrController> {
  const FileItrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppbar("File ITR", onBackTap: () {
        Get.back();
      }),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Button(
                'personal details',
                'Personal Details',
                ontap: () {
                  Get.toNamed(AppPages.personalDetails);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Button(
                'bank details',
                'Bank Details',
                ontap: () {
                  Get.toNamed(AppPages.bankDetails);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Button(
                'file',
                'Upload Form 16 Document',
                ontap: () {
                  Get.toNamed(AppPages.pickimg);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              const ShareDetailsSection(),
              SizedBox(
                height: 16.h,
              ),
              Button(
                'details sequired',
                'Details Required',
                ontap: () {
                  showToast("Details Required");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Button(String img, String title, {Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 70.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.sp),
          border: Border.all(width: 2, color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 40.h,
              width: 40.w,
              child: Image.asset('assets/images/$img.png',
                  color: const Color(0xff2A4965)),
            ),
            SizedBox(
              width: 28.w,
            ),
            SizedBox(
              width: 200.w,
              child: Text(
                title,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 20.sp),
                maxLines: 2,
                overflow: TextOverflow.visible,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: const Color(0xff45BA1C),
              size: 18.sp,
            )
          ],
        ),
      ),
    );
  }
}


// Container(
//   // height: 70.h,
//   width: double.infinity,
//   padding: EdgeInsets.symmetric(horizontal: 5.w),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(7.sp),
//     border: Border.all(width: 2, color: Colors.grey.shade200),
//   ),
//   child: Obx(
//     () => ExpansionTile(
//       key: Key(controller.key.value.toString()),
//       title: Row(
//         children: [
//           SizedBox(
//             height: 40.h,
//             width: 40.w,
//             child: Image.asset('assets/images/menu.png',
//                 color: const Color(0xff2A4965)),
//           ),
//           SizedBox(
//             width: 28.w,
//           ),
//           SizedBox(
//             // width: 200.w,
//             child: Text(
//               "Share Details",
//               style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20.sp,
//                   color: Colors.black),
//               maxLines: 2,
//               overflow: TextOverflow.visible,
//             ),
//           ),
//         ],
//       ),
//       onExpansionChanged: (bool expanded) {
//         controller.customTileExpanded.value = expanded;
//         if (controller.customTileExpanded.value) {
//           controller.iconBegin.value = 0;
//           controller.iconEnd.value = 0.25;
//         } else {
//           controller.iconBegin.value = 0.25;
//           controller.iconEnd.value = 0;
//         }
//       },
//       trailing:
//           // controller.customTileExpanded.value
//           //     ?
//           Icon(
//         Icons.arrow_forward_ios,
//         size: 18.sp,
//         color: const Color(0xff45BA1C),
//       ).animate().rotate(
//                 begin: controller.iconBegin.value,
//                 end: controller.iconEnd.value,
//                 duration: const Duration(seconds: 1),
//               ),
//       // Icon(
//       //     Icons.keyboard_arrow_down,
//       //     color: const Color(0xff45BA1C),
//       //     size: 28.sp,
//       //   )
//       // : Icon(
//       //     Icons.arrow_forward_ios,
//       //     size: 18.sp,
//       //     color: const Color(0xff45BA1C),
//       //   ).animate().rotate(
//       //       begin: 0.25,
//       //       end: 0,
//       //       duration: const Duration(seconds: 1),
//       //     ),
//       children: [
//         Container(
//           padding: EdgeInsets.all(15.sp),
//           // height: 100.h,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Do You Want To Share More Details?",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16.sp),
//               ),
//               SizedBox(
//                 height: 16.h,
//               ),
//               Row(
//                 children: [
//                   MaterialButton(
//                     onPressed: () {
//                       controller.customTileExpanded.value =
//                           false;
//                       controller.collapse();
//                     },
//                     minWidth: 80.w,
//                     height: 40.h,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14.0),
//                     ),
//                     color: Colors.blueGrey.shade500,
//                     child: Text(
//                       "No",
//                       style: GoogleFonts.poppins(
//                           fontSize: 16.sp,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text(
//                               "Choose Your File to Upload",
//                               style: TextStyle(
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             content: const Text(
//                                 "Choose Upload File"),
//                             actions: [
//                               MaterialButton(
//                                 onPressed: () async {
//                                   controller.pickFile();
//                                 },
//                                 minWidth: 80.w,
//                                 height: 40.h,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.circular(
//                                           14.0),
//                                 ),
//                                 color: Colors.blueGrey.shade500,
//                                 child: Text(
//                                   "choose",
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 16.sp,
//                                       color: Colors.white,
//                                       fontWeight:
//                                           FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     minWidth: 80.w,
//                     height: 40.h,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(14.0),
//                     ),
//                     color: Colors.blueGrey.shade500,
//                     child: Text(
//                       "Yes",
//                       style: GoogleFonts.poppins(
//                           fontSize: 16.sp,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     ),
//   ),
// ),