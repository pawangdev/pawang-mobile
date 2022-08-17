import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pawang_mobile/constants/theme.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white.withOpacity(0.5),
      child: const Center(
        child: SpinKitFadingCube(
          color: kPrimary,
          size: 50,
        ),
      ),
    );
  }
}
