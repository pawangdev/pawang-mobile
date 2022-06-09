import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/views/image_dialog.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
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

  @override
  Widget build(BuildContext context) {
    TransactionModel data =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;
    final int? _id = data.id;

    _nominalTextController.text = data.amount.toString();
    _noteTextController.text = data.description;
    _dateTextController.text = data.date.toString();
    _categoryTextController.text = data.category.name;
    _walletTextController.text = data.walletId.toString();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                              "Detail Pengeluaran",
                              style: kOpenSans.copyWith(
                                  fontSize: 0.253.dp,
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
              Center(
                  child: GestureDetector(
                onTap: () async {
                  await showDialog(
                      context: context, builder: (_) => const ImageDialog());
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/girl_boy_landing.png'),
                        fit: BoxFit.cover),
                    border: Border.all(color: kGray, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )),
              Container(
                //margin: const EdgeInsets.(top: 20, bottom: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
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
                        child: ElevatedButton(
                          onPressed: () => {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.edit_rounded,
                                size: 20,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "Ubah Data",
                                style: kOpenSans.copyWith(
                                    fontSize: 0.253.dp, fontWeight: medium),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10)),
                            backgroundColor:
                                MaterialStateProperty.all(kPrimary),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  'Hapus Pengeluaran',
                                  style: kOpenSans.copyWith(
                                      fontSize: 0.26.dp, fontWeight: bold),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  'Apakah kamu yakin akan menghapus pengeluaran ini?',
                                  style: kOpenSans.copyWith(
                                      fontSize: 0.24.dp, fontWeight: light),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
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
                                                fontSize: 0.23.dp,
                                                fontWeight: medium,
                                                color: kPrimary),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context, 'Kembali');
                                          },
                                          style: OutlinedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            side: const BorderSide(
                                                color: kPrimary),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
                                      Expanded(
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      kError),
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              'Hapus',
                                              style: kOpenSans.copyWith(
                                                  color: kWhite,
                                                  fontWeight: medium,
                                                  fontSize: 0.23.dp),
                                            ),
                                            onPressed: () => {}),
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
                                size: 20,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "Hapus Data",
                                style: kOpenSans.copyWith(
                                    fontSize: 0.245.dp, fontWeight: medium),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10)),
                            backgroundColor: MaterialStateProperty.all(kError),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
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
