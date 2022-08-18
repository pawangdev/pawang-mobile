import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/services/transaction_service.dart';
import 'package:pawang_mobile/widgets/dropdown_field.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ValidationScanView extends StatelessWidget {
  late Future<CategoriesModel> _categories;
  // late Future<WalletsModel> _wallets;
  final TextEditingController _nominalTextController = TextEditingController();
  final TextEditingController _noteTextController = TextEditingController();
  final TextEditingController _dateTextController = TextEditingController();
  late String _dateRFC3399;
  int? _walletID;
  int? _categoryID;
  String? filePath;
  bool _isLoading = false;
  bool _init = true;

  // Future<void> getDataFromScanScreen() async {
  //   final args =
  //       ModalRoute.of(context)!.settings.arguments as ArgumentsValidation;

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     try {
  //       if (_init) {
  //         _nominalTextController.text = int.parse(args.nominal).toString();

  //         setState(() {
  //           _init = false;
  //         });
  //       }
  //     } catch (e) {
  //       if (mounted) {
  //         Navigator.pushReplacementNamed(context, ScanStruk.routeName);
  //         Flushbar(
  //           message: "Nominal Terlalu Besar, Mohon Scan Ulang !",
  //           icon: const Icon(
  //             Icons.check,
  //             size: 28.0,
  //             color: Colors.white,
  //           ),
  //           margin: const EdgeInsets.all(8),
  //           borderRadius: BorderRadius.circular(8),
  //           backgroundColor: kError,
  //           duration: const Duration(seconds: 3),
  //         ).show(context);
  //       }
  //     }
  //     filePath = args.filePath;
  //   });

  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   _dateTextController.text =
  //       DateFormat("dd/MM/yyyy").format(DateTime.now()).toString();
  //   _dateRFC3399 = DateTime.now().toUtc().toIso8601String();

  //   _categories = CategoryService.getCategories(type: "outcome");
  //   _wallets = WalletService().getWallets();

  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   getDataFromScanScreen();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _isLoading
            ? const Loading()
            : Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 33.0, horizontal: 32.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconBack(
                            blueMode: true,
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        Text(
                          "Validasi Scan Struk",
                          style: kOpenSans.copyWith(
                              fontSize: 16, fontWeight: bold, color: kBlack),
                        ),
                        Container(
                          width: 7.2.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Mohon Lakukan Validasi untuk Menghindari Kesalahan", //0.2.dp
                      style: kOpenSans.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 3.4.h,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        inputLabel: "Nominal",
                        inputController: _nominalTextController,
                        keyboardType: TextInputType.number,
                        // errorText: _inputData ? null : 'Nominal wajib diisi',
                      ),
                    ),
                    FutureBuilder(
                      future: _categories,
                      builder:
                          (context, AsyncSnapshot<CategoriesModel> snapshot) {
                        var state = snapshot.connectionState;

                        if (state != ConnectionState.done) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kategori",
                                style: kOpenSans.copyWith(
                                    fontSize: 12,
                                    //0.21.dp,
                                    fontWeight: bold,
                                    color: kBlack),
                              ),
                              SizedBox(
                                height: 1.4.h,
                              ),
                              SkeletonAnimation(
                                borderRadius: BorderRadius.circular(8.0),
                                shimmerColor: Colors.white70,
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  padding: const EdgeInsets.all(10.0),
                                  height: 4.8.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          if (snapshot.hasData) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: DropdownField(
                                  value: _categoryID,
                                  inputLabel: "Kategori",
                                  hint: "Pilih Kategori",
                                  data: snapshot.data!.data,
                                  onChange: (value) {
                                    // setState(() {
                                    //   _categoryID = int.parse(value.toString());
                                    // });
                                  }),
                            );
                          } else if (snapshot.hasError) {
                            return Text("");
                          } else {
                            return Text("");
                          }
                        }
                      },
                    ),
                    // FutureBuilder(
                    //   future: _wallets,
                    //   builder: (context, AsyncSnapshot<WalletsModel> snapshot) {
                    //     var state = snapshot.connectionState;

                    //     if (state != ConnectionState.done) {
                    //       return Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(
                    //             "Wallets",
                    //             style: kOpenSans.copyWith(
                    //                 fontSize: 12,
                    //                 //0.21.dp,
                    //                 fontWeight: bold,
                    //                 color: kBlack),
                    //           ),
                    //           SizedBox(
                    //             height: 1.4.h,
                    //           ),
                    //           SkeletonAnimation(
                    //             borderRadius: BorderRadius.circular(8.0),
                    //             shimmerColor: Colors.white70,
                    //             child: Container(
                    //               margin: const EdgeInsets.only(bottom: 20),
                    //               padding: const EdgeInsets.all(10.0),
                    //               height: 4.8.h,
                    //               width: MediaQuery.of(context).size.width,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(8.0),
                    //                 color: Colors.grey.withOpacity(0.5),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       );
                    //     } else {
                    //       if (snapshot.hasData) {
                    //         return Container(
                    //           margin: const EdgeInsets.only(bottom: 20),
                    //           child: DropdownField(
                    //               value: _walletID,
                    //               inputLabel: "Wallets",
                    //               hint: "Pilih Wallets",
                    //               data: snapshot.data!.data,
                    //               onChange: (value) {
                    //                 // setState(() {
                    //                 //   _walletID = int.parse(value.toString());
                    //                 // });
                    //               }),
                    //         );
                    //       } else if (snapshot.hasError) {
                    //         return Text("");
                    //       } else {
                    //         return Text("");
                    //       }
                    //     }
                    //   },
                    // ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        inputLabel: "Catatan",
                        inputController: _noteTextController,
                        // errorText: _inputData ? null : 'Kategori wajib diisi',
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        inputLabel: "Tanggal",
                        inputController: _dateTextController,
                        // errorText: _inputData ? null : 'Tanggal wajib diisi',
                        enable: true,
                        readOnly: true,
                        keyboardType: TextInputType.none,
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2099))
                              .then((date) {
                            // setState(() {
                            //   _dateTextController.text =
                            //       DateFormat("dd/MM/yyyy")
                            //           .format(date!)
                            //           .toString();
                            //   _dateRFC3399 = date.toUtc().toIso8601String();
                            // });
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorderRadius),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [kPrimary, kPurple])),
                            child: TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 15),
                                  ),
                                ),
                                onPressed: () {
                                  var data = <String, dynamic>{
                                    'amount':
                                        int.parse(_nominalTextController.text),
                                    'category_id': _categoryID,
                                    'wallet_id': _walletID,
                                    'type': 'outcome',
                                    'description': _noteTextController.text,
                                    'date': _dateRFC3399,
                                    'image': filePath,
                                  };

                                  try {
                                    // setState(() {
                                    //   _isLoading = true;
                                    // });
                                    TransactionService.createTransaction(data)
                                        .then((response) {
                                      if (response == true) {
                                        // setState(() {
                                        //   _isLoading = false;
                                        // });
                                        // Navigator.pushReplacementNamed(context,
                                        //     NavigationScreen.routeName);
                                        Flushbar(
                                          message:
                                              "Berhasil Menambah Pengeluaran !",
                                          icon: const Icon(
                                            Icons.check,
                                            size: 28.0,
                                            color: Colors.white,
                                          ),
                                          margin: const EdgeInsets.all(8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          backgroundColor: kSuccess,
                                          duration: const Duration(seconds: 3),
                                        ).show(context);
                                      } else {
                                        // setState(() {
                                        //   _isLoading = false;
                                        // });
                                        Flushbar(
                                          message:
                                              "Saldo Pada Dompet Tidak Cukup !",
                                          icon: const Icon(
                                            Icons.check,
                                            size: 28.0,
                                            color: Colors.white,
                                          ),
                                          margin: const EdgeInsets.all(8),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          backgroundColor: kError,
                                          duration: const Duration(seconds: 3),
                                        ).show(context);
                                      }
                                    });
                                  } catch (e) {
                                    // setState(() {
                                    //   _isLoading = false;
                                    // });
                                  }
                                },
                                child: Text(
                                  "Simpan Pengeluaran",
                                  style: kOpenSans.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class ArgumentsValidation {
  String nominal;
  String filePath;

  ArgumentsValidation({required this.nominal, required this.filePath});
}