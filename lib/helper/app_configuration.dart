import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:payment_app/helper/colors.dart';

checkConnection() async {
  return await InternetConnectionChecker().hasConnection;
}

currencyFormat(int value) {
  return NumberFormat.simpleCurrency(locale: 'en-IN', decimalDigits: 0)
      .format(value);
}

showToast(String message, {bool isSuccess = false}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: kprimaryColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

AppBar customeAppbar(String title, {Function()? onBackTap}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
    toolbarHeight: 100.h,
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: onBackTap,
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Color(0xff2A4965),
      ),
    ),
    title: Text(
      title,
      style: TextStyle(
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
  );
}
