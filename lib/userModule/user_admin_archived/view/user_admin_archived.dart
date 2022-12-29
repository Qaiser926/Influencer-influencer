// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:influencer/userModule/user_admin_archived/model/admin_archived_modelclass.dart';
import 'package:influencer/userModule/user_admin_archived/view/component/user_admin_archived_card.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';

import 'component/user_search_bar.dart';

class UserSideAdminArchived extends StatefulWidget {
  const UserSideAdminArchived({Key? key}) : super(key: key);

  @override
  State<UserSideAdminArchived> createState() => _UserSideAdminArchivedState();
}

class _UserSideAdminArchivedState extends State<UserSideAdminArchived> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    double h=Get.size.height;
    double w=Get.size.width;
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        title: Text(Strings.chat,style: TextStyle(color: Colors.black),),
        actions: [
          GestureDetector(
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
           
          ];
        },
        onSelected: (item) {
          if (item == 1) {
          } else if (item == 2) {
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
             Usersidesearch_bar(title: Strings.searchhint),
            Container(

              width: double.infinity,
              height: Get.size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: h*0.04,
                          vertical: h*0.014),
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
                    
                      margin: EdgeInsets.only(bottom:h*0.04),
                      height: Get.size.height,
                      child: ListView.builder(
                        physics:const NeverScrollableScrollPhysics(),
                        itemCount: usersideadminarchivedChats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final UserSideAdminArchivedMessage chat =
                              usersideadminarchivedChats[index];
                          return UserSideAdminArchivedCard(
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
    );
  }


}

