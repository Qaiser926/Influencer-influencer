
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_modelclass.dart';
import 'package:influencer/admin_module/admin_archived/view/widgets/admin_archived_chating.dart';

class AdminArchivedCard extends StatelessWidget {
  const AdminArchivedCard({Key? key, required this.chat}) : super(key: key);
  final AdminArchivedMessage chat;

  @override
  Widget build(BuildContext context) {
    double h=Get.height;
    double w=Get.width;
    return GestureDetector(
      onTap: () {
        //  Get.toNamed(Paths.chatscreen,arguments: {chat.sender,});
        Get.to(AdminArchivedChatingPage(
          user: chat.sender,
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: h*0.023,
          vertical: h*0.003,
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(h*0.003),
              
              child: CircleAvatar(
                radius:h*0.042,
                backgroundColor: Colors.green,
                child: Image.asset(
                  chat.sender.imageUrl.toString(),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: EdgeInsets.only(
                left: h*0.015,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            chat.sender.name.toString(),textAlign: TextAlign.center,
                            style: TextStyle(

                              fontSize: h*0.015,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 11,
                            child: Center(child: Center(child: Text(chat.num.toString(),style: TextStyle(fontSize: 10),textAlign: TextAlign.center,))),
                          ),
                          Text(
                            chat.time.toString(),
                            style: TextStyle(
                              fontSize: h*0.012,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      chat.text.toString(),
                      style: TextStyle(
                        fontSize: h*0.013,
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
