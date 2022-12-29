import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:influencer/admin_module/two_way_channel/model/two_way_user_model.dart';
import 'package:influencer/admin_module/two_way_channel/view/component/card_layout.dart';
import 'package:influencer/admin_module/two_way_channel/view/two_way_admin_channel.dart';
import 'package:influencer/admin_module/two_way_channel/view/widgets/detail_page.dart';
import 'package:influencer/routes/app_pages.dart';

import 'package:influencer/util/color.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';
class MobileContact extends StatefulWidget {
  const MobileContact({super.key});

  @override
  State<MobileContact> createState() => _MobileContactState();
}

class _MobileContactState extends State<MobileContact> {
 List<Contact>? _contacts;
  bool _permissionDenied = false;
   Contact? contact;

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => _contacts = contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: IColor.colorblack,)),
        backgroundColor:IColor.colorWhite,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(Strings.contatti,style: TextStyle(color: IColor.colorblack),),
        ),
      ),
      body:_body()
    );
  }
   Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    if (_contacts == null) return Center(child: CircularProgressIndicator());
    return ListView.builder(
        itemCount: _contacts!.length,
        itemBuilder: (context, i) => Padding(
          padding:  REdgeInsets.all(8.0),
          child: ListTile(
            onTap: (){
              // Get.toNamed(Paths.twoWayChating);
              Get.to(TwoWayChating(
                user: TwoWayUserModel(id: 1,imageUrl: ImageConstant.dummyImage2,isOnline: true,name: "qaiser"),
                // user: ,
              ));
            },
            leading: CircleAvatar(
              child: Text(_contacts![i].displayName[0]),
              radius: 25.r,
            ),
              title: Text(_contacts![i].displayName),
             
          )
        ));
  }
}
