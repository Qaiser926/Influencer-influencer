import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:influencer/userModule/profile/view/component/notification_appbar.dart';
import 'package:influencer/util/string.dart';


class UserNotification extends StatefulWidget {
  const UserNotification({Key? key}) : super(key: key);

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  bool status = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  bool status7 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,

        centerTitle: true,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text(Strings.notifiche,style: TextStyle(color: Colors.black,),),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18,top:30),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifiche Push',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
           padding: EdgeInsets.symmetric(horizontal:18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Messaggi',style: TextStyle(fontSize: 18,),),
                      Switch(
                        value: status2,
                      onChanged: (value){
                        setState(() {
                          status2 = value;
                        });
                      },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Attivita account',style: TextStyle(fontSize: 18,),),
                      Switch(
                        value: status3,
                        onChanged: (value){
                          setState(() {
                            status3 = value;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Annunci',style: TextStyle(fontSize: 18,),),
                      Switch(value: status4,
                        onChanged: (value){
                          setState(() {
                            status4 = value;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Messaggi',style: TextStyle(fontSize: 18,),),
                      Switch(
                        value: status5,
                        onChanged: (value){
                          setState(() {
                            status5 = value;
                          });
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Raccomandazioni',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Messaggi',style: TextStyle(fontSize: 18,),),
                      Switch(value: status6,
                        onChanged: (value){
                          setState(() {
                            status6 = value;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Attivita account',style: TextStyle(fontSize: 18,),),
                      Switch(value: status7,
                        onChanged: (value){
                          setState(() {
                            status7 = value;
                          });
                        },
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
