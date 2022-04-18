import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';

class DetailPengeluaran extends StatefulWidget {
  static const String routeName = "/detail";
  const DetailPengeluaran({Key? key}) : super(key: key);

  @override
  State<DetailPengeluaran> createState() => _DetailPengeluaranState();
}

class _DetailPengeluaranState extends State<DetailPengeluaran> {
  final TextEditingController nama_pengeluaran = TextEditingController();
  final TextEditingController nominal_pengeluaran = TextEditingController();
  final TextEditingController kategori_pengeluaran = TextEditingController();
  final TextEditingController tanggal_pengeluaran = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as PengeluaranModel;
    nama_pengeluaran.text = data.nama_pengeluaran;
    nominal_pengeluaran.text = data.nominal_pengeluaran.toString();
    kategori_pengeluaran.text = data.kategori_pengeluaran;
    tanggal_pengeluaran.text = data.tanggal_pengeluaran;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.100,
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
                          width: MediaQuery.of(context).size.width - 100,
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
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(top: 58),
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
                              decoration:
                                  InputDecoration(suffixIcon: Icon(Icons.edit)),
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
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.edit)),
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
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.edit)),
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
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.edit)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // BUTTON LIHAT STRUK
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  margin: EdgeInsets.only(bottom: 32),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPurple),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(kDefaultBorderRadius),
                          ),
                        ),
                      ),
                      child: Text(
                        "Lihat Struk",
                        style:
                            kOpenSans.copyWith(fontSize: 16, fontWeight: bold),
                      ),
                    ),
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
