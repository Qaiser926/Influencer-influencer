
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/util/color.dart';

class CommonButton extends StatelessWidget {

String title;
Function() onpress;
   CommonButton({
    Key? key,
    required this.title,
    required this.onpress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double h=Get.size.height;
    double w=Get.size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:h*0.026,),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.007)),
        height: h*0.07,
         minWidth: double.infinity,
        onPressed: onpress,child: Text(title,
      style: TextStyle(color: IColor.colorWhite)),color: IColor.mainBlueColor,),
    );
  }
}