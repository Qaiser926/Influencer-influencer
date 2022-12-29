import 'package:influencer/util/image_const.dart';

class TwoWayUserModel {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  TwoWayUserModel({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final TwoWayUserModel TwowayCurrentUser = TwoWayUserModel(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final TwoWayUserModel ironMan = TwoWayUserModel(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final TwoWayUserModel captainAmerica = TwoWayUserModel(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final TwoWayUserModel hulk = TwoWayUserModel(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final TwoWayUserModel scarletWitch = TwoWayUserModel(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final TwoWayUserModel spiderMan = TwoWayUserModel(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final TwoWayUserModel blackWindow = TwoWayUserModel(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final TwoWayUserModel thor = TwoWayUserModel(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final TwoWayUserModel captainMarvel = TwoWayUserModel(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);