import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/userModule/user_contactti/model/contact_listModelClass.dart';
import 'package:influencer/util/dimension.dart';

class UserSideContattiUserCard extends StatelessWidget {
  const UserSideContattiUserCard({Key? key, required this.chat}) : super(key: key);
  final UserSideContacttiMessages chat;
  @override
  Widget build(BuildContext context) {
    double h=Get.size.height;
    double w=Get.size.width;
    return GestureDetector(
      onTap: () {
        //  Get.toNamed(Paths.chatscreen,arguments: {chat.sender,});
        //  Get.to(ChatScreen( user: chat.sender,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w*0.045,vertical: h*0.014),
        // padding: EdgeInsets.symmetric(
        //   horizontal: h*0.023,
        //   vertical: h*0.015,
        // ),
        child: InkWell(
          onTap: () {
            Get.toNamed(Paths.adminInfluencers);

          },
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(2),
                decoration: chat.unread
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(h*0.03)),
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                        // shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      )
                    : BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                child: CircleAvatar(
                  radius: h*0.03,
                  backgroundColor: Colors.green,
                  child: Image.asset(
                    chat.sender.imageUrl.toString(),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                padding: EdgeInsets.only(
                  left: Dimensions.fontSize20,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              chat.sender.name.toString(),
                              style: TextStyle(
                                fontSize: Dimensions.fontSize16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            chat.sender.isOnline!
                                ? Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    width: 7,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                : Container(
                                    child: null,
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
