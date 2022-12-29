



import 'two_way_user_model.dart';

class TwoWayMessage {
  final TwoWayUserModel sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;
  final int num;
  

  TwoWayMessage({
  required  this.sender,
  required this.time,
   required this.text,
   required this.unread,
   required this.num,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<TwoWayMessage> TwoWayChats = [
  TwoWayMessage(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
    num: 1
  ),
  TwoWayMessage(
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
    num: 2
  ),
  TwoWayMessage(
    sender: blackWindow,
    time: '3:30 PM',
    text: 'WOW! this soul world is amazing, but miss you guys.',
    unread: false,
    num: 1
  ),

  TwoWayMessage(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'My twins are giving me headache. Give me some time please.',
    unread: false,
    num: 1
  ),
  TwoWayMessage(
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'You\'re always special to me nick! But you know my struggle.',
    unread: false,
    num: 1
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<TwoWayMessage> twowaymessage = [
  TwoWayMessage(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
    num: 4
  ),
  TwoWayMessage(
    sender: TwowayCurrentUser,
    time: '4:30 PM',
    text: 'We could surely handle this mess much easily if you were here.',
    unread: true,
    num: 4
  ),
  TwoWayMessage(
    sender: ironMan,
    time: '3:45 PM',
    text: 'Take care of peter. Give him all the protection & his aunt.',
    unread: true,
    num: 4
  ),

  TwoWayMessage(
    sender: TwowayCurrentUser,
    time: '2:30 PM',
    text: 'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  num: 4
  ),

    TwoWayMessage(
    sender: ironMan,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
    num: 4
  ),
  TwoWayMessage(
    sender: TwowayCurrentUser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
    num: 4
  ),

];
