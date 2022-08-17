// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:pawang_mobile/constants/theme.dart';
// import 'package:pawang_mobile/services/wallet_service.dart';
// import 'package:pawang_mobile/utils/currency_format.dart';
// import 'package:pawang_mobile/modules/home/views/dashboard_screen.dart';
// import 'package:pawang_mobile/views/navigation_screen.dart';
// import 'package:pawang_mobile/modules/wallet/views/wallet_screen.dart';
// import 'package:pawang_mobile/widgets/input_field.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class WalletCard2 extends StatefulWidget {
//   final int idWallet;
//   final String name;
//   final String balance;
//   final String balanceFormat;

//   const WalletCard2(
//       {Key? key,
//       required this.name,
//       required this.balance,
//       required this.idWallet,
//       required this.balanceFormat})
//       : super(key: key);

//   @override
//   State<WalletCard2> createState() => _WalletCard2State();
// }

// class _WalletCard2State extends State<WalletCard2> {
//   bool init = true;
//   final TextEditingController _walletTextController = TextEditingController();
//   final TextEditingController _balanceTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     if (init) {
//       _walletTextController.text = widget.name;
//       _balanceTextController.text = widget.balance;

//       init = false;
//     }

//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       width: MediaQuery.of(context).size.width,
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             widget.name,
//             //snapshot.data!.data[index].name,
//             style: kOpenSans.copyWith(
//               color: kPrimary,
//               fontWeight: semibold,
//               fontSize: 16,
//             ),
//           ),
//           SizedBox(
//             height: 1.4.h,
//           ),
//           Text(
//             widget.balanceFormat,
//             //${snapshot.data!.data[index].balance}',
//             style: kOpenSans.copyWith(
//               color: kBlack,
//               fontWeight: medium,
//               fontSize: 15,
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       gradient: const LinearGradient(
//                           begin: Alignment.centerLeft,
//                           end: Alignment.centerRight,
//                           colors: [kPrimary, kPurple])),
//                   child: TextButton(
//                       style: ButtonStyle(
//                         padding: MaterialStateProperty.all(
//                             const EdgeInsets.symmetric(vertical: 1)),
//                       ),
//                       child: Text(
//                         'Edit Dompet',
//                         style: kOpenSans.copyWith(
//                             color: kWhite, fontWeight: medium, fontSize: 16),
//                       ),
//                       onPressed: () {
//                         showModalBottomSheet<void>(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return Container(
//                               height: 40.h,
//                               color: kWhite,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     // Nominal
//                                     Text(
//                                       'Ubah Data',
//                                       style: kOpenSans.copyWith(
//                                           fontSize: 18, fontWeight: bold),
//                                     ),
//                                     Container(
//                                       margin: const EdgeInsets.only(bottom: 20),
//                                       child: InputField(
//                                         inputLabel: "Nama Dompet",
//                                         inputController: _walletTextController,
//                                         keyboardType: TextInputType.text,
//                                         enable: true,
//                                         // errorText: _inputData ? null : 'Nominal wajib diisi',
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: SizedBox(
//                                           width:
//                                               MediaQuery.of(context).size.width,
//                                           child: ElevatedButton(
//                                             style: ButtonStyle(
//                                               padding:
//                                                   MaterialStateProperty.all(
//                                                       const EdgeInsets.all(10)),
//                                               backgroundColor:
//                                                   MaterialStateProperty.all(
//                                                       kPrimary),
//                                               shape: MaterialStateProperty.all(
//                                                 RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                 ),
//                                               ),
//                                             ),
//                                             child: Text(
//                                               'Simpan Perubahan',
//                                               style: kOpenSans.copyWith(
//                                                   color: kWhite,
//                                                   fontWeight: medium,
//                                                   fontSize: 16),
//                                             ),
//                                             onPressed: () {
//                                               var data = <String, dynamic>{
//                                                 'name':
//                                                     _walletTextController.text,
//                                                 'balance': int.parse(
//                                                     _balanceTextController.text)
//                                               };

//                                               try {
//                                                 WalletService()
//                                                     .updateWallet(
//                                                         data, widget.idWallet)
//                                                     .then(
//                                                   (response) {
//                                                     if (response == true) {
//                                                       Navigator
//                                                           .pushReplacementNamed(
//                                                               context,
//                                                               NavigationScreen
//                                                                   .routeName);

//                                                       Flushbar(
//                                                         message:
//                                                             "Berhasil Merubah Dompet !",
//                                                         icon: const Icon(
//                                                           Icons.check,
//                                                           size: 28.0,
//                                                           color: Colors.white,
//                                                         ),
//                                                         margin: const EdgeInsets
//                                                             .all(8),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8),
//                                                         backgroundColor:
//                                                             kSuccess,
//                                                         duration:
//                                                             const Duration(
//                                                                 seconds: 3),
//                                                       ).show(context);
//                                                     } else {
//                                                       Flushbar(
//                                                         message:
//                                                             "Terdapat Kesalahan !",
//                                                         icon: const Icon(
//                                                           Icons.check,
//                                                           size: 28.0,
//                                                           color: Colors.white,
//                                                         ),
//                                                         margin: const EdgeInsets
//                                                             .all(8),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(8),
//                                                         backgroundColor:
//                                                             kSuccess,
//                                                         duration:
//                                                             const Duration(
//                                                                 seconds: 3),
//                                                       ).show(context);
//                                                     }
//                                                   },
//                                                 );
//                                               } catch (e) {
//                                                 Flushbar(
//                                                   message:
//                                                       "Terdapat Kesalahan !",
//                                                   icon: const Icon(
//                                                     Icons.check,
//                                                     size: 28.0,
//                                                     color: Colors.white,
//                                                   ),
//                                                   margin:
//                                                       const EdgeInsets.all(8),
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                   backgroundColor: kSuccess,
//                                                   duration: const Duration(
//                                                       seconds: 3),
//                                                 ).show(context);
//                                               }
//                                             },
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }),
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Expanded(
//                 child: OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 13),
//                       side: const BorderSide(color: kError),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8)),
//                     ),
//                     child: Text(
//                       'Hapus Dompet',
//                       style: kOpenSans.copyWith(
//                           color: kError, fontWeight: medium, fontSize: 16),
//                     ),
//                     onPressed: () {
//                       showDialog<void>(
//                         context: context,
//                         barrierDismissible: false,
//                         builder: (BuildContext context) => AlertDialog(
//                           title: Text(
//                             'Hapus Dompet',
//                             style: kOpenSans.copyWith(
//                                 fontSize: 18, fontWeight: bold),
//                             textAlign: TextAlign.center,
//                           ),
//                           content: Text(
//                             'Apakah kamu yakin akan menghapus dompet ini?',
//                             style: kOpenSans.copyWith(
//                                 fontSize: 16, fontWeight: light),
//                             textAlign: TextAlign.center,
//                           ),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                           actions: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Expanded(
//                                   child: OutlinedButton(
//                                     child: Text(
//                                       "Kembali",
//                                       style: kOpenSans.copyWith(
//                                           fontSize: 16,
//                                           fontWeight: medium,
//                                           color: kPrimary),
//                                     ),
//                                     onPressed: () {
//                                       Navigator.pop(context, 'Kembali');
//                                     },
//                                     style: OutlinedButton.styleFrom(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 4),
//                                       side: const BorderSide(color: kPrimary),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8)),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(width: 1.w),
//                                 Expanded(
//                                   child: OutlinedButton(
//                                       style: OutlinedButton.styleFrom(
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: 4),
//                                         side: const BorderSide(color: kError),
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                       ),
//                                       child: Text(
//                                         'Hapus',
//                                         style: kOpenSans.copyWith(
//                                             color: kError,
//                                             fontWeight: medium,
//                                             fontSize: 16),
//                                       ),
//                                       onPressed: () {
//                                         try {
//                                           WalletService()
//                                               .deleteWallet(widget.idWallet)
//                                               .then((response) {
//                                             if (response == true) {
//                                               Navigator.pushReplacementNamed(
//                                                   context,
//                                                   NavigationScreen.routeName);

//                                               Flushbar(
//                                                 message:
//                                                     "Berhasil Menghapus Dompet !",
//                                                 icon: const Icon(
//                                                   Icons.check,
//                                                   size: 28.0,
//                                                   color: Colors.white,
//                                                 ),
//                                                 margin: const EdgeInsets.all(8),
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                                 backgroundColor: kSuccess,
//                                                 duration:
//                                                     const Duration(seconds: 3),
//                                               ).show(context);
//                                             } else {
//                                               Flushbar(
//                                                 message: "Terdapat Kesalahan !",
//                                                 icon: const Icon(
//                                                   Icons.check,
//                                                   size: 28.0,
//                                                   color: Colors.white,
//                                                 ),
//                                                 margin: const EdgeInsets.all(8),
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                                 backgroundColor: kError,
//                                                 duration:
//                                                     const Duration(seconds: 3),
//                                               ).show(context);
//                                             }
//                                           });
//                                         } catch (e) {
//                                           Flushbar(
//                                             message: "Terdapat Kesalahan !",
//                                             icon: const Icon(
//                                               Icons.check,
//                                               size: 28.0,
//                                               color: Colors.white,
//                                             ),
//                                             margin: const EdgeInsets.all(8),
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                             backgroundColor: kError,
//                                             duration:
//                                                 const Duration(seconds: 3),
//                                           ).show(context);
//                                         }
//                                       }),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ],
//       ),
//       decoration: BoxDecoration(
//           color: kWhite,
//           borderRadius: const BorderRadius.all(Radius.circular(12)),
//           boxShadow: [
//             BoxShadow(
//               color: kBlack.withOpacity(0.07),
//               spreadRadius: 2,
//               blurRadius: 10,
//             )
//           ]),
//     );
//   }
// }
