import 'package:influencer/util/image_const.dart';

class UserSideAdminArchivedUser {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;
  final String? image;

  UserSideAdminArchivedUser({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
    this.image
   
  });
}

// YOU - current user
final UserSideAdminArchivedUser usersideadminarchivedcurrentuser = UserSideAdminArchivedUser(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
  image: ''
);

// USERS
final UserSideAdminArchivedUser ironMan = UserSideAdminArchivedUser(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
   image: ''
);
final UserSideAdminArchivedUser captainAmerica = UserSideAdminArchivedUser(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
   image: ''
);
final UserSideAdminArchivedUser hulk = UserSideAdminArchivedUser(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
   image: ''
);
final UserSideAdminArchivedUser scarletWitch = UserSideAdminArchivedUser(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
   image: ''
);
final UserSideAdminArchivedUser spiderMan = UserSideAdminArchivedUser(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
   image: ''
);
final UserSideAdminArchivedUser blackWindow = UserSideAdminArchivedUser(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
   image: ''
);
final UserSideAdminArchivedUser thor = UserSideAdminArchivedUser(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
   image: ''
);
final UserSideAdminArchivedUser captainMarvel = UserSideAdminArchivedUser(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
   image: ''
);