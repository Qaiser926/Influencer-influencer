import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoiceCall extends StatefulWidget {
  const VoiceCall({Key? key}) : super(key: key);

  @override
  State<VoiceCall> createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  bool volume0n=true;
  bool volumeoff=false;
  bool mic0n=false;
  bool micoff=true;
  bool video0n=true;
  bool videooff=false;
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/wabg.png",fit: BoxFit.cover,),
          Column(
            children: [
              SizedBox(height: height*.06,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock,color: Colors.grey,size: 15,),
                  Text("End-to-end encrypted",style: TextStyle(color: Colors.grey),),
                ],
              ),
              SizedBox(height: height*.02,),
              const Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage("assets/noimage.png"),
                ),
              ),
              SizedBox(height: height*.03,),
              const Center(child: Text("Unknown",style: TextStyle(color: Colors.white,fontSize: 35),)),
              SizedBox(height: height*.01,),
              const Center(child: Text("Ringing",style: TextStyle(color: Colors.grey),)),
            ],
          ),
          _buildDraggableScrollableSheet(),
        ],
      ),
    );
  }

  _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
        initialChildSize: 0.15,
        minChildSize: 0.15,
        maxChildSize: 0.4,
        builder: (BuildContext context,ScrollController ScrollController ){
          return Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8)
              )
            ),
            child: Scrollbar(
              child: ListView(
                controller: ScrollController,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Visibility(
                              visible: volume0n,
                              child: IconButton(icon: const Icon(Icons.volume_up),color: Colors.white,onPressed: (){
                                setState(() {
                                  volumeoff=true;
                                  volume0n=false;
                                });
                              },)),
                          Visibility(
                              visible: volumeoff,
                              child: IconButton(icon: const Icon(Icons.volume_off),color: Colors.white,onPressed: (){
                                setState(() {
                                  volumeoff=false;
                                  volume0n=true;
                                });
                              },)),
                        ],
                      ),
                      Stack(
                        children: [
                          Visibility(
                              visible: video0n,
                              child: IconButton(icon: const Icon(Icons.videocam),color: Colors.grey,onPressed: (){
                                setState(() {
                                  videooff=true;
                                  video0n=false;
                                });
                              },)),
                          Visibility(
                              visible: videooff,
                              child: IconButton(icon: const Icon(Icons.videocam_off),color: Colors.grey,onPressed: (){
                                setState(() {
                                  videooff=false;
                                  video0n=true;
                                });
                              },)),
                        ],
                      ),
                      Stack(
                        children: [
                          Visibility(
                              visible: mic0n,
                              child: IconButton(icon: const Icon(Icons.mic),color: Colors.white,onPressed: (){
                                setState(() {
                                  micoff=true;
                                  mic0n=false;
                                });
                              },)),
                          Visibility(
                              visible: micoff,
                              child: IconButton(icon: const Icon(Icons.mic_off),color: Colors.white,onPressed: (){
                                setState(() {
                                  micoff=false;
                                  mic0n=true;
                                });
                              },)),
                        ],
                      ),
                      InkWell(
                        child: const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.call_end),
                          backgroundColor: Colors.red,
                        ),
                        onTap: (){
                          Get.back();
                        }
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*.04,),
                  const Divider(color: Colors.grey,),
                  ListTile(leading: CircleAvatar(radius: 20,child: IconButton(icon: const Icon(Icons.person_add),color: Colors.white,onPressed: (){},),backgroundColor: Colors.green,),
                  title: const Text("Add participant",style: TextStyle(color: Colors.white),),
                  ),
                  const ListTile(leading: CircleAvatar(radius: 20,backgroundImage: AssetImage("assets/noimage.png"),),
                    title: Text("Unknown",style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
          );
        }

    );
  }
}
