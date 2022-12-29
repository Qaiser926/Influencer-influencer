// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/commonbutton.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:Colors.grey,
      body:DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageConstant.splash),fit: BoxFit.cover)
        ),
        // width: double.infinity,
        // height: double.infinity,
        child: Column(
          children: [
                 Spacer(),
              CommonText(title: 'Benvenuto in', size: 25.sp),
              CommonText(
                  title: 'Influencer Club',
                  color: IColor.colorblack,
                  fontWeight: FontWeight.bold,
                  size: 25.sp),
              Spacer(),
              Container(
                child: Column(
                  children: [
                 
                      MaterialButton(
                        minWidth: 300.w,
                        height: 40.h,
                        color: IColor.mainBlueColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        onPressed: (){
                        Get.toNamed(Paths.influencerForm);
                      },child: Text(Strings.ISCRIVITI_ORA,style: TextStyle(color: Colors.white),),),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.Hai_gia_account),
                        TextButton(
                            onPressed: () {
                              Get.offNamed(Paths.loginView);
                            }, child: Text(Strings.accedi)),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 60.h,)
            
          ],
        ),

      )
    );
  }
}
