import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PinInput extends StatelessWidget {
  const PinInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.w,
      width: 7.w,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFF2685D9)),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              // color: _selectedIndex
              //     ? Colors.lightBlue
              //     : Colors.transparent,
              color: Colors.transparent,
              offset: Offset(0, 0),
              spreadRadius: 1.5,
              blurRadius: 2,
            )
          ]),
      child: Container(),
      // filledIndex
      // ? Container(
      //     width: 15,
      //     height: 15,
      //     decoration: BoxDecoration(
      //       color: Colors.black.withBlue(40),
      //       shape: BoxShape.circle,
      //     ),
      //   )
      // : Container(),
    );
  }
}
