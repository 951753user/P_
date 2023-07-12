import 'package:payment_app/main.dart';

class Settings{
  static bool get userLoggedIn => storage.read('login');
  static set setUserLogIn(bool value) =>
      storage.write('login', value);


  static bool get bankDetails => storage.read('bankDetails');
  static set setBankDetails(bool value) =>
      storage.write('bankDetails', value);


  static String get panNo => storage.read('panNo');
  static set setPanNo(String value) =>
      storage.write('panNo', value);

  static String get password => storage.read('password');
  static set setPassword(String value) =>
      storage.write('password', value);



}