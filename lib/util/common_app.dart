import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/dimension.dart';

class CommonApp extends StatelessWidget {
 
  Widget? sufixicon1;
  Widget? sufixicon2;
  Widget? backbtn;
  Widget? popupmenu;
  Function()? backFunction;

  String name;
  CommonApp({
    Key? key,
    this.sufixicon1,
    this.sufixicon2,
    this.backFunction,
    required this.name,
    this.backbtn,
    this.popupmenu,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: Dimensions.height135,
      child: Column(
        children: [
        
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.fontSize16,
                vertical: Dimensions.paddingLeft10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      InkWell(
                          onTap: backFunction,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(right: Dimensions.fontSize12),
                              child: backbtn)),
                      SizedBox(
                        width: Dimensions.sizedbox_width10,
                      ),
                      CommonText(
                        title: name,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.fontSize12),
                          child: sufixicon1,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.fontSize12),
                          child: sufixicon2,
                        ),
                        Container(
                          child: popupmenu,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatingAppBar extends StatefulWidget {
  Widget? sufixicon1;
  String? sufixicon2;
  Widget? sufixicon3;
  Widget? popupmenu;
  Widget? backbtn;
  Color? backIconColor;
  Widget? avator;
  List<DropdownMenuItem<int>>? menuitem;
  Function()? backFunction;
  Function()? sufix2onpress;
  Function()? sufix1onpress;

  String name;
  ChatingAppBar({
    Key? key,
    this.sufixicon1,
    this.sufixicon2,
    this.popupmenu,
    this.backFunction,
   
    this.backIconColor,
    this.avator,
    this.menuitem,
    required this.name,
    this.sufixicon3,
    this.sufix2onpress,
    this.sufix1onpress,
    this.backbtn,
  }) : super(key: key);

  @override
  State<ChatingAppBar> createState() => _ChatingAppBarState();
}

class _ChatingAppBarState extends State<ChatingAppBar> {
    String dropdownvalue = 'Apple';

  var items =  ['Apple','Banana','Grapes','Orange','watermelon','Pineapple'];

  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: Dimensions.height135,
      child: Column(
        children: [
        
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.fontSize16,
                vertical: Dimensions.paddingLeft10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    children: [
                      InkWell(
                          onTap: widget.backFunction,
                          child: Padding(
                              padding:
                                  EdgeInsets.only(right: Dimensions.fontSize12),
                              child: widget.backbtn)),
                      SizedBox(
                        width: Dimensions.sizedbox_width10,
                      ),
                      Row(
                        children: [
                         Container(child: widget.avator,),
                         SizedBox(width: Dimensions.sizedboxWidth6,),
                          CommonText(
                            title: widget.name,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  )),
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: widget.sufix1onpress,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.fontSize12),
                            child: widget.sufixicon1,
                          ),
                        ),
                        InkWell(
                          onTap: widget.sufix2onpress,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: Dimensions.fontSize12),
                            child: SvgPicture.asset(widget.sufixicon2.toString(),)
                          ),
                        ),
                     Container(
                      child: widget.popupmenu,
                     )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
