import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_modelclass.dart';
import 'package:influencer/admin_module/admin_archived/view/component/search_bar.dart';
import 'package:influencer/admin_module/contact_listfor_admin_startChat/model/contact_list_modelclass.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/common_app.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';

import 'component/contactlist_card_layout.dart';


class ContactListAdminStartChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        title: Text(Strings.contatti,style: TextStyle(color: Colors.black),),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.black,),
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              value: 1,
              child: Text("item 1"),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text("item 2"),
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
       
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
             search_bar(
                        title: Strings.archived_privatd_chating_searchbar),
            Container(
              // width: double.infinity,
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
                      // margin: EdgeInsets.only(bottom: Dimensions.height150),
                      //  width: double.infinity,
                      height: Get.size.height,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: contactListuserChats.length,
                        itemBuilder: (BuildContext context, int index) {
                          final ContactLIstUserDataMessage chat =
                              contactListuserChats[index];
                          return ContactListAdminStartChannelCardLayout(
                            chating: chat,
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