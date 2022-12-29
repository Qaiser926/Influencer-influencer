



import 'userdata.dart';

class UserSideContactLIstUserDataMessage {
  final UserSideContactListUserData sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;
  final int num;
  

  UserSideContactLIstUserDataMessage({
  required  this.sender,
  required this.time,
   required this.text,
   required this.unread,
   required this.num,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<UserSideContactLIstUserDataMessage> usersidecontactListuserChats = [
  UserSideContactLIstUserDataMessage(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
    num: 1
  ),
  UserSideContactLIstUserDataMessage(
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
    num: 2
  ),
  UserSideContactLIstUserDataMessage(
    sender: blackWindow,
    time: '3:30 PM',
    text: 'WOW! this soul world is amazing, but miss you guys.',
    unread: false,
    num: 1
  ),
  UserSideContactLIstUserDataMessage(
    sender: spiderMan,
    time: '2:30 PM',
    text: 'I\'m exposed now. Please help me to hide my identity.',
    unread: true,
    num: 4
  ),
  UserSideContactLIstUserDataMessage(
    sender: hulk,
    time: '1:30 PM',
    text: 'HULK SMASH!!',
    unread: false,
    num: 2
  ),
  UserSideContactLIstUserDataMessage(
    sender: thor,
    time: '12:30 PM',
    text: 'I\'m hitting gym bro. I\'m immune to mortal deseases. Are you coming?',
    unread: false,
    num: 1
  ),
  UserSideContactLIstUserDataMessage(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'My twins are giving me headache. Give me some time please.',
    unread: false,
    num: 1
  ),
  UserSideContactLIstUserDataMessage(
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'You\'re always special to me nick! But you know my struggle.',
    unread: false,
    num: 1
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<UserSideContactLIstUserDataMessage> getcontactListdata = [

  UserSideContactLIstUserDataMessage(
    sender: usersideContactListcurrentUser,
    time: '2:30 PM',
    text: 'Yes Tony!always special to me nick! But you know my struggalways special to me nick! But you know my strugg',
    unread: true,
    num: 4
  ),

];
