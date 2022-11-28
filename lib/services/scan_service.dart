import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/models/scan_receipt_model.dart';

class ScanService {
  // GETTING THE IMAGE FROM GALLERY AND CAMERA
  Future<XFile> getImage(bool isFromGal) async {
    XFile? file;

    if (isFromGal) {
      try {
        XFile? image = await ImagePicker()
            .pickImage(source: ImageSource.gallery, imageQuality: 50);
        file = image;
      } catch (e) {
        print(e);
      }
    } else {
      try {
        XFile? image = await ImagePicker()
            .pickImage(source: ImageSource.camera, imageQuality: 50);
        file = image;
      } catch (e) {
        print(e);
      }
    }

    return file!;
  }

  static Future<ScanReceiptModel?> uploadReceipt(File inputReceipt) async {
    var request = http.MultipartRequest("POST", Uri.parse(baseURLOCR));

    request.files.add(
      http.MultipartFile(
        'file',
        File(inputReceipt.path).readAsBytes().asStream(),
        File(inputReceipt.path).lengthSync(),
        filename: inputReceipt.path.split("/").last,
      ),
    );

    try {
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);
      final responseJson =
          ScanReceiptModel.fromJson(jsonDecode(responseData.body));

      return responseJson;
    } catch (e) {
      rethrow;
    }
  }
}
