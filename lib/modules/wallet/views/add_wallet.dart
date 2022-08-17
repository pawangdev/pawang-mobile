// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';
// import 'package:pawang_mobile/constants/theme.dart';
// import 'package:pawang_mobile/services/wallet_service.dart';
// import 'package:pawang_mobile/modules/home/views/dashboard_screen.dart';
// import 'package:pawang_mobile/views/navigation_screen.dart';
// import 'package:pawang_mobile/widgets/input_field.dart';
// import 'package:pawang_mobile/widgets/icon_back.dart';
// import 'package:pawang_mobile/widgets/loading.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class AddWalletScreen extends StatefulWidget {
//   static const String routeName = '/tambah-dompet';
//   const AddWalletScreen({Key? key}) : super(key: key);

//   @override
//   State<AddWalletScreen> createState() => _AddWalletScreenState();
// }

// class _AddWalletScreenState extends State<AddWalletScreen> {
//   final TextEditingController namaDompet = TextEditingController();
//   final TextEditingController nominalDompet = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   bool _isLoading = false;

//   void _submit() {
//     final form = formKey.currentState;

//     if (form!.validate()) {
//       form.save();
//       var data = <String, dynamic>{
//         'name': namaDompet.text,
//         'balance': int.parse(nominalDompet.text),
//       };

//       try {
//         setState(() {
//           _isLoading = true;
//         });
//         WalletService().createWallet(data).then((response) {
//           if (response == true) {
//             setState(() {
//               _isLoading = false;
//             });
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               NavigationScreen.routeName,
//               (route) => false,
//             );

//             Flushbar(
//               message: "Berhasil Membuat Wallet !",
//               icon: const Icon(
//                 Icons.check,
//                 size: 28.0,
//                 color: Colors.white,
//               ),
//               margin: const EdgeInsets.all(8),
//               borderRadius: BorderRadius.circular(8),
//               backgroundColor: kSuccess,
//               duration: const Duration(seconds: 3),
//             ).show(context);
//           } else {
//             setState(() {
//               _isLoading = false;
//             });
//             Flushbar(
//               message: "Terdapat Kesalahan !",
//               icon: const Icon(
//                 Icons.check,
//                 size: 28.0,
//                 color: Colors.white,
//               ),
//               margin: const EdgeInsets.all(8),
//               borderRadius: BorderRadius.circular(8),
//               backgroundColor: kSuccess,
//               duration: const Duration(seconds: 3),
//             ).show(context);
//           }
//         });
//       } catch (e) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: _isLoading
//             ? const Loading()
//             : Padding(
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 33.0, horizontal: 32.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconBack(
//                           blueMode: true,
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                         Text(
//                           "Tambah Dompet",
//                           style: kOpenSans.copyWith(
//                               fontSize: 16, fontWeight: bold, color: kBlack),
//                         ),
//                         Container(
//                           width: 7.2.w,
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 3.4.h,
//                     ),
//                     Form(
//                       key: formKey,
//                       child: Column(
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(bottom: 20),
//                             child: InputField(
//                               validator:
//                                   ValidationBuilder(localeName: 'id').build(),
//                               inputLabel: "Nama Dompet",
//                               inputController: namaDompet,
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(bottom: 20),
//                             child: InputField(
//                               validator:
//                                   ValidationBuilder(localeName: 'id').build(),
//                               inputLabel: "Saldo Awal",
//                               inputController: nominalDompet,
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.circular(kDefaultBorderRadius),
//                                 gradient: const LinearGradient(
//                                     begin: Alignment.centerLeft,
//                                     end: Alignment.centerRight,
//                                     colors: [kPrimary, kPurple])),
//                             child: TextButton(
//                                 style: ButtonStyle(
//                                   padding: MaterialStateProperty.all(
//                                     const EdgeInsets.symmetric(vertical: 15),
//                                   ),
//                                 ),
//                                 onPressed: _submit,
//                                 child: Text(
//                                   "Simpan Dompet",
//                                   style: kOpenSans.copyWith(
//                                     color: kWhite,
//                                     fontSize: 16,
//                                     fontWeight: bold,
//                                   ),
//                                 )),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
