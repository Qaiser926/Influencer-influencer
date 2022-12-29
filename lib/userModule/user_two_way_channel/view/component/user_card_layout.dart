
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:influencer/userModule/user_two_way_channel/model/two_way_modelclass.dart';
import 'package:influencer/userModule/user_two_way_channel/view/widgets/user_detail_page.dart';
import 'package:influencer/util/dimension.dart';

class UserSideTwoWayUserChannelCard extends StatelessWidget {
  const UserSideTwoWayUserChannelCard({Key? key,required this.chat}) : super(key: key);
  final UserSideTwoWayMessage chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                   onTap: (){
                    //  Get.toNamed(Paths.chatscreen,arguments: {chat.sender,});
                     Get.to(UserSideTwoWayChating( user: chat.sender,));
                   },
                     child: Container(
                       padding: EdgeInsets.symmetric(
                         horizontal: Dimensions.fontSize20,
                         vertical: Dimensions.height2,
                       ),
                       child: Row(
                         children: <Widget>[
                           Container(
                             padding: EdgeInsets.all(Dimensions.height2),
                             decoration: chat.unread
                                 ? BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(Dimensions.fontSize20*2)),
                                     border: Border.all(
                                       width: Dimensions.height2,
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
                               radius: Dimensions.fontSize17and5*2,
                               backgroundColor: Colors.green,
                               child: Image.asset(  chat.sender.imageUrl.toString(),),
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
                                             fontSize: 16,
                                             fontWeight: FontWeight.bold,
                                           ),
                                         ),
                                         chat.sender.isOnline!
                                             ? Container(
                                                 margin:  EdgeInsets.only(left: Dimensions.paddingvertical5),
                                                 width: Dimensions.padding_7half5,
                                                 height: Dimensions.padding_7half5,
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
                                     Column(
                                      
                                       children: [
                                           CircleAvatar(radius: Dimensions.fontSize12,
                                        child: Text( chat.num.toString()),),
                                         Text(
                                           chat.time,
                                           style: TextStyle(
                                             fontSize: Dimensions.fontSize12,
                                             fontWeight: FontWeight.w300,
                                             color: Colors.black54,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: Dimensions.paddingLeft10,
                                 ),
                                 Container(
                                   alignment: Alignment.topLeft,
                                   child: Text(
                                     chat.text,
                                     style: TextStyle(
                                       fontSize: Dimensions.fontSize12,
                                       color: Colors.black54,
                                     ),
                                     overflow: TextOverflow.ellipsis,
                                     maxLines: 2,
                                   ),
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