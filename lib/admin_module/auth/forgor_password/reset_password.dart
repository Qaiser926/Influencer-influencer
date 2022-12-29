import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/auth/forgor_password/component/change_password_appbar.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/commonbutton.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';

class ChangePasswordSeccessfull extends StatefulWidget {
  const ChangePasswordSeccessfull({Key? key}) : super(key: key);

  @override
  State<ChangePasswordSeccessfull> createState() =>
      _ChangePasswordSeccessfullState();
}

class _ChangePasswordSeccessfullState extends State<ChangePasswordSeccessfull> {
  var phone = '';
  GlobalKey<FormState> _formKey = GlobalKey();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Form(
        key: _key,
        child: Column( children: [
            ChangePasswordAppBar(),
           
            // SizedBox(
            //   height: Get.size.height * 0.2,
            // ),
            Spacer(),
            CommonText(
        title: Strings.enter_new_pasword,
        color: IColor.colorblack,
        size: Dimensions.fontSize22,
        fontWeight: FontWeight.w800,
            ),
            SizedBox(
        height: Dimensions.height30,
            ),
           
            CommonText(
        title: Strings.must_different_password,
        color: IColor.colorblack,
        size: Dimensions.fontSize18,
        fontWeight: FontWeight.w400,
            ),
        CommonText(
        title: Strings.from_previously_used_password,
        color: IColor.colorblack,
        size: Dimensions.fontSize18,
        fontWeight: FontWeight.w400,
            ),
            SizedBox(
        height: Dimensions.fontSize18,
            ),
            editText(Strings.email,Icon(Icons.email),false),
            SizedBox(
        height: Dimensions.fontSize18,
            ),
            editText(Strings.password ,Icon(Icons.lock),true),
            SizedBox(
        height: Get.size.height * 0.025,
            ),
            Padding(
        padding: EdgeInsets.only(bottom: Dimensions.fontSize22),
        child: CommonButton(
            title: Strings.continouse,
            onpress: () async {
              Get.toNamed(Paths.bottomNavigationBarPage);
            }),
            ),
             Spacer(),
          ]),
      )),
    );
  }

  Padding editText(String title,Widget icon,bool obscuretext) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.border13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: Get.size.width - 27,
              child: TextFormField(
                obscureText: obscuretext,
                cursorColor: Color(0xff424242),
                enableSuggestions: false,
                // controller: phoneController,
                onChanged: (value) {
                  phone = value;
                },
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                decoration: InputDecoration(
                  prefixIcon:icon ,
                    labelText: title,
                    labelStyle: TextStyle(
                      color: IColor.colorblack,
                      fontSize: Dimensions.fontSize14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.fontSize12),
                      borderSide: BorderSide(
                        color: IColor.colorWhite,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: IColor.mainBlueColor,
                        width: 1.5,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        vertical: Dimensions.fontSize18,
                        horizontal: Dimensions.border13),

                    // filled: true,
                    fillColor: const Color(0xffF2F2F3),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.fontSize20),
                      gapPadding: 5.0,
                    )),
                style: const TextStyle(
                    color: IColor.colorblack, fontFamily: 'productsan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
