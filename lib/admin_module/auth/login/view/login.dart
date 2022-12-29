import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/auth/registeration/view/registeration.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonbutton.dart';
import 'package:influencer/util/editText.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = Get.size.height;
    double w = Get.size.width;
    return GestureDetector(
       onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageConstant.auth_bg), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Column(
                
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.023),
                    child: Center(
                        child: Text(
                      "Accedi",
                      style: TextStyle(
                          color: IColor.colorWhite,
                          fontFamily: 'Poppins',
                          fontSize: h * 0.05,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
               
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Text(
                      "Email",
                      style: TextStyle(color: IColor.colorWhite),
                    ),
                  ),
    
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.026),
                    child: EditText(
                      hint: "La tua e-mail",
                      formvalidate: (value) {
                        if (value!.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                  ),
    
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                    child: Text(
                      "Password",
                      style: TextStyle(color: IColor.colorWhite),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.013,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.026),
                    child: EditText(
                      hint: "Password",
                      formvalidate: (value) {
                        if (value!.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.023,
                  ),
                  CommonButton(
                    title: Strings.login,
                    onpress: () {
                      Get.toNamed(Paths.bottomNavigationBarPage);
                    },
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Paths.forgotPassword);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(Strings.forgetpassword,
                              style: TextStyle(color: IColor.colorWhite))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          Strings.Alreadyaccount,
                          style: TextStyle(color: IColor.colorWhite),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(InfluencerForm());
                            },
                            child: const Text(Strings.Signup,
                                style: TextStyle(
                                    color: IColor.colorWhite,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
