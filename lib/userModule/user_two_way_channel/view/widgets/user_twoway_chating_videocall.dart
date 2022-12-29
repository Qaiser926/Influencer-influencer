import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:influencer/util/color.dart';
class TwowayChatingVideoCall extends StatefulWidget {
  const TwowayChatingVideoCall({Key? key}) : super(key: key);

  @override
  State<TwowayChatingVideoCall> createState() => _TwowayChatingVideoCallState();
}

class _TwowayChatingVideoCallState extends State<TwowayChatingVideoCall> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){Get.back();},),
      ),
      body: SafeArea(
        // child:_loading? Center(child: CircularProgressIndicator()):
        child: Container(
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding:  EdgeInsets.only(bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                     shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(

                        radius: 20.r,
                        backgroundColor: IColor.colorWhite,
                        child: Icon(Icons.mic,color: IColor.mainBlueColor,),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 26.r,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.call_end,color: IColor.colorWhite,),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: IColor.colorWhite,
                      child: Icon(Icons.switch_camera,color: IColor.mainBlueColor,),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: IColor.colorWhite,
                      child: Icon(Icons.videocam_rounded,color: IColor.mainBlueColor,),
                    ),
                  )
                  ],
                ),
              )
            ],
          ),
        )));
  }

}