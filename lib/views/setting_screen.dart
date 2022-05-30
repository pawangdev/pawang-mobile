import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(PurpleMode: true),
                  Text(
                    "Settings",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    padding: EdgeInsets.all(6),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 120,
                      width: 120,
                      child: Image.asset('assets/images/profile_blue.png')),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mu'adz Fathulloh",
                    style: kOpenSans.copyWith(
                        fontSize: 14, fontWeight: bold, color: kBlack),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: kPurple3,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.logout_rounded,
                                  color: kWhite,
                                ),
                              ),
                            ),
                            Text('Keluar',
                                style: kOpenSans.copyWith(
                                    fontSize: 14, fontWeight: semibold))
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        )
                      ],
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: const Color(0xFF737373),
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).canvasColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Text(
                                        'Keluar',
                                        style: kOpenSans.copyWith(
                                            color: kBlack,
                                            fontWeight: bold,
                                            fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Apakah anda yakin ingin keluar?',
                                        style: kOpenSans.copyWith(
                                            color: kGray,
                                            fontWeight: medium,
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 120, right: 120),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                fixedSize:
                                                    MaterialStateProperty.all(
                                                        const Size(60, 30)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kPrimary),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                'Ya',
                                                style: kOpenSans.copyWith(
                                                    color: kWhite,
                                                    fontWeight: semibold,
                                                    fontSize: 14),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pushNamed(context,
                                                      LandingScreen.routeName),
                                            ),
                                            OutlinedButton(
                                              child: Text(
                                                "Tidak",
                                                style: kOpenSans.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: bold,
                                                    color: kPrimary),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: OutlinedButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 4),
                                                side:
                                                    BorderSide(color: kPrimary),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
