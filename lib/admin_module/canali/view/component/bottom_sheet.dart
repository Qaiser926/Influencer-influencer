import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:influencer/admin_module/admin_archived/controller/admin_archived_controller.dart';
import 'package:influencer/admin_module/admin_archived/view/component/googlemap.dart';
import 'package:influencer/util/dimension.dart';

class TwoWayBottomSheet extends StatefulWidget {
  TwoWayBottomSheet({Key? key}) : super(key: key);

  @override
  State<TwoWayBottomSheet> createState() => _TwoWayBottomSheetState();
}

class _TwoWayBottomSheetState extends State<TwoWayBottomSheet> {
  final AdminArchivedController controller =
      Get.put<AdminArchivedController>(AdminArchivedController());

  String fileType = 'All';
  FilePickerResult? result;
  PlatformFile? file;

  File? imageFile;
  Contact? _phoneContact;
  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      child: Card(
        margin: EdgeInsets.all(18.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconCreation('Document', Icons.insert_drive_file_rounded,
                    Colors.purple.shade700, () async {
                  result = await FilePicker.platform.pickFiles();
                  if (result == null) return;
                  file = result!.files.first;
                  setState(() {
                     Fluttertoast.showToast(msg: 'Document Selected',toastLength: Toast.LENGTH_LONG);
                  });
                  Get.back();
                }),
                iconCreation('Camera', Icons.camera_alt, Colors.redAccent, () {
                  controller.getImage(ImageSource.camera);

                  Get.back();
                   Fluttertoast.showToast(msg: 'Camera Selected',toastLength: Toast.LENGTH_LONG);
                }),
                iconCreation('Gallery', Icons.insert_photo_sharp,
                    Colors.pinkAccent.shade400, () async{
                 
                   result = await FilePicker.platform.pickFiles(type: FileType.image);
               if (result == null) return;
           file = result!.files.first;
          setState(() {
            Fluttertoast.showToast(msg: 'Gallery Selected',toastLength: Toast.LENGTH_LONG);
        });

                  Get.back();
                }),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(
                      'Audio', Icons.headphones, Colors.orange.shade700,
                      () async {
                    result = await FilePicker.platform
                        .pickFiles(type: FileType.audio);
                    if (result == null) return;
                    file = result!.files.first;
                    setState(() {
                       Fluttertoast.showToast(msg: 'Audio Selected',toastLength: Toast.LENGTH_LONG);
                    });
                    Get.back();
                  }),
                  iconCreation('Location', Icons.location_pin,
                      Colors.greenAccent.shade700, () {
               
                    Get.to(CurrentUserLocation());
                    // Get.back();
                  }),
                  iconCreation('Contact', Icons.person, Colors.blue, () async {
                    final PhoneContact contact =
                        await FlutterContactPicker.pickPhoneContact();
                         Fluttertoast.showToast(msg: 'Contact Selected',toastLength: Toast.LENGTH_LONG);
                    print(contact);
                    setState(() {
                      _phoneContact = contact;
                    });
                    Get.back();
                    //  Get.toNamed(Paths.numberPicker);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: Dimensions.width190,
      maxHeight: Dimensions.height90 * 2,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        Navigator.pop(context);
      });
    }
  }

  Widget iconCreation(
      String name, IconData icon, Color color, Function() onress) {
    return GestureDetector(
      onTap: onress,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
            radius: 28.r,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(name)
        ],
      ),
    );
  }
}
