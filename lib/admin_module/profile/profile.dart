import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:influencer/admin_module/archiviazione/view/contact_listAdmin_startchannel.dart';
import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/userModule/profile/view/widget/notification.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';
import 'package:share_plus/share_plus.dart';

import '../../util/color.dart';
import '../admin_archived/view/component/googlemap.dart';

class Profile extends StatefulWidget {
   Profile({Key? key,this.city,this.country}) : super(key: key);
  double? country;
double? city;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? imageFile;

  var subadminstrationarea = '';
  var country = '';
  
  getCity() async {
    List<Placemark> address = await placemarkFromCoordinates(double.parse(widget.country.toString()), double.parse(widget.city.toString()));
    setState(() {
      country = address.last.country.toString();
      subadminstrationarea = address.last.subAdministrativeArea.toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCity();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: IColor.colorWhite,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Get.back();
        },icon: Icon(Icons.arrow_back,color: IColor.colorblack,),),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        title: Text(Strings.profile,style: TextStyle(color: IColor.colorblack),),
       
      ),
        body: SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
         height: Get.size.height,
          child: SingleChildScrollView(
            child: Column(
             children: [
                CircleAvatar(
               backgroundColor: Colors.transparent,
               radius: 40.r,
               child: InkWell(
                 onTap: () {
                   showModalBottomSheet(
                     context: context,
                     builder: (context) => bottomsheet(context),
                     backgroundColor: Colors.white,
                   );
                 },
                 child: CircleAvatar(
                   backgroundColor: Colors.transparent,
                   radius: 40.r,
                   child: CircleAvatar(
                     radius: Dimensions.height60,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(Dimensions.containerHeight65),
                       child: imageFile == null
                           ? Image.asset(
                               'assets/images/person1.png',
                               width: Dimensions.height135,
                               height: Dimensions.height135,
                               fit: BoxFit.cover,
                             )
                           : Image.file(
                               imageFile!,
                               width: Dimensions.height135,
                               height: Dimensions.height120,
                               fit: BoxFit.cover,
                             ),
                     ),
                   ),
                 ),
               ),
             ),
           
              Text(
               'William Prioen',
               style: TextStyle(
                   fontFamily: 'Poppins-Bold.ttf',
                   fontSize: Dimensions.fontSize22,
                   fontWeight: FontWeight.bold),
             ),
             SizedBox(
               height: 5.h,
             ),
              Text(
               'Iscritto 3 anni fa',
               style: TextStyle(
                 color: Colors.grey,
                 fontFamily: 'Poppins-Bold.ttf',
                 fontSize: Dimensions.textsize15,
               ),
             ),
             SizedBox(height: 8.h,),
            //  Text(subadminstrationarea),
              GestureDetector(
                    onTap: (){
                      Get.offNamed(Paths.setLocation);
                    },
                    child: Container(
                      // width: 160.w,
                      // height: 30.h,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(12),
                      //     border: Border.all(color:Colors.black.withOpacity(0.5), width: 0.2),
                      //     color: IColor.mainBlueColor.withOpacity(0.1)),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              subadminstrationarea,
                            
                            ),
                              SizedBox(
                              width: 6.w,
                            ),
                             Text(
                              country,
                            
                            ),
                         
                            SizedBox(
                              width: 6.w,
                            ),
                            // Align(
                            //     alignment: Alignment.centerRight,
                            //     child: Icon(Icons.keyboard_arrow_down_rounded))
                          ],
                        ),
                      ),
                    ),
                  ),
                
              
             SizedBox(
               height: 20.h,
             ),
             Container(
               width: Get.size.width-30.w,
               height:80.h,
               decoration: BoxDecoration(
                 color: IColor.mainBlueColor,
                 borderRadius: BorderRadius.all(
                   Radius.circular(17.r),
                 ),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(top: Dimensions.fontSize20, left: Dimensions.fontSize20),
                     child: Column(
                       children: [
                         Text(
                           '210.901',
                           style: TextStyle(
                               fontSize: Dimensions.fontSize20,
                               fontWeight: FontWeight.bold,
                               color: Colors.white),
                         ),
                         SizedBox(
                           height: Dimensions.fontSize20,
                         ),
                        const Text(
                           'Punteggio',
                           style: TextStyle(color: Colors.white),
                         )
                       ],
                     ),
                   ),
                    Padding(
                     padding:
                         EdgeInsets.only(top: Dimensions.paddingLeft10, bottom: Dimensions.paddingLeft10, left: Dimensions.height30),
                     child:const VerticalDivider(
                       thickness: 2,
                       color: Colors.white,
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.only(top: Dimensions.fontSize20, left: Dimensions.fontsize30),
                     child: Column(
                       children: [
                         Text(
                           '10.256',
                           style: TextStyle(
                               fontSize:Dimensions.fontSize20,
                               fontWeight: FontWeight.bold,
                               color: Colors.white),
                         ),
                         SizedBox(
                           height: Dimensions.fontSize20,
                         ),
                        const Text(
                           'Followers totail',
                           style: TextStyle(color: Colors.white),
                         )
                       ],
                     ),
                   )
                 ],
               ),
             ),
             SizedBox(
               height: 17.h,
             ),
             Container(
               width: Get.size.width-30.w,
               height: Dimensions.height65,
               decoration:  BoxDecoration(
                 color: Color(0xff7BD85A),
                 borderRadius: BorderRadius.all(
                   Radius.circular(Dimensions.paddingLeft10),
                 ),
               ),
               child: InkWell(
                 onTap: () {
                   Share.share("https://www.google.com/");
                 },
                 child:const  Center(
                   child: Text(
                     'Condividi il tuo codice invito',
                     style: TextStyle(color: Colors.white),
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: 15.h,
             ),
             UserProfileSettingBtn( title: "ii mio account",icon: Icons.edit_note_outlined,onpress: (){
               Get.toNamed(Paths.user_Setting);
             }),
              SizedBox(
               height:10.h,
             ),
              UserProfileSettingBtn(title: Strings.notifiche,icon: Icons.notifications_none_outlined,onpress: (){
               // Get.toNamed(Paths.userNotification);
               Get.to(UserNotification());
              }),
                            SizedBox(
               height: 10.h,
             ),
              UserProfileSettingBtn(title: "Archiviazione", icon: Icons.file_copy_outlined,onpress: (){
                Get.to(Archiviazione(),transition: Transition.fadeIn);
              }),
             SizedBox(
               height: 10.h,
             ),
             UserProfileSettingBtn(title: "FAQ",icon: Icons.question_answer_outlined,onpress: (){}),
             ],
            ),
          ),
        ),
      ),
    ));
  }

  Widget bottomsheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .2,
      margin:  EdgeInsets.symmetric(vertical: Dimensions.fontSize20, horizontal: Dimensions.paddingLeft10),
      child: Column(
        children: [
           Text(
            "Choose Profile Photo",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: Dimensions.fontSize20),
          ),
           SizedBox(
            height: Dimensions.height50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: Dimensions.paddingvertical5,
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          fontSize: Dimensions.fontSize20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  ],
                ),
                onTap: () {
                  print("Gallery");
                  _getFromGallery();
                },
              ),
               SizedBox(
                width: Dimensions.containerwidth180,
              ),
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      height: Dimensions.paddingvertical5
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(
                          fontSize: Dimensions.fontSize20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  ],
                ),
                onTap: () {
                  print("Camera");
                  // takePhoto(ImageSource.camera);
                  //takeFromCamera();
                  _getFromCamera();
                },
              )
            ],
          )
        ],
      ),
    );
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: Dimensions.width190,
      maxHeight: Dimensions.height90*2,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
    Navigator.pop(context);
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: Dimensions.width190,
      maxHeight: Dimensions.height90*2,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        Navigator.pop(context);
      });
    }
  }
}

class UserProfileSettingBtn extends StatelessWidget {
   UserProfileSettingBtn({
    Key? key,required this.icon,required this.onpress,this.title
  }) : super(key: key);
IconData icon;
String? title;
Function() onpress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
          width: Get.size.width-30.w,
          height: Dimensions.height60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.paddingLeft10),
            border: Border.all(color: Colors.white),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(4.0, 5.0),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(
              child: Row(
                children: [
                    Padding(
                padding: EdgeInsets.only(left: 13.w),
                child: Icon(
                  icon,
                  size: Dimensions.fontsize30,
                  color: Color.fromARGB(224, 0, 70, 250),
                ),
              ),
               Padding(
                padding: EdgeInsets.only(left: Dimensions.fontSize20),
                child: Text(
                  title.toString(),
                  style:
                      TextStyle(fontSize: Dimensions.fontSize18, color: Colors.grey),
                ),
              ),
                ],
              ),
             ),
              Padding(
                padding:  EdgeInsets.only(left: Dimensions.height65),
                child: InkWell(
                
                  child: const Icon(Icons.arrow_forward_ios,
                      color: Color.fromARGB(224, 0, 70, 250)),
                ),
              ),
            ],
          )),
    );
  }
}

class TextField {
  static textFormField({
    required String lable,
    hintText,
    TextEditingController? controller,
  }) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter your ${lable}';
        }
        return null;
      },
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 14, color: Colors.white),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        label: Text(lable),
        hintText: '',
      ),
    );
  }
}
