import 'package:influencer/util/image_const.dart';

class AdminArchivedUser {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;
  final String? image;

  AdminArchivedUser({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
    this.image
   
  });
}

// YOU - current user
final AdminArchivedUser adminarchivedcurrentuser = AdminArchivedUser(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
  image: ''
);

// USERS
final AdminArchivedUser ironMan = AdminArchivedUser(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
   image: ''
);
final AdminArchivedUser captainAmerica = AdminArchivedUser(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
   image: ''
);
final AdminArchivedUser hulk = AdminArchivedUser(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
   image: ''
);
final AdminArchivedUser scarletWitch = AdminArchivedUser(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
   image: ''
);
final AdminArchivedUser spiderMan = AdminArchivedUser(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
   image: ''
);
final AdminArchivedUser blackWindow = AdminArchivedUser(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
   image: ''
);
final AdminArchivedUser thor = AdminArchivedUser(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
   image: ''
);
final AdminArchivedUser captainMarvel = AdminArchivedUser(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
   image: ''
);