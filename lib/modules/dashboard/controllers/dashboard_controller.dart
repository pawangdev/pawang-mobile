import 'dart:convert';

import 'package:get/get.dart';
import 'package:pawang_mobile/models/reminder_model.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/services/reminder_service.dart';
import 'package:pawang_mobile/services/transaction_service.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/services/wallet_service.dart';

class DashboardController extends GetxController {
  var wallets = <WalletsDataModel>[].obs;
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
    var userProfileResponse = await UserService.userProfile();
    if (userProfileResponse.statusCode == 200) {
      var data = jsonDecode(userProfileResponse.body)['data']['user'];
      user.update((user) {
        user!.id = data['id'];
        user.name = data['name'];
        user.email = data['email'];
        user.phone = data['phone'] ?? "";
        user.gender = data['gender'] ?? "";
      });
    }
  }

  Future<void> getWallets() async {
    try {
      var walletsResponse = await WalletService.getWallets();
      if (walletsResponse != null) {
        wallets.assignAll(walletsResponse);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getTransactions() async {
    try {
      var transactionsResponse = await TransactionService.getTransactions();
      if (transactionsResponse != null) {
        transactions.assignAll(transactionsResponse);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getReminders() async {
    try {
      var remindersResponse = await ReminderService.getReminders();
      if (remindersResponse != null) {
        reminders.assignAll(remindersResponse);
      }
    } catch (e) {
      print(e);
    }
  }
}
