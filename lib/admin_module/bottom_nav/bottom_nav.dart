import 'package:flutter/material.dart';
import 'package:influencer/admin_module/admin_archived/view/admin_archived.dart';
import 'package:influencer/admin_module/bottom_nav/bottom_nav_layout.dart';
import 'package:influencer/admin_module/canali/view/canali_view.dart';
import 'package:influencer/admin_module/contactti/view/contactlsit.dart';
import 'package:influencer/admin_module/mobile_contact/mobile_contact.dart';
import 'package:influencer/admin_module/profile/profile.dart';
import 'package:influencer/admin_module/setting/user_setting.dart';
import 'package:influencer/admin_module/two_way_channel/view/two_way_admin_channel.dart';


import '../contact_listfor_admin_startChat/view/contact_listAdmin_startchannel.dart';

class BottomNavigationBarPage extends StatefulWidget {
  int? uid;
  BottomNavigationBarPage({this.uid});
  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  String text = '0';
  bool select = true;
  final _bottomnavigationGlobalkey = GlobalKey();

  final PageStorageBucket bucket = PageStorageBucket();

  static List<Widget> _widgetOptions = <Widget>[
     TwoWayUserChannel(),
    // const MobileContact(),
    AdminCanali(),
    // ContactList(),
   
    // Profile(),
    // ContactListAdminStartChannel(),
    // User_Setting(),
    MobileContact(),
     Profile(),
   
    // FavScreen(),
  ];

  Widget currenScreen = TwoWayUserChannel();

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(),

      bottomNavigationBar: TabBarMaterialWidgets(
        index: currentIndex,
        onChangedTab: onChangeTab,
      ),

      body: _widgetOptions[currentIndex],
    );
  }

  void onChangeTab(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }

  bool isSelect = false;
  bool selected = true;
  String code = 'USD';
}
