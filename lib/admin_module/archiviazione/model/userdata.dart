import 'package:influencer/util/image_const.dart';

class ArchiviazioneListUserData {
  final int? id;
  final String? name;
  final String? imageUrl;
  final bool? isOnline;

  ArchiviazioneListUserData({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final ArchiviazioneListUserData archiviazioneListcurrentUser = ArchiviazioneListUserData(
  id: 0,
  name: 'Nick Fury',
  imageUrl: ImageConstant.dummyImage1,
  isOnline: true,
);

// USERS
final ArchiviazioneListUserData ironMan = ArchiviazioneListUserData(
  id: 1,
  name: 'Iron Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final ArchiviazioneListUserData captainAmerica = ArchiviazioneListUserData(
  id: 2,
  name: 'Captain America',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: true,
);
final ArchiviazioneListUserData hulk = ArchiviazioneListUserData(
  id: 3,
  name: 'Hulk',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final ArchiviazioneListUserData scarletWitch = ArchiviazioneListUserData(
  id: 4,
  name: 'Scarlet Witch',
  imageUrl: ImageConstant.dummyImage5,
  isOnline: false,
);
final ArchiviazioneListUserData spiderMan = ArchiviazioneListUserData(
  id: 5,
  name: 'Spider Man',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: true,
);
final ArchiviazioneListUserData blackWindow = ArchiviazioneListUserData(
  id: 6,
  name: 'Black Widow',
  imageUrl: ImageConstant.dummyImage4,
  isOnline: false,
);
final ArchiviazioneListUserData thor = ArchiviazioneListUserData(
  id: 7,
  name: 'Thor',
  imageUrl: ImageConstant.dummyImage3,
  isOnline: false,
);
final ArchiviazioneListUserData captainMarvel = ArchiviazioneListUserData(
  id: 8,
  name: 'Captain Marvel',
  imageUrl: ImageConstant.dummyImage2,
  isOnline: false,
);