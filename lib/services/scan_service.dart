import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'dart:io' as file;
import 'package:pawang_mobile/constants/theme.dart';

class ScanService {
  XFile? _image;

  final ImagePicker _picker = ImagePicker();

  // GETTING THE IMAGE FROM GALLERY AND CAMERA
  getImage(bool is_fromGal) async {
    XFile? image;

    if (is_fromGal) {
      try {
        image = await _picker.pickImage(source: ImageSource.gallery);
        _image = image;
      } catch (e) {
        print(e);
      }
    } else {
      try {
        image = await _picker.pickImage(source: ImageSource.camera);
        _image = image;
      } catch (e) {
        print(e);
      }
    }

    return _image;
  }

  // CROPPING THE IMAGE
  Future<file.File?> cropImage(XFile? image) async {
    file.File? temp_img = file.File(image!.path);

    temp_img = await ImageCropper().cropImage(
        sourcePath: image.path,
        androidUiSettings: const AndroidUiSettings(
          toolbarTitle: "Potong Bagian Total Belanja Saja",
          toolbarColor: kPrimary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ));
    try {
      if (temp_img != null) {
        //setState(() {
        _image = _image;
        //});
        // final response = uploadImage(inputImage);
        // print(response);
      }
    } catch (e) {
      throw Exception(e);
    }

    return temp_img;
  }

  // UPLOADING IMAGE
  uploadImage(file.File inputImage) async {
    var request = http.MultipartRequest("POST", Uri.parse(baseURLOCR));

    request.files.add(http.MultipartFile(
        'file',
        file.File(inputImage.path).readAsBytes().asStream(),
        file.File(inputImage.path).lengthSync(),
        filename: inputImage.path.split("/").last));

    try {
      final response = await request.send();
      final responsed = await http.Response.fromStream(response);
      final resJson = jsonDecode(responsed.body);

      return getAmount(resJson);
    } catch (e) {
      print(e);
    }
  }

  // GETTING THE AMOUNT FROM THE RECEIPT
  getAmount(dynamic response) {
    try {
      if (response['amounts'].runtimeType == String) {
        return response['amounts'].replaceAll(RegExp('[^A-Za-z0-9]'), '');
      } else {
        return response['amounts'][0].replaceAll(RegExp('[^A-Za-z0-9]'), '');
      }
    } catch (e) {
      print(e);
    }
  }
}
