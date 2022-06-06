import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io' as file;
import 'package:pawang_mobile/constants/theme.dart';

class ScanService {
  late InputImage inputImage;
  late http.Response response;
  // GETTING THE IMAGE FROM GALLERY AND CAMERA
  getImage(bool is_fromGal) async {
    late final XFile? image;
    final ImagePicker _picker = ImagePicker();

    if (is_fromGal) {
      try {
        image = await _picker.pickImage(source: ImageSource.gallery);
      } catch (e) {}
    } else {
      try {
        image = await _picker.pickImage(source: ImageSource.camera);
      } catch (e) {}
    }
    inputImage = InputImage.fromFilePath(image!.path);
    cropImage(image);

    return image;
  }

  // CROPPING THE IMAGE
  Future cropImage(XFile? image) async {
    file.File? temp_img = file.File(image!.path);

    temp_img = await ImageCropper().cropImage(
      sourcePath: image.path,
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: "Potong Bagian Total",
        toolbarColor: kPrimary,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      )
    );
    try {
      if (temp_img != null) {
        //setState(() {
        inputImage = InputImage.fromFile(temp_img);
        //});
        final response = uploadImage(inputImage);
      }
    } catch (e) {}
  }

  // UPLOADING IMAGE
  uploadImage(InputImage inputImage) async {
    String message = "";
    String temp_amount = "";
    final request =
        http.MultipartRequest("POST", Uri.parse("http://localhost/uploader"));
    final headers = {"Content-type": "multipart/form-data"};

    request.files.add(http.MultipartFile(
        'file',
        file.File(inputImage.filePath!).readAsBytes().asStream(),
        file.File(inputImage.filePath!).lengthSync(),
        filename: inputImage.filePath!.split("/").last));

    request.headers.addAll(headers);

    try {
      final response = await request.send();
      http.Response res = await http.Response.fromStream(response);
      final resJson = jsonDecode(res.body);

      return resJson;
    } catch (e) {}
  }

  // GETTING THE RESPONSE
  getResponse() {
    try {
      return response;
    } catch (e) {}
  }

  // GETTING THE AMOUNT FROM THE RECEIPT
  getAmount(dynamic response) {
    try {
      if (response['message'] == "1") {
        String amount =
            response['amounts'].take(1).replaceAll(RegExp('[^A-Za-z0-9]'), '');
        return amount;
        //setState(() {
        //nominal = amount;
        //imageFilePath = _image!.path.toString();
        //});
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   content: Text("Berhasil mendapatkan total belanja"),
        //   backgroundColor: kSuccess,
        // ));
      } else {
        return "";
        // setState(() {
        //   nominal = '';
        //   imageFilePath = '';
        //   _image = null;
        // });
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   content: Text("Pastikan gambar yang dicrop mengandung total"),
        //   backgroundColor: kError,
        // ));
      }
    } catch (e) {
      // setState(() {
      //   nominal = '';
      //   imageFilePath = '';
      //   _image = null;
      // });
    }
  }
}
