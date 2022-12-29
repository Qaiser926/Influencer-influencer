import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_modelclass.dart';
import 'package:influencer/admin_module/contact_listfor_admin_startChat/model/contact_list_modelclass.dart';
import 'package:influencer/admin_module/contact_listfor_admin_startChat/view/widgets/userstartnew_oneto_one_chat.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';

class ContactListAdminStartChannelCardLayout extends StatefulWidget {
  ContactListAdminStartChannelCardLayout({Key? key, required this.chating})
      : super(key: key);
  final ContactLIstUserDataMessage chating;

  @override
  State<ContactListAdminStartChannelCardLayout> createState() => _ContactListAdminStartChannelCardLayoutState();
}

class _ContactListAdminStartChannelCardLayoutState extends State<ContactListAdminStartChannelCardLayout> {
  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //  Get.toNamed(Paths.chatscreen,arguments: {chat.sender,});
         Get.to(ContactListAdminChatingOneToOne( user: widget.chating.sender,));
        // Get.to(Paths.contactListAdminChatingOneToOne);
      },
      child: Container(

        padding: EdgeInsets.only(
          left: Dimensions.fontSize16,
          top: Dimensions.paddingLeft10,
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                radius: Dimensions.fontSize16 * 2,
                backgroundColor: IColor.mainBlueColor,
                child: Image.asset(
                  widget.chating.sender.imageUrl.toString(),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              padding: EdgeInsets.only(
                left: Dimensions.fontSize20,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.chating.sender.name.toString(),
                        style: TextStyle(
                          fontSize: Dimensions.fontSize16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            istrue=!istrue;
                          });
                        },
                        child: CommonText(
                            title: Strings.invita_ora,
                            color: IColor.colorWhite),
                        color:istrue? IColor.grey_color:IColor.mainBlueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.fontSize16)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
