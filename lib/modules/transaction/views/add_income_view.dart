// import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:pawang_mobile/constants/theme.dart';
// import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
// import 'package:pawang_mobile/widgets/dropdown_field.dart';
// import 'package:pawang_mobile/widgets/input_field.dart';
// import 'package:pawang_mobile/widgets/icon_back.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:pawang_mobile/modules/transaction/transaction.dart';

// class AddIncomeView extends StatelessWidget {
//   final TransactionController controller = Get.find();
//   final DashboardController dashboardController = Get.find();

//   // void _submit() {
//   //   final form = formKey.currentState;

//   //   if (form!.validate()) {
//   //     form.save();
//   //     var data = <String, dynamic>{
//   //       'amount': int.parse(_nominalTextController.text),
//   //       'category_id': _categoryID,
//   //       'wallet_id': _walletID,
//   //       'type': 'income',
//   //       'description': _noteTextController.text,
//   //       'date': _dateRFC3399,
//   //     };

//   //     try {
//   //       setState(() {
//   //         _isLoading = true;
//   //       });
//   //       TransactionService.createTransaction(data).then((response) {
//   //         if (response == true) {
//   //           setState(() {
//   //             _isLoading = false;
//   //           });
//   //           Navigator.pushReplacementNamed(context, NavigationScreen.routeName);
//   //           Flushbar(
//   //             message: "Berhasil Menambah Pemasukan !",
//   //             icon: const Icon(
//   //               Icons.check,
//   //               size: 28.0,
//   //               color: Colors.white,
//   //             ),
//   //             margin: const EdgeInsets.all(8),
//   //             borderRadius: BorderRadius.circular(8),
//   //             backgroundColor: defaultSuccess,
//   //             duration: const Duration(seconds: 3),
//   //           ).show(context);
//   //         } else {
//   //           setState(() {
//   //             _isLoading = false;
//   //           });
//   //           Flushbar(
//   //             message: "Terjadi Kesalahan !",
//   //             icon: const Icon(
//   //               Icons.check,
//   //               size: 28.0,
//   //               color: Colors.white,
//   //             ),
//   //             margin: const EdgeInsets.all(8),
//   //             borderRadius: BorderRadius.circular(8),
//   //             backgroundColor: defaultError,
//   //             duration: const Duration(seconds: 3),
//   //           ).show(context);
//   //         }
//   //       });
//   //     } catch (e) {
//   //       setState(() {
//   //         _isLoading = false;
//   //       });
//   //     }
//   //   }
//   // }

//   // @override
//   // void initState() {
//   //   _dateTextController.text =
//   //       DateFormat("dd/MM/yyyy").format(DateTime.now()).toString();
//   //   _dateRFC3399 = DateTime.now().toUtc().toIso8601String();

//   //   _categories = CategoryService.getCategories(type: "income");
//   //   _wallets = WalletService().getWallets();
//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconBack(
//                     blueMode: true,
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   Text(
//                     "Tambah Pemasukan",
//                     style: kOpenSans.copyWith(
//                         fontSize: 16, fontWeight: bold, color: defaultBlack),
//                   ),
//                   Container(
//                     width: 7.2.w,
//                   ),
//                 ],
//               ),
//               Form(
//                 key: const Key('add-income'),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 3.4.h,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 20),
//                       child: InputField(
//                         validator: ValidationBuilder(localeName: 'id').build(),
//                         inputLabel: "Nominal",
//                         inputController: controller.amountTextController,
//                         keyboardType: TextInputType.number,
//                         // errorText: _inputData ? null : 'Nominal wajib diisi',
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 20),
//                       child: Obx(
//                         () => DropdownField(
//                           value: controller.categoryId.value == 0
//                               ? null
//                               : controller.categoryId.value,
//                           inputLabel: "Kategori",
//                           hint: "Pilih Kategori",
//                           data: controller.categoriesIncome,
//                           onChange: (value) {
//                             controller.categoryId.value =
//                                 int.parse(value.toString());
//                           },
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 20),
//                       child: Obx(
//                         () => DropdownField(
//                           value: controller.walletId.value == 0
//                               ? null
//                               : controller.walletId.value,
//                           inputLabel: "Wallets",
//                           hint: "Pilih Wallets",
//                           data: dashboardController.wallets,
//                           onChange: (value) {
//                             controller.walletId.value =
//                                 int.parse(value.toString());
//                           },
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 20),
//                       child: InputField(
//                         inputLabel: "Catatan",
//                         inputController: controller.descriptionTextController,
//                         // errorText: _inputData ? null : 'Kategori wajib diisi',
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.only(bottom: 20),
//                       child: InputField(
//                         validator: ValidationBuilder(localeName: 'id').build(),
//                         inputLabel: "Tanggal",
//                         inputController: controller.dateTextController,
//                         // errorText: _inputData ? null : 'Tanggal wajib diisi',
//                         enable: true,
//                         readOnly: true,
//                         keyboardType: TextInputType.none,
//                         onTap: () {
//                           showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime(2000),
//                                   lastDate: DateTime(2099))
//                               .then((date) {
//                             controller.dateTextController.text =
//                                 DateFormat("dd/MM/yyyy")
//                                     .format(date!)
//                                     .toString();
//                             controller.dateRFC3399.value =
//                                 date.toUtc().toIso8601String();
//                           });
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(defaultBorderRadius),
//                           gradient: const LinearGradient(
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                               colors: [defaultPrimary, defaultPurple])),
//                       child: TextButton(
//                           style: ButtonStyle(
//                             padding: MaterialStateProperty.all(
//                               const EdgeInsets.symmetric(vertical: 15),
//                             ),
//                           ),
//                           onPressed: () =>
//                               controller.createTransaction("income"),
//                           child: Text(
//                             "Simpan Pemasukan",
//                             style: kOpenSans.copyWith(
//                               color: defaultWhite,
//                               fontSize: 16,
//                               fontWeight: bold,
//                             ),
//                           )),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
