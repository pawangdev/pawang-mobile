import 'package:get/get.dart';
import 'package:pawang_mobile/models/reminder_model.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/modules/reminder/services/reminder_service.dart';
import 'package:pawang_mobile/modules/transaction/services/transaction_service.dart';
import 'package:pawang_mobile/modules/wallet/services/wallet_service.dart';
import 'package:pawang_mobile/services/user_service.dart';

class DashboardController extends GetxController {
  // Services
  final walletService = Get.put(WalletService());
  final reminderService = Get.put(ReminderService());
  final transactionService = Get.put(TransactionService());
  final userService = Get.put(UserService());
  final selectedWallets = 0.obs;

  var wallets = <WalletDataModel>[].obs;
  var transactions = <TransactionDataModel>[].obs;
  var reminders = <ReminderDataModel>[].obs;
  var user = UserProfileDataModel(
          id: 0,
          name: "",
          email: "",
          phone: "",
          gender: "",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          googleId: "",
          imageProfile: "",
          onesignalId: "")
      .obs;

  @override
  void onInit() {
    getUserProfile();
    getWallets();
    getTransactions();
    getReminders();
    super.onInit();
  }

  Future<void> getUserProfile() async {
    var userProfileResponse = await userService.userProfile();
    if (userProfileResponse != null) {
      user.update((user) {
        user!.id = userProfileResponse.id;
        user.name = userProfileResponse.name;
        user.email = userProfileResponse.email;
        user.phone = userProfileResponse.phone;
        user.gender = userProfileResponse.gender;
      });
    }
  }

  Future<void> getWallets() async {
    try {
      final response = await walletService.getWallets();
      if (response != null) {
        wallets.assignAll(response);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getTransactions() async {
    try {
      final response = await transactionService.getTransactions();
      if (response != null) {
        transactions.assignAll(response);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getReminders() async {
    try {
      final response = await reminderService.getReminders();
      if (response != null) {
        reminders.assignAll(response);
      }
    } catch (e) {
      print(e);
    }
  }
}
