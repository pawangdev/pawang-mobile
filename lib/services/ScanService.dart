import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ScanService {
  // UPLOADING IMAGE
  static Future uploadImage(InputImage inputImage) async {
    Response response;
    try {
      FormData formData = new FormData.fromMap({
        "image": await MultipartFile.fromFile(inputImage.filePath!,
            filename: "struk-belanja")
      });

      response =
          await Dio().put("http://127.0.0.1:8080/uploader", data: formData);

      if (response.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }
    } on DioError catch (e) {
      print(e.response);
    } catch (e) {}
  }
}
  // Future uploadImage(XFile image) async {
  //   var request = http.MultipartRequest(
  //       "POST", Uri.parse("http://127.0.0.1:8080/scan-struk"));

  //   request.headers['Authorization'] = "";

  //   var picture = http.MultipartFile.fromBytes(
  //       'image', (await rootBundle.load(image.path)).buffer.asUint8List());

  //   request.files.add(picture);

  //   var response = await request.send();

  //   var responseData = await response.stream.toBytes();

  //   // var result = String.fromCharCode(int.parse(responseData));
  // }
