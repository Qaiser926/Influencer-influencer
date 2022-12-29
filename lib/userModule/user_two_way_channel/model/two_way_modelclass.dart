



import 'two_way_user_model.dart';

class UserSideTwoWayMessage {
  final UserSideTwoWayUserModel sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;
  final int num;
  

  UserSideTwoWayMessage({
  required  this.sender,
  required this.time,
   required this.text,
   required this.unread,
   required this.num,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<UserSideTwoWayMessage> usersideTwoWayChats = [
  UserSideTwoWayMessage(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
    num: 1
  ),
  UserSideTwoWayMessage(
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
    num: 2
  ),
  UserSideTwoWayMessage(
    sender: blackWindow,
    time: '3:30 PM',
    text: 'WOW! this soul world is amazing, but miss you guys.',
    unread: false,
    num: 1
  ),
  UserSideTwoWayMessage(
    sender: spiderMan,
    time: '2:30 PM',
    text: 'I\'m exposed now. Please help me to hide my identity.',
    unread: true,
    num: 4
  ),
  UserSideTwoWayMessage(
    sender: hulk,
    time: '1:30 PM',
    text: 'HULK SMASH!!',
    unread: false,
    num: 2
  ),
  UserSideTwoWayMessage(
    sender: thor,
    time: '12:30 PM',
    text: 'I\'m hitting gym bro. I\'m immune to mortal deseases. Are you coming?',
    unread: false,
    num: 1
  ),
  UserSideTwoWayMessage(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'My twins are giving me headache. Give me some time please.',
    unread: false,
    num: 1
  ),
  UserSideTwoWayMessage(
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'You\'re always special to me nick! But you know my struggle.',
    unread: false,
    num: 1
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<UserSideTwoWayMessage> UserSidetwowaymessage = [
  UserSideTwoWayMessage(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
    num: 4
  ),
  UserSideTwoWayMessage(
    sender: usersideTwowayCurrentUser,
    time: '4:30 PM',
    text: 'We could surely handle this mess much easily if you were here.',
    unread: true,
    num: 4
  ),
  UserSideTwoWayMessage(
    sender: ironMan,
    time: '3:45 PM',
    text: 'Take care of peter. Give him all the protection & his aunt.',
    unread: true,
    num: 4
  ),

  UserSideTwoWayMessage(
    sender: usersideTwowayCurrentUser,
    time: '2:30 PM',
    text: 'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  num: 4
  ),

    UserSideTwoWayMessage(
    sender: ironMan,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
    num: 4
  ),
  UserSideTwoWayMessage(
    sender: usersideTwowayCurrentUser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
    num: 4
  ),

];
