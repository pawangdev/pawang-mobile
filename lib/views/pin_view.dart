import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/loading.dart';
import 'package:pawang_mobile/widgets/pin_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PinView extends StatelessWidget {
  const PinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    var selectedindex = 1;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: _isLoading
            ? const Loading()
            : Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 33.0, horizontal: 32.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconBack(
                            blueMode: true,
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        Text(
                          "Buat PIN",
                          style: kOpenSans.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: defaultBlack),
                        ),
                        Container(
                          width: 7.2.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SvgPicture.asset(
                      'assets/images/pin.svg',
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinInput(
                          index: 0,
                          selectedIndex: selectedindex,
                        ),
                        PinInput(
                          index: 1,
                          selectedIndex: selectedindex,
                        ),
                        PinInput(
                          index: 2,
                          selectedIndex: selectedindex,
                        ),
                        PinInput(
                          index: 3,
                          selectedIndex: selectedindex,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
