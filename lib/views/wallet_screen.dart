import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/services/wallet_service.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/wallet_card2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = "/dompet";
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late Future<WalletsModel> _wallets;

  @override
  void initState() {
    _wallets = WalletService().getWallets();
    super.initState();
  }

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
                  height: 13.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [kPrimary, kPurple])),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 28, left: 32, right: 32),
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
                        children: [
                          SvgPicture.asset(
                            'assets/images/wallet.svg',
                            color: kWhite,
                          ),
                          SizedBox(
                            height: 1.h,
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
                        width: 7.2.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.4.h,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: FutureBuilder(
                    future: _wallets,
                    builder: (context, AsyncSnapshot snapshot) {
                      var state = snapshot.connectionState;
                      if (state != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData) {
                          if (snapshot.data?.data.length != 0) {
                            return ListView.builder(
                              itemCount: snapshot.data!.data.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                var wallet = snapshot.data!.data[index];
                                return WalletCard2(
                                    name: wallet.name,
                                    balance: wallet.balance.toString());
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                              ),
                            );
                          } else {
                            return Center(
                              child: Text(
                                "Anda belum memiliki dompet",
                                style: kOpenSans.copyWith(
                                    color: kGray,
                                    fontSize: 13, //0.23.dp,
                                    fontWeight: medium),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }
                        } else {
                          return Center(
                            child: Text(
                              "Anda belum memiliki dompet",
                              style: kOpenSans.copyWith(
                                  color: kGray,
                                  fontSize: 13, //0.23.dp,
                                  fontWeight: medium),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddWalletScreen.routeName);
        },
        tooltip: 'Tambah Dompet',
        splashColor: kPrimary,
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kPrimary, kPurple])),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
