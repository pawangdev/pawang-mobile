import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

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
                    color: kPurple,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
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
                            'Kategori',
                            style: kOpenSans.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                                color: kWhite),
                          ),
                        ],
                      ),
                      InkWell(
                        child: Icon(
                          Icons.filter_alt_sharp,
                          color: kWhite,
                        ),
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
              height: 80,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 0.5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
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
                              fontSize: 14,
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(25.0),
        child: FloatingActionButton(
          backgroundColor: kWhite,
          onPressed: () {},
          tooltip: 'Tambah Kategori',
          splashColor: kPurple,
          child: const Icon(
            Icons.add,
            color: kPurple,
          ),
        ),
      ),
    );
  }
}
