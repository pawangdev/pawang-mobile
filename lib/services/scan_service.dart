import 'package:image_picker/image_picker.dart';

class ScanService {
  // GETTING THE IMAGE FROM GALLERY AND CAMERA
  Future<XFile> getImage(bool isFromGal) async {
    XFile? file;

    if (isFromGal) {
      try {
        XFile? image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        file = image;
      } catch (e) {
        print(e);
      }
    } else {
      try {
        XFile? image =
            await ImagePicker().pickImage(source: ImageSource.camera);
        file = image;
      } catch (e) {
        print(e);
      }
    }

    return file!;
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
