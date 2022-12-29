import 'package:influencer/util/image_const.dart';

class ContattiDataUserSide {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  ContattiDataUserSide({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final ContattiDataUserSide ContattiCurrentId = ContattiDataUserSide(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final ContattiDataUserSide ironMan = ContattiDataUserSide(
  id: 1,
  name: 'Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final ContattiDataUserSide captainAmerica = ContattiDataUserSide(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final ContattiDataUserSide hulk = ContattiDataUserSide(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final ContattiDataUserSide scarletWitch = ContattiDataUserSide(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final ContattiDataUserSide spiderMan = ContattiDataUserSide(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final ContattiDataUserSide blackWindow = ContattiDataUserSide(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final ContattiDataUserSide thor = ContattiDataUserSide(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final ContattiDataUserSide captainMarvel = ContattiDataUserSide(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);