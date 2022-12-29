import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/common_app.dart';
import 'package:influencer/util/string.dart';

class ChangePasswordAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CommonApp(
      name: Strings.reset_password,
      // topHeading: Strings.email,
      backbtn: Icon(Icons.arrow_back),
      backFunction: (){
        Get.back();
      },
    );
  }
}
