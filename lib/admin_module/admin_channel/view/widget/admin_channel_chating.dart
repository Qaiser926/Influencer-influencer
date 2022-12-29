import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_model.dart';
import 'package:influencer/admin_module/admin_channel/model/modelClass.dart';
import 'package:influencer/admin_module/admin_channel/model/user_model.dart';
import 'package:influencer/admin_module/admin_channel/view/component/canali_esistenti_search_bar.dart';
// import 'package:influencer/admin_module/admin_private_chat/view/component/admin_archived_chating_searchbar_layout.dart';
import 'package:influencer/routes/app_pages.dart';

import 'package:influencer/admin_module/profile/profile.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';


  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  final FocusNode focusNode = FocusNode();
class CanaliEsistentChatScreen extends StatefulWidget {
  final AdminArchivedUser? user;

  CanaliEsistentChatScreen({this.user});

  @override
  _CanaliEsistentChatScreenState createState() => _CanaliEsistentChatScreenState();
}

class _CanaliEsistentChatScreenState extends State<CanaliEsistentChatScreen> {


  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  
  }

  _chatBubble(AdminChannelMessage message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80,
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
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
                        radius: 15,
                        child: Image.asset(widget.user!.imageUrl.toString()),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: IColor.recieve_message_container_color,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      // child: CircleAvatar(
                      //   radius: 15,
                      //   backgroundColor: Colors.blue,
                      // ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  // _sendMessageArea() {
  //   return }

  @override
  Widget build(BuildContext context) {
    int? prevUserId;
    return WillPopScope(
      onWillPop: () {
        if (emojiShowing) {
          setState(() {
            emojiShowing = false;
          });
        } else {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
      
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                   appbar(),

                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.all(Dimensions.fontSize20),
                      itemCount: adminchannelmessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final AdminChannelMessage message = adminchannelmessages[index];
                        final bool isMe = message.sender.id == adminchannelUser.id;
                        final bool isSameUser = prevUserId == message.sender.id;
                        prevUserId = message.sender.id;
                        return _chatBubble(message, isMe, isSameUser);
                      },
                    ),
                  ),
                  // _sendMessageArea(),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.fontSize20),
                        child: Row(
                          children: [
                            CommonText(
                              title: widget.user!.name.toString(),
                              color: IColor.grey_color,
                            ),
                            SizedBox(
                              width: Dimensions.height4,
                            ),
                            CommonText(
                              title: Strings.sta_scrivendo,
                              color: IColor.grey_color,
                            )
                          ],
                        ),
                      )),
                CanaliEsistentiSearchBarLayout()
                
                  // emojiPicker()
               ],
              ),
            ],
          ),
        ),
      ),
    );
    
  }

  Container appbar() {
    return Container(
                  // color: Colors,
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
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              right: Dimensions.fontSize12),
                                          child: Icon(Icons.arrow_back))),
                                  SizedBox(
                                    width: Dimensions.sizedbox_width10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Get.to(Profile());
                                        },
                                        child: CircleAvatar(
                                          child: Image.asset(
                                              widget.user!.imageUrl.toString()),
                                          radius: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width8,
                                      ),
                                      online_offline_message(),
                                    ],
                                  )
                                ],
                              )),
                              Container(
                                child: Row(
                                  children: [
                                    InkWell(
                                       onTap: (){
                                        Get.toNamed(Paths.voiceCall);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.fontSize12),
                                        child: Icon(Icons.call,
                                            color: IColor.mainBlueColor),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Get.toNamed(Paths.adminPrivateVideocall);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.fontSize12),
                                        child: Icon(
                                          Icons.videocam_rounded,
                                          color: IColor.mainBlueColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text(Strings.oggi)
                    ],
                  ),
                );
  }

  RichText online_offline_message() {
    return RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: widget.user?.name,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                            TextSpan(text: '\n'),
                                            widget.user!.isOnline!
                                                ? TextSpan(
                                                    text: 'Online',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                : TextSpan(
                                                    text: 'Offline',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                          ],
                                        ),
                                      );
  }

 

}
