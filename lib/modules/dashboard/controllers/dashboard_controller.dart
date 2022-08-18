import 'dart:convert';

import 'package:get/get.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/services/transaction_service.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/services/wallet_service.dart';

class DashboardController extends GetxController {
  var wallets = <WalletsDataModel>[].obs;
  var transactions = <TransactionDataModel>[].obs;
  var user = UserProfileDataModel(
    id: 0,
    name: "",
    email: "",
    phone: "",
    gender: "",
  ).obs;

  @override
  void onInit() {
    getUserProfile();
    getWallets();
    getTransactions();
    super.onInit();
  }

  Future<void> getUserProfile() async {
    var userProfileResponse = await UserService.userProfile();
    if (userProfileResponse.statusCode == 200) {
      var data = jsonDecode(userProfileResponse.body)['data'];
      user.update((user) {
        user!.id = data['id'];
        user.name = data['name'];
        user.email = data['email'];
        user.phone = data['phone'];
        user.gender = data['gender'];
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
    print(transactions.length);

    try {
      var transactionsResponse = await TransactionService.getTransactions();
      if (transactionsResponse != null) {
        transactions.assignAll(transactionsResponse);
      }
    } catch (e) {
      print(e);
    }
  }
}