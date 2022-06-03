import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KategoriScreen extends StatelessWidget {
  static const String routeName = "/kategori";
  const KategoriScreen({Key? key}) : super(key: key);

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
                            'assets/images/kategori.svg',
                            color: kWhite,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Kategori',
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
            Container(
              margin: const EdgeInsets.all(30),
              height: 8.4.h,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 0.5,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 6.4.h,
                  child: Row(
                    children: [
                      // ICON
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 12),
                        child: SvgPicture.asset(
                          'assets/images/makan_kategori.svg',
                          fit: BoxFit.cover,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          "Nama Kategori",
                          style: kOpenSans.copyWith(
                              fontSize: 0.245.dp,
                              fontWeight: semibold,
                              color: kSecondary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(25.0),
      //   child: FloatingActionButton(
      //     backgroundColor: kWhite,
      //     onPressed: () {
      //       Navigator.pushNamed(context, AddCategoryScreen.routeName);
      //     },
      //     tooltip: 'Tambah Kategori',
      //     splashColor: kPrimary,
      //     child: Icon(
      //       Icons.add,
      //       color: kPrimary,
      //     ),
      //   ),
      // ),
    );
  }
}
