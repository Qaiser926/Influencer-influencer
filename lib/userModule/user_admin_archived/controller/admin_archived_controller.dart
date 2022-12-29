import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminArchivedController extends GetxController{

  var selectImagePath=''.obs;
  var selectedImageSize=''.obs;

 List<dynamic> data=[];
void getImage(ImageSource imageSource)async{
  final pickedFile=await ImagePicker().getImage(source: imageSource);
  if(pickedFile!=null){
    selectImagePath.value=pickedFile.path;
    selectedImageSize.value=((File(selectImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+"Mb";
  }else{
    Get.snackbar('Error', 'No Image Selected',snackPosition: SnackPosition.BOTTOM);
  }
}
// camera image
void getCameraImage(ImageSource imageSource)async{
  final pickedFile=await ImagePicker().getImage(source: imageSource);
  if(pickedFile!=null){
    selectImagePath.value=pickedFile.path;
    selectedImageSize.value=((File(selectImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+"Mb";
  }else{
    Get.snackbar('Error', 'No Image Selected',snackPosition: SnackPosition.BOTTOM);
  }
}


// pic audio file    



}