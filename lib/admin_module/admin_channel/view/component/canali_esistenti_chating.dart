
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_modelclass.dart';
import 'package:influencer/admin_module/admin_channel/view/widget/admin_channel_chating.dart';
import 'package:influencer/util/dimension.dart';

class canali_esistentiChatCard extends StatelessWidget {
  const canali_esistentiChatCard({Key? key,required this.chat}) : super(key: key);
  final AdminArchivedMessage chat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                   onTap: (){
                    //  Get.toNamed(Paths.chatscreen,arguments: {chat.sender,});
                     Get.to(CanaliEsistentChatScreen( user: chat.sender,));
                   },
                     child: Container(
                       padding: EdgeInsets.symmetric(
                         horizontal: 20,
                         vertical: 15,
                       ),
                       child: Row(
                         children: <Widget>[
                           Container(
                             padding: EdgeInsets.all(2),
                             decoration: chat.unread
                                 ? BoxDecoration(
                                     borderRadius: BorderRadius.all(Radius.circular(40)),
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
                               radius: 35,
                               backgroundColor: Colors.green,
                               child: Image.asset(  chat.sender.imageUrl.toString(),),
                             ),
                           ),
                           Container(
                             width: MediaQuery.of(context).size.width * 0.65,
                             padding: EdgeInsets.only(
                               left: 20,
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
                                     Column(
                                      
                                       children: [
                                           CircleAvatar(radius: Dimensions.fontSize12,
                                        child: Text( chat.num.toString()),),
                                         Text(
                                           chat.time.toString(),
                                           style: TextStyle(
                                             fontSize: 11,
                                             fontWeight: FontWeight.w300,
                                             color: Colors.black54,
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: 10,
                                 ),
                                 Container(
                                   alignment: Alignment.topLeft,
                                   child: Text(
                                     chat.text.toString(),
                                     style: TextStyle(
                                       fontSize: 13,
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