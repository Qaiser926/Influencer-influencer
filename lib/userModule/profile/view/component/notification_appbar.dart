import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/util/common_app.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';

class NotificationAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonApp(
      backFunction: () {
        Get.back();
      },
      backbtn: Icon(Icons.arrow_back),
      name: Strings.archiviati,
      sufixicon2: Icon(Icons.edit),
      popupmenu: PopupMenuButton(
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              child: Text("item 1"),
            ),
            const PopupMenuItem(
              child: Text("item 2"),
            ),
          ];
        },
      ),
    );
  }
}
