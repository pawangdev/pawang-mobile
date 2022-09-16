import 'package:get/get.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';

class ScanReceipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ScanReceipeController>(ScanReceipeController());
  }
}
