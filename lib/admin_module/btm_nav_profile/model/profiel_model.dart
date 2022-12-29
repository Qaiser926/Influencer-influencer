import 'package:influencer/util/image_const.dart';

class UserProfile {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  UserProfile({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final UserProfile currentUser = UserProfile(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final UserProfile ironMan = UserProfile(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final UserProfile captainAmerica = UserProfile(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final UserProfile hulk = UserProfile(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final UserProfile scarletWitch = UserProfile(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final UserProfile spiderMan = UserProfile(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
