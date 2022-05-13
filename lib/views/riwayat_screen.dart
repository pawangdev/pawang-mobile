import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/widgets/CardPengeluaran.dart';

class RiwayatScreen extends StatefulWidget {
  static const String routeName = '/riwayat';
  RiwayatScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  late Future dataPengeluaran;

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    setState(() {
      dataPengeluaran = PengeluaranService().read();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            children: [
              Row(
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
                      Navigator.pushNamed(context, LandingScreen.routeName);
                    },
                  ),
                  Text(
                    "Riwayat",
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
              const SizedBox(
                height: 31,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo',
                      style: kOpenSans.copyWith(
                        color: kWhite,
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Rp. XXXXXXXX',
                      style: kOpenSans.copyWith(
                        color: kWhite,
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: kPurple,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: dataPengeluaran,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length != 0) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DetailPengeluaran.routeName,
                                  arguments: snapshot.data[index]);
                            },
                            child: CardPengeluaran(data: snapshot.data[index]),
                          );
                        },
                        itemCount: snapshot.data?.length,
                      );
                    } else {
                      return Expanded(
                        child: Center(
                            child: Text(
                          "Anda belum memiliki pengeluaran. Silahkan scan struk belanja Anda melalui tombol di bawah ini.",
                          style: kOpenSans.copyWith(
                              color: kGray, fontSize: 14, fontWeight: medium),
                          textAlign: TextAlign.center,
                        )),
                      );
                    }
                  } else {
                    return Expanded(
                      child: Center(
                          child: Text(
                        "Anda belum memiliki pengeluaran. Silahkan scan struk belanja Anda melalui tombol di bawah ini.",
                        style: kOpenSans.copyWith(
                            color: kGray, fontSize: 14, fontWeight: medium),
                        textAlign: TextAlign.center,
                      )),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ScanStruk.routeName);
        },
        child: SvgPicture.asset('assets/images/scan_btn.svg'),
        backgroundColor: kPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
