
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
Color? color;
FontWeight? fontWeight;
String? title;
double? size;

TextOverflow? overflow;
   CommonText({
    Key? key,
    this.color= Colors.black,
    this.fontWeight,
    this.title,
    this.size,
    this.overflow,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title.toString(),textAlign: TextAlign.justify,
    style: TextStyle(color: color,fontWeight: fontWeight,fontSize: size),overflow: overflow,);
  }
}
