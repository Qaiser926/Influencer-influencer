import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/common_app.dart';
import 'package:influencer/util/string.dart';

class ForgotAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CommonApp(
      name: Strings.forgor_password,
      // topHeading: Strings.forgor_password,
      backbtn: Icon(Icons.arrow_back),
      backFunction: (){
        Get.back();
      },
    );
  }
}
