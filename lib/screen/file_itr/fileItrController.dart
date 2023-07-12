// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/helper/app_configuration.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:payment_app/services/service_configuration.dart';

class FileItrController extends GetxController {
  RxBool customTileExpanded = false.obs;

  // final GlobalKey<AppExpansionTileState> expansion = GlobalKey();
  RxInt key = 0.obs;

  RxBool fileUploadLoading = false.obs;

  RxDouble iconBegin = 0.0.obs;
  RxDouble iconEnd = 0.0.obs;

  collapse() {
    RxInt newKey = 0.obs;
    do {
      key.value = Random().nextInt(10000);
    } while (newKey.value == key.value);
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'xlsx', 'doc'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      showToast(file.path);

      uploadJsonFile(file.path);
    } else {}
  }

  Future<Uint8List> fileToUint8List(String path) async {
    final file = File(path);
    final bytes = await file.readAsBytes();
    return Uint8List.fromList(bytes);
  }

  uploadJsonFile(String path) async {
    final filePath = path;
    final fileContent = await fileToUint8List(filePath);
    final fileName = basename(path);

    if (fileContent.isNotEmpty) {
      fileUploadLoading.value = true;
      try {
        // final jsonData = jsonDecode(fileContent);
        fileUploadLoading.value = true;
        var request = http.MultipartRequest(
            "POST",
            Uri.parse(
                "${ServiceConfiguration.baseUrl}${ServiceConfiguration.shareDetails}"));

        request.fields['sharesDocument'] = 'sharesDocument';

        //await rootBundle.load("assets/872783340190722.json")

        var jsonFile = http.MultipartFile.fromBytes(
            'sharesDocument', fileContent,
            filename: fileName);

        request.files.add(jsonFile);

        //responce

        var responce = await request.send();
        var responceData = await responce.stream.toBytes();
        var result = String.fromCharCodes(responceData);

        if (responce.statusCode == 200) {
          showToast("Success");
          debugPrint("shareDetails Responce := ${responce.headers}");
          fileUploadLoading.value = false;
          Get.back();
        }

        debugPrint(result);
        // Do something with the JSON data...
      } catch (e) {
        debugPrint('shareDetails Responce := $e');
        fileUploadLoading.value = false;
      }
    }
  }

  @override
  void onInit() {
    collapse();
    super.onInit();
  }
}
