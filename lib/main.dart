import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  if (storage.read("login") == null) {
    storage.write('login', false);
  }

  if (storage.read('bankDetails') == null) {
    storage.write('bankDetails', false);
  }

  runApp(const MyApp());
}

String userPanCardNo = "";

final storage = GetStorage();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff0C2944),
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(360, 784),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: AppPages.splash,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Color(0xff2A4965),
            ),
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        );
      },
    );
  }
}
