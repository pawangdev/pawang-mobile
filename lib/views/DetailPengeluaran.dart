import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';

class DetailPengeluaran extends StatelessWidget {
  static const String routeName = "/detail";
  const DetailPengeluaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              Navigator.pushNamed(context, RiwayatScreen.routeName)
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
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: 'Makan Siang',
                                  suffixIcon: Icon(Icons.edit)),
                            ),
                          ],
                        ),
                      ),
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
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: '20000',
                                  suffixIcon: Icon(Icons.edit)),
                            ),
                          ],
                        ),
                      ),
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
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: 'Makan',
                                  suffixIcon: Icon(Icons.edit)),
                            ),
                          ],
                        ),
                      ),
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
                            const TextField(
                              decoration: InputDecoration(
                                  hintText: '12 April 2022',
                                  suffixIcon: Icon(Icons.edit)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                        style: kOpenSans.copyWith(fontSize: 16, fontWeight: bold),
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
