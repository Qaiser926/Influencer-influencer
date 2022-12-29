
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: Container(
      width: Get.size.width,
      height: Get.size.height,
      decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
                                Color(0xffF392E3),
                                Color(0xffDA96E6),
                                Color(0xffC199E9),
                                Color(0xff8DA1F0),
                                Color(0xff63A8F6),
                                Color(0xff3EADFC),
                              ]),
      ),
     ),
    );
  }
}
