import 'package:get/get.dart';
import 'package:payment_app/screen/add_bank/add_bank.dart';
import 'package:payment_app/screen/add_bank/add_bank_controller.dart';
import 'package:payment_app/screen/bank_details/bankDetailsController.dart';
import 'package:payment_app/screen/bank_details/bankDetailsScreen.dart';
import 'package:payment_app/screen/file_itr/fileItrScreen.dart';
import 'package:payment_app/screen/home_screen/home_screen.dart';
import 'package:payment_app/screen/home_screen/home_controller.dart';
import 'package:payment_app/screen/hra_calc/hra_calculator.dart';
import 'package:payment_app/screen/hra_calc/hra_calculator_controller.dart';
import 'package:payment_app/screen/loginScreen/login_Screen.dart';
import 'package:payment_app/screen/loginScreen/login_controller.dart';
import 'package:payment_app/screen/register/registerController.dart';
import 'package:payment_app/screen/register/registerScreen.dart';
import 'package:payment_app/screen/payment_screen/paymentController.dart';
import 'package:payment_app/screen/payment_screen/paymentScreen.dart';
import 'package:payment_app/screen/pandetail/panDetailsController.dart';
import 'package:payment_app/screen/pandetail/panDetailsScreen.dart';
import 'package:payment_app/screen/personal_details/personalDetailsController.dart';
import 'package:payment_app/screen/personal_details/personalDetailsScreen.dart';
import 'package:payment_app/screen/personal_details/widget/edit_personal_details.dart';
import 'package:payment_app/screen/pick_document/pickDocument.dart';
import 'package:payment_app/screen/pick_document/pick_document_controller.dart';
import 'package:payment_app/screen/signup_Screen/signup_controller.dart';
import 'package:payment_app/screen/signup_Screen/signup_screen.dart';
import 'package:payment_app/screen/splash_screen.dart';

import 'screen/file_itr/fileItrController.dart';

class AppPages {
  AppPages._();

  static String splash = '/';
  static String signup = '/signUp';
  static String login = '/login';
  static String home = '/home';
  static String fileItr = '/fileItr';
  static String personalDetails = '/PersonalDetails';
  static String editPersonalDetails = '/editPersonalDetails';
  static String bankDetails = '/bankDetails';
  static String payment = '/payment';
  static String hracalc = '/hracalc';
  static String addbank = '/addbank';
  static String register = '/register';
  static String pandetail = '/pandetail';
  static String pickimg = '/pickimg';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
      binding: BindingsBuilder.put(() => SignupController()),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder.put(() => LoginController()),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder.put(() => Homecontroller()),
    ),
    GetPage(
      name: fileItr,
      page: () => const FileItrScreen(),
      binding: BindingsBuilder.put(() => FileItrController()),
    ),
    GetPage(
      name: personalDetails,
      page: () => const PersonalDetailsScreen(),
      binding: BindingsBuilder.put(() => PersonalDetailsController()),
    ),
    GetPage(
      name: editPersonalDetails,
      page: () => const EditPersonalDetails(),
    ),
    GetPage(
      name: bankDetails,
      page: () => const BankDetailsScreen(),
      binding: BindingsBuilder.put(() => BankDetailsController()),
    ),
    GetPage(
      name: payment,
      page: () => const PaymentScreen(),
      binding: BindingsBuilder.put(() => PaymentController()),
    ),
    GetPage(
      name: hracalc,
      page: () => const HraCalculator(),
      binding: BindingsBuilder.put(() => HraCalculatorController()),
    ),
    GetPage(
      name: addbank,
      page: () => const AddBankScreen(),
      binding: BindingsBuilder.put(() => AddBankController()),
    ),
    GetPage(
      name: register,
      page: () => const RegisterScreen(),
      binding: BindingsBuilder.put(() => RegisterController()),
    ),
    GetPage(
      name: pandetail,
      page: () => const PanDetailsScreen(),
      binding: BindingsBuilder.put(() => PanDetailsController()),
    ),
    GetPage(
        name: pickimg,
        page: () => const PickDocument(),
        binding: BindingsBuilder.put(() => PickDocumentController())),
  ];
}
