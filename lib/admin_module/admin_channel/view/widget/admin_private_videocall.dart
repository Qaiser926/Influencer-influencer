// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart';
// class AdminPrivateVideocall extends StatefulWidget {
//   const AdminPrivateVideocall({Key? key}) : super(key: key);
//
//   @override
//   State<AdminPrivateVideocall> createState() => _AdminPrivateVideocallState();
// }
//
// class _AdminPrivateVideocallState extends State<AdminPrivateVideocall> {
//
// // late final AgoraClient client;
// String tempToken='';
// bool _loading=true;
// AgoraClient client=AgoraClient(
//
// agoraConnectionData: AgoraConnectionData(appId:"caac3bf67bdb40baa4c062950a5b4f78",
// // tempToken: tempToken,
// tempToken: "007eJxTYHik/s/GIet2nvykmrOl+2y8KpIv7WW4Y9qrwPL0xvl2lxAFhuTExGTjpDQz86SUJBODpMREk2QDMyNLU4NE0ySTNHOLTWtakhsCGRm+lXcxMEIhiM/CUJJaXMLAAACb4SEX",
// channelName: "test"),
//
// enabledPermission: [
//   Permission.camera ,
//   // Permission.videos,
//   Permission.microphone,
// ]
//   );
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){Get.back();},),
//       ),
//       body: SafeArea(
//         // child:_loading? Center(child: CircularProgressIndicator()):
//         child: Stack(children: [
//           AgoraVideoViewer(client: client,
//           // layoutType: Layout.floating,
//           ),
//            AgoraVideoButtons(client: client,)
//         ],),
//       ),
//     );
//   }
// }