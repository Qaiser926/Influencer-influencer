

import 'admin_archived_model.dart';

class UserSideAdminArchivedMessage {
  final UserSideAdminArchivedUser sender;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  late bool unread;
  late int num;
  final String image;
  final String? numberpicker;


  UserSideAdminArchivedMessage({
  required this.sender,
  required this.time,
 required this.text,
 required this.unread,
 required this.num,
 required  this.image,
 this.numberpicker,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<UserSideAdminArchivedMessage> usersideadminarchivedChats = [
  UserSideAdminArchivedMessage(
    image: '',
    sender: ironMan,
    time: '5:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
    num: 1
  ),
  UserSideAdminArchivedMessage(
     image: '',
    sender: captainAmerica,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: true,
    num: 2
    
  ),
  UserSideAdminArchivedMessage(
     image: '',
    sender: blackWindow,
    time: '3:30 PM',
    text: 'WOW! this soul world is amazing, but miss you guys.',
    unread: false,
    num: 1
  ),
  UserSideAdminArchivedMessage(
     image: '',
    sender: spiderMan,
    time: '2:30 PM',
    text: 'I\'m exposed now. Please help me to hide my identity.',
    unread: true,
    num: 4
  ),
  UserSideAdminArchivedMessage(
    sender: hulk,
    time: '1:30 PM',
    text: 'HULK SMASH!!',
    unread: false,
    num: 2,
     image: '',
  ),
  UserSideAdminArchivedMessage(
    sender: thor,
    time: '12:30 PM',
    text: 'I\'m hitting gym bro. I\'m immune to mortal deseases. Are you coming?',
    unread: false,
    num: 1,
     image: '',
  ),
  UserSideAdminArchivedMessage(
    sender: scarletWitch,
    time: '11:30 AM',
    text: 'My twins are giving me headache. Give me some time please.',
    unread: false,
    num: 1,
     image: '',
  ),
  UserSideAdminArchivedMessage(
    sender: captainMarvel,
    time: '12:45 AM',
    text: 'You\'re always special to me nick! But you know my struggle.',
    unread: false,
    num: 1,
     image: '',
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<UserSideAdminArchivedMessage> usersideAdminArchiveMessages = [

    UserSideAdminArchivedMessage(
    sender: ironMan,
    time: '2:00 PM',
    text: 'I hope my family is doing well.',
    unread: true,
    num: 5, image: '',
  ),
  UserSideAdminArchivedMessage(
    sender: ironMan,
    time: '3:15 PM',
    text: 'I\'m always proud of her and blessed to have both of them.',
    unread: true,
  num: 5, image: '',
  ),
  UserSideAdminArchivedMessage(
    sender: usersideadminarchivedcurrentuser,
    time: '2:30 PM',
    text: 'But that spider kid is having some difficulties due his identity reveal by a blog called daily bugle.',
    unread: true,
  num: 5, image: '',
  ),
  UserSideAdminArchivedMessage(
    sender: usersideadminarchivedcurrentuser,
    time: '2:30 PM',
    text: 'Pepper & Morgan is fine. They\'re strong as you. Morgan is a very brave girl, one day she\'ll make you proud.',
    unread: true,
    num: 5, image: '',
  ),
  UserSideAdminArchivedMessage(
    sender: usersideadminarchivedcurrentuser,
    time: '2:30 PM',
    text: 'Yes Tony!',
    unread: true,
    num: 5, image: '',
  ),

];
