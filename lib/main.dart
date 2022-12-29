
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:influencer/routes/app_routes.dart';

import 'userModule/bottom_nav/user_bottom_nav.dart';


void main() {
  runApp(const Influencer());
}



class Influencer extends StatelessWidget {
  const Influencer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return   GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Poppins'
          ),
          title: 'Influencer',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          // home: UserSideBottomNavigationBarPage(),
        );
      },
    );
  }
}
