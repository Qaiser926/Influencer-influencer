import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/view/component/search_bar.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/userModule/user_contactti/view/component/user_contactti_user_card.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/string.dart';

import '../../user_contactti/model/contact_listModelClass.dart';

class UserSideContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h=Get.size.height;
    double w=Get.size.width;
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Get.back();},icon: Icon(Icons.arrow_back,color: Colors.black,),),
        elevation: 0,
        title: Text(Strings.contatti,style: TextStyle(color: Colors.black),),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert,color: Colors.black,),
        itemBuilder: (context) {
          return [
            const PopupMenuItem(
              child: Text(Strings.muta_canale),
            ),
            const PopupMenuItem(
              child: Text(Strings.chiudi_canale),
            ),
          ];
        },
      ),
        ],
      ),
      backgroundColor: IColor.colorWhite,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ListView(
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
                              horizontal:h*0.025,
                              vertical: h*0.013),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                  title: Strings.tuoi_contactti,
                                  fontWeight: FontWeight.w500),
                              CommonText(
                                title: Strings.seleziona_tutto,
                                color: IColor.grey_color,
                              )
                            ],
                          ),
                        ),
                        Container(
                           margin: EdgeInsets.only(bottom: 30),
                          height: Get.size.height,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: usersidecontacttiChats.length,
                            itemBuilder: (BuildContext context, int index) {
                              final UserSideContacttiMessages chat =
                                  usersidecontacttiChats[index];
                              return UserSideContattiUserCard(
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
            Container(
                child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: h*0.04,
                  vertical: h*0.023),
              child: CircleAvatar(
                  backgroundColor: IColor.mainBlueColor,
                  radius: h*0.035,
                  child: InkWell(
                      onTap: () {
                        Get.toNamed(Paths.adminNewChannel);
                      },
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: IColor.colorWhite,
                        size: h*0.03
                      ))),
            ))
          ],
        ),
      ),
    );
  }
}
