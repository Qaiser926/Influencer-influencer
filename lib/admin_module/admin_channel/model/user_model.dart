import 'package:influencer/util/image_const.dart';

class AdminChannelUser {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  AdminChannelUser({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final AdminChannelUser adminchannelUser = AdminChannelUser(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final AdminChannelUser ironMan = AdminChannelUser(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final AdminChannelUser captainAmerica = AdminChannelUser(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final AdminChannelUser hulk = AdminChannelUser(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final AdminChannelUser scarletWitch = AdminChannelUser(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final AdminChannelUser spiderMan = AdminChannelUser(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final AdminChannelUser blackWindow = AdminChannelUser(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final AdminChannelUser thor = AdminChannelUser(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final AdminChannelUser captainMarvel = AdminChannelUser(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);