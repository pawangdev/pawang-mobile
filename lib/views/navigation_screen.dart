import 'package:flutter/material.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/setting_screen.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NavigationScreen extends StatefulWidget {
  static const String routeName = '/navigation-screen';

  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screenList = <Widget>[
    const DashboardScreen(),
    const ScanStruk(),
    const SettingsScreen(),
  ];

  void _onTapPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 8.h,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                    text: "Beranda",
                    iconEnable: "assets/images/home1.png",
                    iconDisable: "assets/images/home2.png",
                    selected: _selectedIndex == 0 ? true : false,
                    onPressed: () {
                      _onTapPage(0);
                    }),
                IconBottomBar(
                    text: "Scan Struk",
                    iconEnable: "assets/images/scan1.png",
                    iconDisable: "assets/images/scan2.png",
                    selected: _selectedIndex == 1 ? true : false,
                    onPressed: () {
                      _onTapPage(1);
                    }),
                IconBottomBar(
                    text: "Pengaturan",
                    iconEnable: "assets/images/setting1.png",
                    iconDisable: "assets/images/setting2.png",
                    selected: _selectedIndex == 2 ? true : false,
                    onPressed: () {
                      _onTapPage(2);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
