import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


var lat;
var long;

class CurrentUserLocation extends StatefulWidget {
  const CurrentUserLocation({Key? key}) : super(key: key);

  @override
  State<CurrentUserLocation> createState() => _CurrentUserLocationState();
}

class _CurrentUserLocationState extends State<CurrentUserLocation> {


  Completer<GoogleMapController> _mapController=Completer();


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


      body:  Stack(
        alignment: Alignment.bottomCenter,
        children: [

          GoogleMap(
            markers: Set.of(marker),
            onMapCreated: (GoogleMapController contoller){
              _mapController.complete(contoller);
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(31.5204, 74.3587),zoom: 14,),
          ),
          InkWell(
            onTap: (){
              gotoCurrentLocation().then((value) async{
                marker.add(Marker(markerId: MarkerId('2'),infoWindow: InfoWindow(title: "Current Location"),
                    position: LatLng(value.latitude,value.longitude)));
                CameraPosition cameraPosition=CameraPosition(target: LatLng(value.latitude,value.longitude),zoom: 14);
                final GoogleMapController controller= await _mapController.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                setState((){
                  lat=value.latitude;
                  long=value.longitude;
                });
                  Fluttertoast.showToast(
                                                  msg: 'location Pikced',
                                                  toastLength:
                                                      Toast.LENGTH_LONG);
                Get.back();
                // print("lat ${value.latitude} and lon ${value.longitude}");
              //  Navigator.push(context, MaterialPageRoute(builder:(context) =>FindLocationFullAddress() ));
              });
            },
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: Icon(Icons.location_searching),
            ),
          ),
        ],
      ),
    );
  }
}
