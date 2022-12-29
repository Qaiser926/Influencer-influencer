import 'package:influencer/util/image_const.dart';

class UserSideContactListUserData {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  UserSideContactListUserData({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final UserSideContactListUserData usersideContactListcurrentUser = UserSideContactListUserData(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final UserSideContactListUserData ironMan = UserSideContactListUserData(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final UserSideContactListUserData captainAmerica = UserSideContactListUserData(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final UserSideContactListUserData hulk = UserSideContactListUserData(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final UserSideContactListUserData scarletWitch = UserSideContactListUserData(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final UserSideContactListUserData spiderMan = UserSideContactListUserData(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final UserSideContactListUserData blackWindow = UserSideContactListUserData(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final UserSideContactListUserData thor = UserSideContactListUserData(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final UserSideContactListUserData captainMarvel = UserSideContactListUserData(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);