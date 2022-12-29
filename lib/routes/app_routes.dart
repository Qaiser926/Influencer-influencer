import 'package:get/get.dart';
import 'package:influencer/admin_module/admin_archived/view/admin_archived.dart';
import 'package:influencer/admin_module/canali/view/canali_view.dart';
import 'package:influencer/admin_module/location/get_location.dart';
import 'package:influencer/admin_module/mobile_contact/mobile_contact.dart';
import 'package:influencer/admin_module/profile/profile.dart';

import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/admin_module/canali/view/widgets/twoway_chating_videocall.dart';
import 'package:influencer/userModule/user_admin_archived/view/user_admin_archived.dart';
import 'package:influencer/userModule/user_contact_listfor_admin_startChat/view/user_contact_listAdmin_startchannel.dart';
import 'package:influencer/userModule/user_contactti/view/contactlsit.dart';
import 'package:influencer/userModule/user_two_way_channel/view/user_two_way_admin_channel.dart';

import '../admin_module/admin_archived/view/component/googlemap.dart';
import '../admin_module/admin_archived/view/component/number_picker.dart';
import '../admin_module/admin_archived/view/widgets/audioCall.dart';
import '../admin_module/admin_channel/view/widget/admin_channel_chating.dart';
import '../admin_module/admin_channel/canali_asistenti.dart';
import '../admin_module/auth/forgor_password/forgot_password.dart';
import '../admin_module/auth/forgor_password/reset_password.dart';
import '../admin_module/auth/forgor_password/verification.dart';
import '../admin_module/auth/login/view/login.dart';
import '../admin_module/auth/registeration/view/registeration.dart';
import '../admin_module/bottom_nav/bottom_nav.dart';
import '../admin_module/contact_listfor_admin_startChat/view/contact_listAdmin_startchannel.dart';
import '../admin_module/contact_listfor_admin_startChat/view/widgets/userstartnew_oneto_one_chat.dart';
import '../admin_module/contactti/view/contactlsit.dart';
import '../admin_module/contactti/view/widget/admin_influencers.dart';
import '../admin_module/contactti/view/widget/new_channel.dart';
import '../admin_module/setting/user_setting.dart';
import '../admin_module/two_way_channel/view/widgets/detail_page.dart';
import '../admin_module/two_way_channel/view/widgets/twoway_chating_videocall.dart';
import '../admin_module/welcome/welcome.dart';
import '../userModule/profile/view/widget/notification.dart';


class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: Paths.splashScreen,
        page: () =>const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Paths.adminArchived,
        page: () =>const AdminArchived(),
        transition: Transition.fadeIn),
    GetPage(
        name: Paths.bottomNavigationBarPage,
        page: () => BottomNavigationBarPage(),
        transition: Transition.fadeIn),
    GetPage(
        name: Paths.loginView,
        page: () =>const LoginView(),
        transition: Transition.fadeIn),
    GetPage(
        name: Paths.chatscreen,
        page: () => CanaliEsistentChatScreen(),
        transition: Transition.fadeIn),  GetPage(
        name: Paths.profile,
        page: () => Profile(),
        transition: Transition.fadeIn),
          GetPage(
        name: Paths.user_Setting,
        page: () =>const User_Setting(),
        transition: Transition.fadeIn),
         GetPage(
        name: Paths.user_Setting,
        page: () =>const UserNotification(),
        transition: Transition.fadeIn),
         GetPage(
        name: Paths.mobileContact,
        page: () => MobileContact(),
        transition: Transition.fadeIn),
            GetPage(
        name: Paths.adminInfluencers,
        page: () => AdminInfluencers(),
        transition: Transition.fadeIn),
        //        GetPage(
        // name: Paths.adminPrivateChate,
        // page: () => AdminPrivateChate(),
        // transition: Transition.fadeIn),
          
           GetPage(
        name: Paths.twoWayChating,
        page: () => TwoWayChating(),
        transition: Transition.fadeIn),   
          GetPage(
        name: Paths.AdminCanali,
        page: () => AdminCanali(),
        transition: Transition.fadeIn),   GetPage(
        name: Paths.CanaliVideoCall,
        page: () => CanaliVideoCall(),
        transition: Transition.fadeIn), 
          GetPage(
        name: Paths.userSideContactList,
        page: () => UserSideContactList(),
        transition: Transition.fadeIn), 
           GetPage(
        name: Paths.userSideTwoWayUserChannel,
        page: () => UserSideTwoWayUserChannel(),
        transition: Transition.fadeIn), 
         GetPage(
        name: Paths.userSideAdminArchived,
        page: () => UserSideAdminArchived(),
        transition: Transition.fadeIn), 
         GetPage(
        name: Paths.userSideContactListAdminStartChannel,
        page: () => UserSideContactListAdminStartChannel(),
        transition: Transition.fadeIn), 
         GetPage(
        name: Paths.contactListAdminChatingOneToOne,
        page: () => ContactListAdminChatingOneToOne(),
        transition: Transition.fadeIn), 
     
          GetPage(
        name: Paths.forgotPassword,
        page: () => ForgotPassword(),
        transition: Transition.fadeIn), 
            GetPage(
        name: Paths.verifyConfirmation,
        page: () => VerifyConfirmation(),
        transition: Transition.fadeIn),   
        GetPage(
        name: Paths.changePasswordSeccessfull,
        page: () =>const ChangePasswordSeccessfull(),
        transition: Transition.fadeIn),
    GetPage(
        name: Paths.influencerForm,
        page: () =>const InfluencerForm(),
        transition: Transition.fadeIn),
          GetPage(
        name: Paths.adminPrivateVideocall,
        page: () =>const TwowayChatingVideoCall(),
        transition: Transition.fadeIn),
          GetPage(
        name: Paths.onetoOneChatingVideoCal,
        page: () =>const TwowayChatingVideoCall(),
        transition: Transition.fadeIn),
         GetPage(
        name: Paths.contattiVideoCall,
        page: () =>const TwowayChatingVideoCall(),
        transition: Transition.fadeIn),
           GetPage(
        name: Paths.twowayChatingVideoCall,
        page: () =>const TwowayChatingVideoCall(),
        transition: Transition.fadeIn),
           GetPage(
        name: Paths.voiceCall,
        page: () =>const VoiceCall(),
        transition: Transition.fadeIn), 
        
          GetPage(
        name: Paths.currentUserLocation,
        page: () => CurrentUserLocation(),
        transition: Transition.fadeIn), 
           GetPage(
        name: Paths.contactListAdminStartChannel,
        page: () => ContactListAdminStartChannel(),
        transition: Transition.fadeIn), 
         GetPage(
        name: Paths.canaliEsistentiScreen,
        page: () => CanaliEsistentiScreen(),
        transition: Transition.fadeIn), 
      
       GetPage(
        name: Paths.setLocation,
        page: () => SetLocation(),
        transition: Transition.fadeIn), 
         GetPage(
        name: Paths.contactList,
        page: () => ContactList(),
        transition: Transition.fadeIn), 
        GetPage(
        name: Paths.adminNewChannel,
        page: () => AdminNewChannel(),
        transition: Transition.fadeIn), 
      
  ];
}
