
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/commonbutton.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';
import 'package:pinput/pinput.dart';

import 'component/verification_appbar.dart';


class VerifyConfirmation extends StatefulWidget {


  @override
  State<VerifyConfirmation> createState() => _VerifyConfirmationState();
}

class _VerifyConfirmationState extends State<VerifyConfirmation> {

  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  final focusNode = FocusNode();
  
  //   String verificationId;
  final controller = TextEditingController();

  // final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(30, 60, 87, 1);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(
        fontSize: 22,
        color:  Colors.white,
      ),
      decoration: const BoxDecoration(
        
      ),
    );
    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Colors.white,
      border: Border.all(color: IColor.mainBlueColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      
      decoration: defaultPinTheme.decoration?.copyWith(
        
          color: IColor.mainBlueColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
    var code = '';
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
          
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                    VerificationAppBar(),
                  SizedBox(
                    height: Dimensions.height65,
                  ),
                  //  Spacer(),
                  CommonText(
                    title: Strings.get_code,
                    color: IColor.colorblack,
                    size: Dimensions.height30,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(
                    height: Dimensions.fontSize20,
                  ),
                  
                  CommonText(
                    title: Strings.please_enter_4_code,
                    color: IColor.colorblack,
                    size: Dimensions.fontSize16,
                    fontWeight: FontWeight.w400,
                  ),  CommonText(
                    title: Strings.send_email_address,
                    color: IColor.colorblack,
                    size: Dimensions.fontSize16,
                    fontWeight: FontWeight.w400,
                  ),
               
                   SizedBox(height: Get.size.height*0.12,),
                  Pinput(
                    
                      onChanged: (value){
                  code=value;
                },
                    length: 4,
                    focusedPinTheme: focusedPinTheme,
                    // autofocus: true,
                    submittedPinTheme: submittedPinTheme,
                    validator: (s) {
                      // return s == controller ? null : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    
                    onCompleted: (pin) => print(pin),
                  ),
                  SizedBox(height: Get.size.height*0.08,),
                       Padding(
            padding: EdgeInsets.only(bottom: Dimensions.fontSize22),
            child: CommonButton(
                title: Strings.verify_proced,
                onpress: () async {
                  Get.offNamed(Paths.changePasswordSeccessfull);
                //   // Navigator.pushNamed(context, 'phone_login');
                }),
          )
                ],
              ),
            ),
          )),
    );
  }
}
