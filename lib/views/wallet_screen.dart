import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/services/wallet_service.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
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
                  height: MediaQuery.of(context).size.height * 0.11,
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
                                fontSize: 0.253.dp,
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
                    builder: (context, AsyncSnapshot<WalletsModel> snapshot) {
                      var state = snapshot.connectionState;
                      if (state != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.data.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.data[index].name,
                                      style: kOpenSans.copyWith(
                                        color: kPrimary,
                                        fontWeight: semibold,
                                        fontSize: 0.26.dp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.4.h,
                                    ),
                                    Text(
                                      'Rp. ${snapshot.data!.data[index].balance}',
                                      style: kOpenSans.copyWith(
                                        color: kBlack,
                                        fontWeight: medium,
                                        fontSize: 0.245.dp,
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0.5,
                                      blurRadius: 0.5,
                                      offset: const Offset(
                                          1, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                            ),
                          );
                        } else {
                          return const Text("");
                        }
                      }
                    },
                  )),
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
          child: const Icon(
            Icons.add,
            color: kPrimary,
          ),
        ),
      ),
    );
  }
}
