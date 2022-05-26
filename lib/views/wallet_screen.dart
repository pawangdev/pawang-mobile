import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/add_category.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class WalletScreen extends StatelessWidget {
  static const String routeName = "/dompet";
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: BoxDecoration(
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
                  padding: EdgeInsets.only(top: 28, left: 32, right: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBack(PurpleMode: false),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/kategori.svg',
                            color: kWhite,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Dompet',
                            style: kOpenSans.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                                color: kWhite),
                          ),
                        ],
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
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(30),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Dompet',
                    style: kOpenSans.copyWith(
                      color: kPrimary,
                      fontWeight: semibold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rp. XXXXXXXX',
                    style: kOpenSans.copyWith(
                      color: kBlack,
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0.5,
                    blurRadius: 0.5,
                    offset: const Offset(1, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25.0),
        child: FloatingActionButton(
          backgroundColor: kWhite,
          onPressed: () {
            Navigator.pushNamed(context, AddWalletScreen.routeName);
          },
          tooltip: 'Tambah Dompet',
          splashColor: kPrimary,
          child: Icon(
            Icons.add,
            color: kPrimary,
          ),
        ),
      ),
    );
  }
}
