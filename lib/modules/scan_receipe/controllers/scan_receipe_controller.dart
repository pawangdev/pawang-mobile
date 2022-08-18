import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawang_mobile/services/scan_service.dart';

class ScanReceipeController extends GetxController {
  XFile? imageFilePath;

  Future<void> scanReceipt(bool isFromGal) async {
    // GET AND CROP THE IMAGE
    try {
      final getImage = await ScanService().getImage(isFromGal);
      if (getImage != null) {
        imageFilePath = getImage;

        print(imageFilePath?.path.toString());
      }
    } catch (e) {}
    update();
  }

  Future<void> resetScan() async {
    imageFilePath = null;
    update();
  }
}
