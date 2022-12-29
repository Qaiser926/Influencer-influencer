import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/image_const.dart';

class TabBarMaterialWidgets extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;

  TabBarMaterialWidgets({required this.index, required this.onChangedTab});

  @override
  State<TabBarMaterialWidgets> createState() => _TabBarMaterialWidgetsState();
}

class _TabBarMaterialWidgetsState extends State<TabBarMaterialWidgets> {
  final placeHolder = Opacity(
    opacity: 0,
    child: IconButton(onPressed: () {}, icon: Icon(Icons.no_cell)),
  );

  @override
  Widget build(BuildContext context) {
    double h = Get.size.height;
    double w = Get.size.width;
    return BottomAppBar(

        // shape: CircularNotchedRectangle(),
        // notchMargin: 8,
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildTabItem(icon: ImageConstant.botm_nav_search_grey_img, index: 0),
        buildTabItem(icon: ImageConstant.botm_nav_menu_icon, index: 1),
        // placeHolder,
        buildTabItem(icon: ImageConstant.unselect_persion_icon, index: 2),
        buildTabItem(icon: ImageConstant.unselect_setting_icon, index: 3),
      ],
    ));
  }

  Widget buildTabItem({
    required int index,
    required String icon,
    Color? color,
    // required Widget title,
  }) {
    final isSelect = index == widget.index;
    return IconTheme(
      data: IconThemeData(color: isSelect ? Colors.red : Colors.black),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.size.height * 0.01,
            vertical: Get.size.height * 0.01),
        child: IconButton(
          icon: SvgPicture.asset(
            icon,
            color: isSelect ? IColor.mainBlueColor : IColor.grey_color,
            width: 20,
            height: 20,
          ),
          onPressed: () => widget.onChangedTab(index),
        ),
      ),
    );
  }
}
