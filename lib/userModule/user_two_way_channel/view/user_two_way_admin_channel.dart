import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/view/component/search_bar.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/userModule/user_two_way_channel/model/two_way_modelclass.dart';
import 'package:influencer/userModule/user_two_way_channel/view/component/user_card_layout.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';

void _moveToScreen2(BuildContext context) =>
    Navigator.pushReplacementNamed(context, "screen2");
class UserSideTwoWayUserChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>onbackpress(context),
      child: Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        title: Text(Strings.chat,style: TextStyle(color: Colors.black),),
        actions: [
          GestureDetector(
            onTap: (){Get.toNamed(Paths.mobileContact);},
            child: SvgPicture.asset( ImageConstant.edit_img)),
        PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.black,),
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 1,
              child: Text(Strings.nuova_chat),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text(Strings.nuova_gruppo),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text(Strings.canali_esistenti),
            ),
            const PopupMenuItem(
              value: 4,
              child: Text(Strings.chat_archivaiate),
            ),
            const PopupMenuItem(
              value: 5,
              child: Text(Strings.impostaziani),
            ),
          ];
        },
        onSelected: (item) {
          if (item == 1) {
            Get.toNamed(Paths.contactListAdminStartChannel);
            
          } else if (item == 2) {
            Get.toNamed(Paths.contactList);
          } else if (item == 3) {
            Get.toNamed(Paths.canaliEsistentiScreen);
          } else if (item == 4) {
            Get.toNamed(Paths.adminArchived);
          } else if (item == 5) {
            Get.toNamed(Paths.user_Setting);
          }
        },
      ),
      
        ],
       ),
       
        backgroundColor: IColor.colorWhite,
        body: SafeArea(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
          
              search_bar(
                          title: Strings.archived_privatd_chating_searchbar),
              Container(
                width: double.infinity,
                height: Get.size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                     
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.fontSize20,
                            vertical: Dimensions.fontSize12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                                title: Strings.message,
                                fontWeight: FontWeight.w500),
                            CommonText(
                              title: Strings.vedi_tutto,
                              color: IColor.grey_color,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height150),
                        //  width: double.infinity,
                        height: Get.size.height,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: usersideTwoWayChats.length,
                          itemBuilder: (BuildContext context, int index) {
                            final UserSideTwoWayMessage chat =
                                usersideTwoWayChats[index];
                            return UserSideTwoWayUserChannelCard(
                              chat: chat,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  
Future<bool>  onbackpress(BuildContext context) async{
  bool exitApp=await showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text('close app'),
      content: Text('Do want to close app '),
   actions: [
    TextButton(onPressed: (){Navigator.of(context).pop(false);}, child: Text('No')),
    TextButton(onPressed: (){Navigator.of(context).pop(true);}, child: Text('Yes')),
   ],

    );
    
    
  });
return exitApp??false;
  }
}