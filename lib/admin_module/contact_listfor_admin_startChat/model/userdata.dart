import 'package:influencer/util/image_const.dart';

class ContactListUserData {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  ContactListUserData({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final ContactListUserData ContactListcurrentUser = ContactListUserData(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final ContactListUserData ironMan = ContactListUserData(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final ContactListUserData captainAmerica = ContactListUserData(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final ContactListUserData hulk = ContactListUserData(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final ContactListUserData scarletWitch = ContactListUserData(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final ContactListUserData spiderMan = ContactListUserData(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final ContactListUserData blackWindow = ContactListUserData(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final ContactListUserData thor = ContactListUserData(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final ContactListUserData captainMarvel = ContactListUserData(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);