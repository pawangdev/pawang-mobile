import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/authentication.dart';
import 'package:pawang_mobile/modules/authentication/bindings/reset_password_binding.dart';
import 'package:pawang_mobile/modules/category/bindings/category_binding.dart';
import 'package:pawang_mobile/modules/category/views/category_view.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/landing/landing.dart';
import 'package:pawang_mobile/modules/navigation/navigation.dart';
import 'package:pawang_mobile/modules/onboarding/onboarding.dart';
import 'package:pawang_mobile/modules/profile/profile.dart';
import 'package:pawang_mobile/modules/reminder/reminder.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/modules/splash/splash.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/modules/transaction/views/tab_bar_view.dart';
import 'package:pawang_mobile/modules/transaction/views/transaction_detail_view.dart';
import 'package:pawang_mobile/modules/transaction/views/add_transaction.dart';
import 'package:pawang_mobile/modules/wallet/views/add_wallet_view.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';

part './app_routes.dart';

class AppPages {
  static const INITIAL = RoutesName.splash;

  static final pages = [
    GetPage(
        name: RoutesName.splash,
        page: () => SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: RoutesName.onboarding,
        page: () => OnboardingView(),
        binding: OnboardingBinding()),
    GetPage(
        name: RoutesName.register,
        page: () => RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: RoutesName.login,
        page: () => LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: RoutesName.landing,
        page: () => LandingView(),
        binding: LandingBinding()),
    GetPage(
        name: RoutesName.dashboard,
        page: () => DashboardView(),
        binding: DashboardBinding()),
    GetPage(
        name: RoutesName.navigation,
        page: () => NavigationView(),
        binding: NavigationBinding()),
    GetPage(
        name: RoutesName.scanreceipe,
        page: () => ScanReceipeView(),
        binding: ScanReceipeBinding()),
    GetPage(
        name: RoutesName.settings,
        page: () => SettingsView(),
        binding: SettingsBinding()),
    GetPage(
        name: RoutesName.editprofile,
        page: () => EditProfileView(),
        binding: EditProfileBinding()),
    GetPage(
        name: RoutesName.changepassword,
        page: () => ChangePasswordView(),
        binding: ChangePasswordBinding()),
    GetPage(
        name: RoutesName.addincome,
        page: () => AddIncomeView(),
        binding: TransactionBinding()),
    GetPage(
        name: RoutesName.addtransaction,
        page: () => AddTransaction(),
        binding: TransactionBinding()),
    GetPage(
        name: RoutesName.tabbar,
        page: () => TabBarScreen(),
        binding: TransactionBinding()),
    GetPage(
        name: RoutesName.transactionhistory,
        page: () => TransactionHistoryView(),
        binding: TransactionBinding()),
    GetPage(
        name: RoutesName.addoutcome,
        page: () => AddOutcomeView(),
        binding: TransactionBinding()),
    GetPage(
        name: RoutesName.detailtransaction,
        page: () => TransactionDetailView(),
        binding: TransactionBinding()),
    GetPage(
        name: RoutesName.wallet,
        page: () => WalletView(),
        binding: WalletBinding()),
    GetPage(
        name: RoutesName.addwallet,
        page: () => AddWalletView(),
        binding: WalletBinding()),
    GetPage(
        name: RoutesName.category,
        page: () => CategoryView(),
        binding: CategoryBinding()),
    GetPage(
        name: RoutesName.reminder,
        page: () => ReminderView(),
        binding: ReminderBinding()),
    GetPage(
        name: RoutesName.addreminder,
        page: () => AddReminderView(),
        binding: ReminderBinding()),
    GetPage(
        name: RoutesName.resetpasswordemail,
        page: () => ResetPasswordRequestEmailView(),
        binding: ResetPasswordBinding()),
    GetPage(
        name: RoutesName.resetpasswordtoken,
        page: () => ResetPasswordTokenView(),
        binding: ResetPasswordBinding()),
    GetPage(
        name: RoutesName.resetpasswordconfirmation,
        page: () => ResetPasswordConfirmationView(),
        binding: ResetPasswordBinding()),
  ];
}
