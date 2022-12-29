import 'package:influencer/util/image_const.dart';

class UserSideContattiDataUserSide {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  UserSideContattiDataUserSide({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final UserSideContattiDataUserSide usersideContattiCurrentId = UserSideContattiDataUserSide(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final UserSideContattiDataUserSide ironMan = UserSideContattiDataUserSide(
  id: 1,
  name: 'Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final UserSideContattiDataUserSide captainAmerica = UserSideContattiDataUserSide(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final UserSideContattiDataUserSide hulk = UserSideContattiDataUserSide(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final UserSideContattiDataUserSide scarletWitch = UserSideContattiDataUserSide(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final UserSideContattiDataUserSide spiderMan = UserSideContattiDataUserSide(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final UserSideContattiDataUserSide blackWindow = UserSideContattiDataUserSide(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final UserSideContattiDataUserSide thor = UserSideContattiDataUserSide(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final UserSideContattiDataUserSide captainMarvel = UserSideContattiDataUserSide(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);