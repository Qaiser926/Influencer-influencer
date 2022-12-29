import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/controller/admin_archived_controller.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_model.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_modelclass.dart';
import 'package:influencer/admin_module/admin_archived/model/image_model.dart';
import 'package:influencer/admin_module/admin_archived/view/component/admin_archived_chating_searching.dart';
import 'package:influencer/admin_module/admin_archived/view/widgets/admin_archived_videocall.dart';
import 'package:influencer/admin_module/two_way_channel/view/widgets/twoway_chating_videocall.dart';
import 'package:influencer/routes/app_pages.dart';

import 'package:influencer/admin_module/profile/profile.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';
import 'package:flutter/foundation.dart' as foundation;

class AdminArchivedChatingPage extends StatefulWidget {
  final AdminArchivedUser? user;

  AdminArchivedChatingPage({this.user});

  @override
  _AdminArchivedChatingPageState createState() =>
      _AdminArchivedChatingPageState();
}

class _AdminArchivedChatingPageState extends State<AdminArchivedChatingPage> {
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  final AdminArchivedController adminArchivedController =
      Get.put(AdminArchivedController());

  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }
    FilePickerResult? result;
  PlatformFile? file;

  bool isbutton = false;

  _chatBubble( bool isSameUser,bool isMe,AdminArchivedMessage message, ) {
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
              margin: EdgeInsets.symmetric(vertical: 10.h),
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
              child: 
               Container(
                constraints: BoxConstraints(
                  maxHeight: 80.h,
                  maxWidth: MediaQuery.of(context).size.width * 0.80,
                ),
                child: 
                Text(
                  message.text.toString(),
                  style: const TextStyle(
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
                      message.time.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
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
                        radius: 15.r,
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
    }else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10.h),
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
              child: Column(
                children: [
                  Text(
                    message.text.toString(),
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
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
  // List<UserImage> userlist = [];
  @override
  Widget build(BuildContext context) {
    addImage(AdminArchivedMessage image) {
      setState(() {
        AdminArchiveMessages.add(image);
      });
    }

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
                    // flex: 100,
                    // fit: FlexFit.loose,
                    // height: Get.height*0.6,
                    child: ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      reverse: true,
                      padding: EdgeInsets.all(Dimensions.fontSize20),
                      itemCount: AdminArchiveMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        
                        final AdminArchivedMessage message = AdminArchiveMessages[index];
                         
                        final bool isMe = message.sender.id == adminarchivedcurrentuser.id;
                       
                        final bool isSameUser = prevUserId == message.sender.id;
                        
                        prevUserId = message.sender.id;
                        // return _chatBubble(isSameUser,isMe,message, );
                        return _chatBubble(isSameUser,isMe,message );
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
                              title: widget.user?.name.toString(),
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
                      
              
                  AdminArchivedChatingSearchBarLayout(
                    adduser: addImage,
                  )
                  
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
                              padding:
                                  EdgeInsets.only(right: Dimensions.fontSize12),
                              child: Icon(Icons.arrow_back))),
                      SizedBox(
                        width: Dimensions.sizedbox_width10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(Profile());
                            },
                            child: CircleAvatar(
                              child:
                                  Image.asset(widget.user!.imageUrl.toString()),
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
                          onTap: () {
                            Get.toNamed(Paths.voiceCall);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.fontSize12),
                            child:
                                Icon(Icons.call, color: IColor.mainBlueColor),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(TwowayChatingVideoCall());
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
                    fontWeight: FontWeight.w400,
                  ),
                )
              : TextSpan(
                  text: 'Offline',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                )
        ],
      ),
    );
  }
}
