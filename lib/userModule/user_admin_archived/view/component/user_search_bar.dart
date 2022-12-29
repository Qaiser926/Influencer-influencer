import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Usersidesearch_bar extends StatelessWidget {
   Usersidesearch_bar({
    Key? key,required this.title
  }) : super(key: key);
String title;
  @override
  Widget build(BuildContext context) {
    double h=Get.size.height;
    double w=Get.size.width;
    return Padding(
               padding:  EdgeInsets.only(left: h*0.023,right: h*0.023,top: h*0.012),
               child: Container(
     decoration: BoxDecoration(
             color: Colors.grey.shade50,
             borderRadius:
                 BorderRadius.circular(h*0.012),),
         height: h*0.08,
         width: double.infinity,
         child: TextFormField(
           
           decoration: InputDecoration(
           prefixIcon: Icon(Icons.search,color:Colors.black38,),  
             // filled: true,
             // fillColor: IColor.searchbar_color,
             contentPadding: EdgeInsets.symmetric(horizontal: h*0.02,vertical: h*0.023),
             border: InputBorder.none,
             hintText:title,
             hintStyle: TextStyle(color: Colors.grey)
           ),
         ),
               ),
             );
  }
}

