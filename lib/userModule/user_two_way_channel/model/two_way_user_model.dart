import 'package:influencer/util/image_const.dart';

class UserSideTwoWayUserModel {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  UserSideTwoWayUserModel({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final UserSideTwoWayUserModel usersideTwowayCurrentUser = UserSideTwoWayUserModel(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final UserSideTwoWayUserModel ironMan = UserSideTwoWayUserModel(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final UserSideTwoWayUserModel captainAmerica = UserSideTwoWayUserModel(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final UserSideTwoWayUserModel hulk = UserSideTwoWayUserModel(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final UserSideTwoWayUserModel scarletWitch = UserSideTwoWayUserModel(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final UserSideTwoWayUserModel spiderMan = UserSideTwoWayUserModel(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final UserSideTwoWayUserModel blackWindow = UserSideTwoWayUserModel(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final UserSideTwoWayUserModel thor = UserSideTwoWayUserModel(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final UserSideTwoWayUserModel captainMarvel = UserSideTwoWayUserModel(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);