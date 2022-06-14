import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/services/transaction_service.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/image_dialog.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailPengeluaran extends StatefulWidget {
  static const String routeName = "/detail";
  const DetailPengeluaran({Key? key}) : super(key: key);

  @override
  State<DetailPengeluaran> createState() => _DetailPengeluaranState();
}

class _DetailPengeluaranState extends State<DetailPengeluaran> {
  final TextEditingController _nominalTextController = TextEditingController();
  final TextEditingController _noteTextController = TextEditingController();
  final TextEditingController _dateTextController = TextEditingController();
  final TextEditingController _categoryTextController = TextEditingController();
  final TextEditingController _walletTextController = TextEditingController();
  final TextEditingController _typeTextController = TextEditingController();
  final TextEditingController _nominalEditTextController =
      TextEditingController();
  final TextEditingController _noteEditTextController = TextEditingController();
  final TextEditingController _dateEditTextController = TextEditingController();
  final TextEditingController _walletEditTextController =
      TextEditingController();

  late String _dateRFC3399;
  int? _walletID, _categoryID;
  bool _isLoading = false;

  @override
  void initState() {
    if (_dateTextController.text.isEmpty) {
      _dateTextController.text = DateTime.now().toString();
    }
    _dateEditTextController.text = DateFormat("dd/MM/yyyy")
        .format(DateTime.parse(_dateTextController.text))
        .toString();
    _dateRFC3399 =
        (DateTime.parse(_dateTextController.text)).toUtc().toIso8601String();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionModel data =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;
    late final int transaction_id = data.id;
    final String? transaction_image_url =
        data.imageUrl == "" ? "" : data.imageUrl;

    if (_nominalTextController.text.isEmpty) {
      setState(() {
        _nominalTextController.text =
            CurrencyFormat.convertToIdr(data.amount, 2).toString();
        _noteTextController.text = data.description;
        _dateTextController.text =
            DateFormat("dd/MM/yyyy").format(data.date.toLocal()).toString();
        _categoryTextController.text = data.category.name;
        _walletTextController.text = data.wallet.name;
        _typeTextController.text = data.type;
        _walletID = data.walletId;
        _categoryID = data.categoryId;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Loading()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [kPrimary, kPurple])),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 28, left: 32),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconBack(
                                blueMode: false,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Detail Riwayat",
                                    style: kOpenSans.copyWith(
                                        fontSize: 16,
                                        fontWeight: bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Container(
                                width: 7.2.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // CircleAvatar(
                    //     child: GestureDetector(
                    //       onTap: () async {
                    //         await showDialog(
                    //           context: context,
                    //           builder: (_) => ImageDialog()
                    //         );
                    //       },
                    //     ),
                    //     radius: 50.0,
                    //     backgroundImage: AssetImage('assets/images/google.png')),
                    transaction_image_url == ""
                        ? SizedBox()
                        : Center(
                            child: GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (_) => ImageDialog(
                                        imageUrl: baseURLAPI + data.imageUrl,
                                      ));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        baseURLAPI + data.imageUrl),
                                    fit: BoxFit.cover),
                                border: Border.all(color: kGray, width: 0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          )),
                    Container(
                      //margin: const EdgeInsets.(top: 20, bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nominal
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: InputField(
                              inputLabel: "Nominal",
                              inputController: _nominalTextController,
                              keyboardType: TextInputType.number,
                              enable: false,
                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                            ),
                          ),
                          // Kategori
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: InputField(
                              inputLabel: "Kategori",
                              inputController: _categoryTextController,
                              keyboardType: TextInputType.number,
                              enable: false,
                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                            ),
                          ),
                          // Wallets
                          // Kategori
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: InputField(
                              inputLabel: "Wallets",
                              inputController: _walletTextController,
                              keyboardType: TextInputType.number,
                              enable: false,
                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                            ),
                          ),
                          // Catatan
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: InputField(
                              inputLabel: "Catatan",
                              inputController: _noteTextController,
                              keyboardType: TextInputType.number,
                              enable: false,
                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: InputField(
                              inputLabel: "Tanggal",
                              inputController: _dateTextController,
                              keyboardType: TextInputType.number,
                              enable: false,
                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                            ),
                          ),
                        ],
                      ),
                    ),
                    // BUTTONS
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      margin: const EdgeInsets.only(bottom: 32),
                      child: Center(
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [kPrimary, kPurple])),
                                child: TextButton(
                                  onPressed: () {
                                    _nominalEditTextController.text =
                                        data.amount.toString();
                                    _noteEditTextController.text =
                                        data.description;
                                    _dateEditTextController.text =
                                        DateFormat("dd/MM/yyyy")
                                            .format(data.date.toLocal())
                                            .toString();
                                    _categoryID = data.category.id;
                                    _walletID = data.wallet.id;
                                    _walletEditTextController.text =
                                        data.wallet.name;
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 85.h,
                                          color: kWhite,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                // Nominal
                                                Text(
                                                  'Ubah Data',
                                                  style: kOpenSans.copyWith(
                                                      fontSize: 18,
                                                      fontWeight: bold),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  child: InputField(
                                                    inputLabel: "Nominal",
                                                    inputController:
                                                        _nominalEditTextController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    enable: true,
                                                    // errorText: _inputData ? null : 'Nominal wajib diisi',
                                                  ),
                                                ),
                                                // Kategori
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  child: InputField(
                                                    inputLabel: "Kategori",
                                                    inputController:
                                                        _categoryTextController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    enable: false,
                                                    // errorText: _inputData ? null : 'Nominal wajib diisi',
                                                  ),
                                                ),
                                                // Wallets
                                                // Kategori
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  child: InputField(
                                                    inputLabel: "Wallets",
                                                    inputController:
                                                        _walletEditTextController,
                                                    enable: false,
                                                    // errorText: _inputData ? null : 'Nominal wajib diisi',
                                                  ),
                                                ),
                                                // Catatan
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  child: InputField(
                                                    inputLabel: "Catatan",
                                                    inputController:
                                                        _noteEditTextController,
                                                    enable: true,
                                                    // errorText: _inputData ? null : 'Nominal wajib diisi',
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 20),
                                                  child: InputField(
                                                    validator:
                                                        ValidationBuilder(
                                                                localeName:
                                                                    'id')
                                                            .build(),
                                                    inputLabel: "Tanggal",
                                                    inputController:
                                                        _dateEditTextController,
                                                    // errorText: _inputData ? null : 'Tanggal wajib diisi',
                                                    enable: true,
                                                    readOnly: true,
                                                    keyboardType:
                                                        TextInputType.none,
                                                    onTap: () {
                                                      showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      2000),
                                                              lastDate:
                                                                  DateTime(
                                                                      2099))
                                                          .then((date) {
                                                        setState(() {
                                                          _dateEditTextController
                                                              .text = DateFormat(
                                                                  "dd/MM/yyyy")
                                                              .format(date!)
                                                              .toString();
                                                          _dateRFC3399 = date
                                                              .toUtc()
                                                              .toIso8601String();
                                                        });
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: ElevatedButton(
                                                          style: ButtonStyle(
                                                            padding: MaterialStateProperty.all(
                                                                const EdgeInsets
                                                                    .all(10)),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                                        kPrimary),
                                                            shape:
                                                                MaterialStateProperty
                                                                    .all(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                          ),
                                                          child: Text(
                                                            'Simpan Perubahan',
                                                            style: kOpenSans
                                                                .copyWith(
                                                                    color:
                                                                        kWhite,
                                                                    fontWeight:
                                                                        medium,
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                          onPressed: () {
                                                            var data = <String,
                                                                dynamic>{
                                                              'amount': int.parse(
                                                                  _nominalEditTextController
                                                                      .text),
                                                              'category_id':
                                                                  _categoryID,
                                                              'wallet_id':
                                                                  _walletID,
                                                              'type':
                                                                  _typeTextController
                                                                      .text,
                                                              'description':
                                                                  _noteEditTextController
                                                                      .text,
                                                              'date':
                                                                  _dateRFC3399,
                                                            };

                                                            print(data);

                                                            try {
                                                              setState(() {
                                                                _isLoading =
                                                                    true;
                                                              });
                                                              TransactionService
                                                                      .updateTransaction(
                                                                          data,
                                                                          transaction_id)
                                                                  .then(
                                                                      (response) {
                                                                if (response ==
                                                                    true) {
                                                                  setState(() {
                                                                    _isLoading =
                                                                        false;
                                                                  });
                                                                  Navigator.pushReplacementNamed(
                                                                      context,
                                                                      DashboardScreen
                                                                          .routeName);

                                                                  Flushbar(
                                                                    message:
                                                                        "Berhasil Mengubah Data !",
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .check,
                                                                      size:
                                                                          28.0,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    margin: const EdgeInsets
                                                                        .all(8),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    backgroundColor:
                                                                        kSuccess,
                                                                    duration: const Duration(
                                                                        seconds:
                                                                            3),
                                                                  ).show(
                                                                      context);
                                                                } else {
                                                                  setState(() {
                                                                    _isLoading =
                                                                        false;
                                                                  });
                                                                  Flushbar(
                                                                    message:
                                                                        "Terdapat Kesalahan !",
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .check,
                                                                      size:
                                                                          28.0,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    margin: const EdgeInsets
                                                                        .all(8),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    backgroundColor:
                                                                        kError,
                                                                    duration: const Duration(
                                                                        seconds:
                                                                            3),
                                                                  ).show(
                                                                      context);
                                                                }
                                                              });
                                                            } catch (e) {
                                                              setState(() {
                                                                _isLoading =
                                                                    false;
                                                              });
                                                              print(e);
                                                            }
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      isScrollControlled: true,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.edit_rounded,
                                        color: kWhite,
                                        size: 20,
                                      ),
                                      SizedBox(width: 3.w),
                                      Text(
                                        "Ubah Data",
                                        style: kOpenSans.copyWith(
                                            color: kWhite,
                                            fontSize: 16,
                                            fontWeight: medium),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text(
                                        'Hapus Pengeluaran',
                                        style: kOpenSans.copyWith(
                                            fontSize: 18, fontWeight: bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Text(
                                        'Apakah kamu yakin akan menghapus pengeluaran ini?',
                                        style: kOpenSans.copyWith(
                                            fontSize: 16, fontWeight: light),
                                        textAlign: TextAlign.center,
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                child: Text(
                                                  "Kembali",
                                                  style: kOpenSans.copyWith(
                                                      fontSize: 16,
                                                      fontWeight: medium,
                                                      color: kPrimary),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, 'Kembali');
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  side: const BorderSide(
                                                      color: kPrimary),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 1.w),
                                            Expanded(
                                              child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 4),
                                                    side: const BorderSide(
                                                        color: kError),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  child: Text(
                                                    'Hapus',
                                                    style: kOpenSans.copyWith(
                                                        color: kError,
                                                        fontWeight: medium,
                                                        fontSize: 16),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isLoading = true;
                                                    });
                                                    try {
                                                      TransactionService
                                                              .destroyTransaction(
                                                                  transaction_id)
                                                          .then((response) {
                                                        if (response == true) {
                                                          setState(() {
                                                            _isLoading = false;
                                                          });
                                                          Navigator
                                                              .pushReplacementNamed(
                                                                  context,
                                                                  DashboardScreen
                                                                      .routeName);
                                                          Flushbar(
                                                            message:
                                                                "Berhasil Menghapus Transaksi !",
                                                            icon: const Icon(
                                                              Icons.check,
                                                              size: 28.0,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            backgroundColor:
                                                                kSuccess,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 3),
                                                          ).show(context);
                                                        } else {
                                                          setState(() {
                                                            _isLoading = false;
                                                          });
                                                          Flushbar(
                                                            message:
                                                                "Terjadi Kesalahan !",
                                                            icon: const Icon(
                                                              Icons.check,
                                                              size: 28.0,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            backgroundColor:
                                                                kError,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 3),
                                                          ).show(context);
                                                        }
                                                      });
                                                    } catch (e) {
                                                      setState(() {
                                                        _isLoading = false;
                                                      });
                                                    }
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.delete_rounded,
                                      color: kError,
                                      size: 20,
                                    ),
                                    SizedBox(width: 3.w),
                                    Text(
                                      "Hapus Data",
                                      style: kOpenSans.copyWith(
                                          color: kError,
                                          fontSize: 16,
                                          fontWeight: medium),
                                    ),
                                  ],
                                ),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(13),
                                  side: const BorderSide(color: kError),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
