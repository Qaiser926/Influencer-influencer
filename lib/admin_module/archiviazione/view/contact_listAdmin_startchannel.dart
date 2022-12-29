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


class Archiviazione extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){
          Get.back();
        },),
        title: Text(Strings.archiviazione,style: TextStyle(color: Colors.black),),
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
                          return ArchiviazioneCardLayout(
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