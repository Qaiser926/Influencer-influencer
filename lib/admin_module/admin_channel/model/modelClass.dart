



import 'package:influencer/admin_module/admin_channel/model/user_model.dart';

class AdminChannelMessage {
  final AdminChannelUser sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;
  final int num;
  

  AdminChannelMessage({
  required  this.sender,
  required this.time,
   required this.text,
   required this.unread,
   required this.num,

  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<AdminChannelMessage> adminchannelchats = [
  AdminChannelMessage(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Even dead .',
    unread: true,
    num: 1
  ),
  AdminChannelMessage(
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
    num: 2
  ),
  AdminChannelMessage(
    sender: blackWindow,
    time: '3:30 PM',
    text: 'WOW! this soul world is amazing, but miss you guys.',
    unread: false,
    num: 1
  ),
  AdminChannelMessage(
    sender: spiderMan,
    time: '2:30 PM',
    text: 'I\'m exposed now. Please help me to hide my identity.',
    unread: true,
    num: 4
  ),
  AdminChannelMessage(
    sender: hulk,
    time: '1:30 PM',
    text: 'HULK SMASH!!',
    unread: false,
    num: 2
  ),

];

// EXAMPLE AdminChannelMessageS IN CHAT SCREEN
List<AdminChannelMessage> adminchannelmessages = [
  AdminChannelMessage(
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
    num: 4
  ),
  AdminChannelMessage(
    sender: adminchannelUser,
    time: '4:30 PM',
    text: 'We could surely handle this mess much easily if you were here.',
    unread: true,
    num: 4
  ),
  AdminChannelMessage(
    sender: ironMan,
    time: '3:45 PM',
    text: 'Take care of peter. Give him all the protection & his aunt.',
    unread: true,
    num: 4
  ),
  AdminChannelMessage(
    sender: ironMan,
    time: '3:15 PM',
    text: 'I\'m always proud of her and blessed to have both of them.',
    unread: true,
  num: 4
  ),
  AdminChannelMessage(
    sender: adminchannelUser,
    time: '2:30 PM',
    text: 'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  num: 4
  ),
  AdminChannelMessage(
    sender: adminchannelUser,
    time: '2:30 PM',
    text: 'Pepper & Morgan is fine. They\'re strong as you. Morgan is a very brave girl, one day she\'ll make you proud.',
    unread: true,
    num: 4
  ),
  AdminChannelMessage(
    sender: adminchannelUser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
    num: 4
  ),
  AdminChannelMessage(
    sender: ironMan,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
    num: 4
  ),
];
