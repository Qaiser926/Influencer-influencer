
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


// var lat;
// var long;

// class SetLocation extends StatefulWidget {
//   const SetLocation({Key? key}) : super(key: key);

//   @override
//   State<SetLocation> createState() => _SetLocationState();
// }

// class _SetLocationState extends State<SetLocation> {


//   Completer<GoogleMapController> _mapController=Completer();


//   Future<Position> gotoCurrentLocation() async{
//      Geolocator.requestPermission().then((value) {

//     }).onError((error, stackTrace) {
//       print('error agiya :$error');
//     });
//     return await Geolocator.getCurrentPosition();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       backgroundColor: Colors.white,
//       surfaceTintColor: Colors.white,
//       elevation:0,
//       centerTitle: true,
//       title: Text('Location',style: TextStyle(color: Colors.black),),
//       leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.black),onPressed: (){
//         Get.back();
//       },),
//       ),
//       body: GoogleMap(
//         // markers: Set.of(marker),

//         initialCameraPosition: CameraPosition(
//           target: LatLng(31.5204, 74.3587),zoom: 14,),
//       ),
//     );
//   }
// }






import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:influencer/admin_module/profile/profile.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/util/color.dart';


class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  State<SetLocation> createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {


  Completer<GoogleMapController> _mapController=Completer();
  bool isloading=false;

var Plat;
var Plong;



  Future<Position> gotoCurrentLocation() async{
     Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace) {
      print('error agiya :$error');
    });
    return await Geolocator.getCurrentPosition();
  }


  List<Marker> marker=[
    Marker(markerId: MarkerId('1'),infoWindow: InfoWindow(title: "Qaiser",),position:LatLng(31.5204, 74.3587) ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation:0,
      centerTitle: true,
      title: Text('Location',style: TextStyle(color: Colors.black),),
      leading: IconButton(icon: Icon(Icons.arrow_back,color:Colors.black),onPressed: (){
        Get.back();
      },),
      ),

      body:  Stack(
        alignment: Alignment.bottomCenter,
        children: [
        
          SingleChildScrollView(
            child: Column(
              // alignment: Alignment.bottomCenter,
              children: [
          
                Container(
                 height: Get.size.height-70,
                  width: double.infinity,
                  child: GoogleMap(
                    // markers: Set.of(marker),
                    onMapCreated: (GoogleMapController contoller){
                      _mapController.complete(contoller);
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(31.5204, 74.3587),zoom: 14,),
                  ),
                ),
                // SizedBox(height: 30.h,),
             
              ],
            ),
          ),
            MaterialButton(
              minWidth: Get.size.width-100.w,
              height: 40.h,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: IColor.mainBlueColor,
              onPressed: (){
                setState(() {
                  isloading=true;
                });
               gotoCurrentLocation().then((value) async{
                  marker.add(Marker(markerId: MarkerId('2'),infoWindow: InfoWindow(title: "Current Location"),
                      position: LatLng(value.latitude,value.longitude)));
                  CameraPosition cameraPosition=CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 14);
                  final GoogleMapController controller= await _mapController.future;
                  controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                  setState(() {
                    Plat= value.latitude;
                    Plong= value.longitude;
                  });
                  print("Plat ${value.latitude} and Plon ${value.longitude}");
                //  Navigator.push(context, MaterialPageRoute(builder:(context) =>bo() ));
                // Get.toNamed(Paths.bottomNavigationBarPage);
                setState(() {
                    // Get.to(BottomNavigationBarPage(),transition: Transition.fadeIn);
                    Get.to(Profile(country:Plat ,city: Plong,));
                  isloading=false;
                });
                }
                );
            }
            ,child: Text('Get Location',style: TextStyle(color: Colors.white),),),
        
        ],
      ),
    );
  }
}



