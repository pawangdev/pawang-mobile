import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/pengeluaran_model.dart';
import 'package:pawang_mobile/services/pengeluaran_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailPengeluaran extends StatefulWidget {
  static const String routeName = "/detail";
  const DetailPengeluaran({Key? key}) : super(key: key);

  @override
  State<DetailPengeluaran> createState() => _DetailPengeluaranState();
}

class _DetailPengeluaranState extends State<DetailPengeluaran> {
  TextEditingController namaPengeluaran = TextEditingController();
  TextEditingController nominalPengeluaran = TextEditingController();
  TextEditingController kategoriPengeluaran = TextEditingController();
  TextEditingController tanggalPengeluaran = TextEditingController();
  bool _validated = true;
  bool _isEdited = false;

  // UPDATING DATA
  Future<void> updateData(PengeluaranModel _pengeluaran) async {
    TextEditingController _namaPengeluaran = TextEditingController();
    TextEditingController _nominalPengeluaran = TextEditingController();
    TextEditingController _kategoriPengeluaran = TextEditingController();
    TextEditingController _tanggalPengeluaran = TextEditingController();
    if (_pengeluaran != null) {
      _namaPengeluaran.text = _pengeluaran.namaPengeluaran;
      _nominalPengeluaran.text = _pengeluaran.nominalPengeluaran.toString();
      _kategoriPengeluaran.text = _pengeluaran.kategoriPengeluaran;
      _tanggalPengeluaran.text = _pengeluaran.tanggalPengeluaran;
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 33, bottom: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBack(
                        blueMode: true,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "Edit Pengeluaran",
                        style: kOpenSans.copyWith(
                            fontSize: 16, fontWeight: bold, color: kBlack),
                      ),
                      Container(
                        width: 7.2.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.9.h,
                ),
                // NAMA PENGELUARAN
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Nama Pengeluaran",
                    inputController: _namaPengeluaran,
                    errorText:
                        _validated ? null : 'Nama Pengeluaran wajib diisi',
                  ),
                ),
                // NOMINAL
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Nominal",
                    inputController: _nominalPengeluaran,
                    errorText: _validated ? null : 'Nominal wajib diisi',
                  ),
                ),
                // KATEGORI
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Kategori",
                    inputController: _kategoriPengeluaran,
                    errorText: _validated ? null : 'Kategori wajib diisi',
                  ),
                ),
                // TANGGAL
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Tanggal",
                    inputController: _tanggalPengeluaran,
                    errorText: _validated ? null : 'Tanggal wajib diisi',
                    keyboardType: TextInputType.none,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099))
                          .then((date) {
                        if (date != null) {
                          initializeDateFormatting('id_ID', null);
                          String format =
                              DateFormat.yMMMMd('id_ID').format(date);
                          setState(() {
                            _tanggalPengeluaran.text = format;
                          });
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child: Text(
                      "Simpan Perubahan",
                      style: kOpenSans.copyWith(fontSize: 16, fontWeight: bold),
                    ),
                    onPressed: () async {
                      setState(() {
                        _namaPengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                        _nominalPengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                        _kategoriPengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                        _tanggalPengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                      });
                      if (_validated) {
                        _pengeluaran.namaPengeluaran = _namaPengeluaran.text;
                        _pengeluaran.nominalPengeluaran =
                            double.parse(_nominalPengeluaran.text);
                        _pengeluaran.kategoriPengeluaran =
                            _kategoriPengeluaran.text;
                        _pengeluaran.tanggalPengeluaran =
                            _tanggalPengeluaran.text;

                        try {
                          PengeluaranService()
                              .update(_pengeluaran)
                              .then((value) => ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text("Perubahan berhasil disimpan"),
                                    backgroundColor: kSuccess,
                                  )))
                              .then((value) {
                            setState(() {
                              namaPengeluaran.text = _namaPengeluaran.text;
                              nominalPengeluaran.text =
                                  _nominalPengeluaran.text;
                              kategoriPengeluaran.text =
                                  _kategoriPengeluaran.text;
                              tanggalPengeluaran.text =
                                  _tanggalPengeluaran.text;
                            });
                          });
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPrimary),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 12))),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    PengeluaranModel data =
        ModalRoute.of(context)!.settings.arguments as PengeluaranModel;
    final int? _id = data.id;

    namaPengeluaran.text = data.namaPengeluaran;
    nominalPengeluaran.text = data.nominalPengeluaran.toString();
    kategoriPengeluaran.text = data.kategoriPengeluaran;
    tanggalPengeluaran.text = data.tanggalPengeluaran;

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
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 60),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAMA PENGELUARAN
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama Pengeluaran',
                              style: kOpenSans.copyWith(
                                fontWeight: bold,
                                color: kBlack,
                              )),
                          TextField(
                            controller: namaPengeluaran,
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                    // NOMINAL
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nominal',
                              style: kOpenSans.copyWith(
                                fontWeight: bold,
                                color: kBlack,
                              )),
                          TextField(
                            controller: nominalPengeluaran,
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                    // KATEGORI PENGELUARAN
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kategori',
                              style: kOpenSans.copyWith(
                                fontWeight: bold,
                                color: kBlack,
                              )),
                          TextField(
                            controller: kategoriPengeluaran,
                            enabled: false,
                          ),
                        ],
                      ),
                    ),
                    // TANGGAL PENGELUARAN
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tanggal',
                              style: kOpenSans.copyWith(
                                fontWeight: bold,
                                color: kBlack,
                              )),
                          TextField(
                            controller: tanggalPengeluaran,
                            enabled: false,
                          ),
                        ],
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
                          onPressed: () => updateData(data),
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
                                                      kPrimary),
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
                                            onPressed: () => {
                                                  PengeluaranService()
                                                      .delete(data.id!)
                                                      .then((value) =>
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                            content: Text(
                                                                "Pengeluaran berhasil dihapus"),
                                                            backgroundColor:
                                                                kSuccess,
                                                          ))),
                                                  Navigator
                                                      .pushNamedAndRemoveUntil(
                                                          context,
                                                          DashboardScreen
                                                              .routeName,
                                                          (route) => false)
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
