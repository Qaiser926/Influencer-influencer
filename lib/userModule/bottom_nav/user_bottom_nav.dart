import 'package:flutter/material.dart';
import 'package:influencer/admin_module/admin_archived/view/admin_archived.dart';
import 'package:influencer/admin_module/bottom_nav/bottom_nav_layout.dart';
import 'package:influencer/admin_module/contactti/view/contactlsit.dart';
import 'package:influencer/admin_module/mobile_contact/mobile_contact.dart';
import 'package:influencer/admin_module/profile/profile.dart';
import 'package:influencer/admin_module/setting/user_setting.dart';
import 'package:influencer/admin_module/two_way_channel/view/two_way_admin_channel.dart';
import 'package:influencer/userModule/user_two_way_channel/view/user_two_way_admin_channel.dart';


class UserSideBottomNavigationBarPage extends StatefulWidget {
  // int? uid;
  // UserSideBottomNavigationBarPage({this.uid});
  @override
  State<UserSideBottomNavigationBarPage> createState() =>
      _UserSideBottomNavigationBarPageState();
}

class _UserSideBottomNavigationBarPageState extends State<UserSideBottomNavigationBarPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  String text = '0';
  bool select = true;
  final _bottomnavigationGlobalkey = GlobalKey();

  final PageStorageBucket bucket = PageStorageBucket();

  static List<Widget> _widgetOptions = <Widget>[
     UserSideTwoWayUserChannel(),
    const MobileContact(),
    // ContactList(),
    Profile(),
    // Profile(),
    // ContactListAdminStartChannel(),
    User_Setting()
   
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
