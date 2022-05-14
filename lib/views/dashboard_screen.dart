import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/widgets/LayananCard.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SvgPicture.asset('assets/images/profile.svg'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hallo,",
                        style: kOpenSans.copyWith(
                            fontSize: 12, fontWeight: bold, color: kBlack),
                      ),
                      Text("Mu'adz Fathulloh",
                          style: kOpenSans.copyWith(
                              fontSize: 12, fontWeight: medium, color: kBlack))
                    ],
                  ),
                ),
              ]),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saldo',
                      style: kOpenSans.copyWith(
                        color: kWhite,
                        fontWeight: medium,
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
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Layanan',
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LayananCard(
                        icon: 'assets/images/pemasukan.svg',
                        title: 'Pemasukan',
                      ),
                      LayananCard(
                        icon: 'assets/images/pengeluaran.svg',
                        title: 'Pengeluaran',
                      ),
                      LayananCard(
                        icon: 'assets/images/kategori.svg',
                        title: 'Kategori',
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
