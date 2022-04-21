import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/detail_image_struk_screen.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';
import 'package:pawang_mobile/widgets/InputField.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DetailPengeluaran extends StatefulWidget {
  static const String routeName = "/detail";
  const DetailPengeluaran({Key? key}) : super(key: key);

  @override
  State<DetailPengeluaran> createState() => _DetailPengeluaranState();
}

class _DetailPengeluaranState extends State<DetailPengeluaran> {
  TextEditingController nama_pengeluaran = TextEditingController();
  TextEditingController nominal_pengeluaran = TextEditingController();
  TextEditingController kategori_pengeluaran = TextEditingController();
  TextEditingController tanggal_pengeluaran = TextEditingController();
  bool _validated = true;
  bool _isEdited = false;

  // UPDATING DATA
  Future<void> updateData(PengeluaranModel _pengeluaran) async {
    TextEditingController _nama_pengeluaran = TextEditingController();
    TextEditingController _nominal_pengeluaran = TextEditingController();
    TextEditingController _kategori_pengeluaran = TextEditingController();
    TextEditingController _tanggal_pengeluaran = TextEditingController();
    if (_pengeluaran != null) {
      _nama_pengeluaran.text = _pengeluaran.nama_pengeluaran;
      _nominal_pengeluaran.text = _pengeluaran.nominal_pengeluaran.toString();
      _kategori_pengeluaran.text = _pengeluaran.kategori_pengeluaran;
      _tanggal_pengeluaran.text = _pengeluaran.tanggal_pengeluaran;
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 33, bottom: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Container(
                          width: 32,
                          height: 32,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: kPurple),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/back_btn.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
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
                        width: 22,
                        height: 32,
                        padding: EdgeInsets.all(6),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                // NAMA PENGELUARAN
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Nama Pengeluaran",
                    inputController: _nama_pengeluaran,
                    errorText:
                        _validated ? null : 'Nama Pengeluaran wajib diisi',
                  ),
                ),
                // NOMINAL
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Nominal",
                    inputController: _nominal_pengeluaran,
                    errorText: _validated ? null : 'Nominal wajib diisi',
                  ),
                ),
                // KATEGORI
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Kategori",
                    inputController: _kategori_pengeluaran,
                    errorText: _validated ? null : 'Kategori wajib diisi',
                  ),
                ),
                // TANGGAL
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: InputField(
                    inputLabel: "Tanggal",
                    inputController: _tanggal_pengeluaran,
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
                            _tanggal_pengeluaran.text = format;
                          });
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Simpan Perubahan",
                      style: kOpenSans.copyWith(fontSize: 16, fontWeight: bold),
                    ),
                    onPressed: () async {
                      setState(() {
                        _nama_pengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                        _nominal_pengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                        _kategori_pengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                        _tanggal_pengeluaran.text.isEmpty
                            ? _validated = false
                            : _validated = true;
                      });
                      if (_validated) {
                        _pengeluaran.nama_pengeluaran = _nama_pengeluaran.text;
                        _pengeluaran.nominal_pengeluaran =
                            double.parse(_nominal_pengeluaran.text);
                        _pengeluaran.kategori_pengeluaran =
                            _kategori_pengeluaran.text;
                        _pengeluaran.tanggal_pengeluaran =
                            _tanggal_pengeluaran.text;

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
                              nama_pengeluaran.text = _nama_pengeluaran.text;
                              nominal_pengeluaran.text =
                                  _nominal_pengeluaran.text;
                              kategori_pengeluaran.text =
                                  _kategori_pengeluaran.text;
                              tanggal_pengeluaran.text =
                                  _tanggal_pengeluaran.text;
                            });
                          });
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPurple),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                          ),
                        ),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 12))),
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

    nama_pengeluaran.text = data.nama_pengeluaran;
    nominal_pengeluaran.text = data.nominal_pengeluaran.toString();
    kategori_pengeluaran.text = data.kategori_pengeluaran;
    tanggal_pengeluaran.text = data.tanggal_pengeluaran;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: const BoxDecoration(
                    color: kPurple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 28, left: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: InkWell(
                          child: SvgPicture.asset(
                            'assets/images/back_btn.svg',
                            color: Colors.white,
                            fit: BoxFit.cover,
                          ),
                          onTap: () => {
                            Navigator.pushNamed(
                                context, RiwayatScreen.routeName)
                          },
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Detail Pengeluaran",
                              style: kOpenSans.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        padding: EdgeInsets.all(6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 60),
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NAMA PENGELUARAN
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama Pengeluaran',
                            style: kOpenSans.copyWith(
                              fontWeight: bold,
                              color: kBlack,
                            )),
                        TextField(
                          controller: nama_pengeluaran,
                          enabled: false,
                        ),
                      ],
                    ),
                  ),
                  // NOMINAL
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nominal',
                            style: kOpenSans.copyWith(
                              fontWeight: bold,
                              color: kBlack,
                            )),
                        TextField(
                          controller: nominal_pengeluaran,
                        ),
                      ],
                    ),
                  ),
                  // KATEGORI PENGELUARAN
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kategori',
                            style: kOpenSans.copyWith(
                              fontWeight: bold,
                              color: kBlack,
                            )),
                        TextField(
                          controller: kategori_pengeluaran,
                        ),
                      ],
                    ),
                  ),
                  // TANGGAL PENGELUARAN
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal',
                            style: kOpenSans.copyWith(
                              fontWeight: bold,
                              color: kBlack,
                            )),
                        TextField(
                          controller: tanggal_pengeluaran,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // BUTTONS
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              margin: EdgeInsets.only(bottom: 32),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // LIHAT STRUK
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, DetailImageStrukScreen.routeName,
                              arguments: data.filePath);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPurple),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorderRadius),
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(12))),
                        child: SvgPicture.asset(
                          'assets/images/receipt_btn.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // EDIT DATA
                      ElevatedButton(
                        onPressed: () => updateData(data),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPurple),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorderRadius),
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(12))),
                        child: SvgPicture.asset(
                          'assets/images/edit_btn.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // DELETE DATA
                      ElevatedButton(
                        onPressed: () => {
                          showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Hapus Pengeluaran'),
                              content: const Text(
                                  'Apakah kamu yakin akan menghapus pengeluaran ini?'),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Kembali'),
                                  child: Text('Kembali', style: kOpenSans.copyWith(color: kPurple)),
                                ),
                                TextButton(
                                  onPressed: () => {
                                    PengeluaranService().delete(data.id!).then(
                                        (value) => ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Pengeluaran berhasil dihapus"),
                                              backgroundColor: kSuccess,
                                            ))),
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RiwayatScreen.routeName,
                                        (route) => false)
                                  },
                                  child: Text('Hapus', style: kOpenSans.copyWith(color: kPurple)),
                                ),
                              ],
                            ),
                          ),
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPurple),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorderRadius),
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(12))),
                        child: SvgPicture.asset(
                          'assets/images/delete_btn.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
