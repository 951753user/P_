import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/screen/file_itr/fileItrController.dart';

class ShareDetailsSection extends StatefulWidget {
  const ShareDetailsSection({super.key});

  @override
  State<ShareDetailsSection> createState() => _ShareDetailsSectionState();
}

class _ShareDetailsSectionState extends State<ShareDetailsSection>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  FileItrController controller = Get.put(FileItrController());

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    controller.collapse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.sp),
        border: Border.all(width: 2, color: Colors.grey.shade200),
      ),
      child: Obx(
        () => ExpansionTile(
          key: Key(controller.key.value.toString()),
          title: Row(
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: Image.asset('assets/images/menu.png',
                    color: const Color(0xff2A4965)),
              ),
              SizedBox(
                width: 28.w,
              ),
              SizedBox(
                // width: 200.w,
                child: Text(
                  "Share Details",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          onExpansionChanged: (bool expanded) {
            if (controller.customTileExpanded.value) {
              animationController?.reverse(from: 0.5);
            } else {
              animationController?.forward(from: 0.0);
            }
            controller.customTileExpanded.value = expanded;
          },
          trailing: RotationTransition(
            turns: Tween(begin: 0.0, end: 0.5).animate(animationController!),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 18.sp,
              color: const Color(0xff45BA1C),
            ),
          ),
          children: [
            Container(
              padding: EdgeInsets.all(15.sp),
              // height: 100.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do You Want To Share More Details?",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          if (controller.customTileExpanded.value) {
                            animationController?.reverse(from: 0.5);
                          } else {
                            animationController?.forward(from: 0.0);
                          }
                          controller.customTileExpanded.value = false;
                          controller.collapse();
                        },
                        minWidth: 80.w,
                        height: 40.h,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        color: Colors.blueGrey.shade500,
                        child: Text(
                          "No",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Choose Your File to Upload",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: const Text("Choose Upload File"),
                                actions: [
                                  MaterialButton(
                                    onPressed: () async {
                                      controller.pickFile();
                                    },
                                    minWidth: 80.w,
                                    height: 40.h,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    color: Colors.blueGrey.shade500,
                                    child: Obx(
                                      ()=> controller.fileUploadLoading.value
                                          ? const CircularProgressIndicator(
                                              color: Colors.white,
                                            )
                                          : Text(
                                              "choose",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        minWidth: 80.w,
                        height: 40.h,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        color: Colors.blueGrey.shade500,
                        child: Text(
                          "Yes",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
