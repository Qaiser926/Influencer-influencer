
import 'package:flutter/material.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/dimension.dart';



class EditText extends StatefulWidget {
  String? hint;
  bool? suggestion;
  bool? autocorrect;
  bool? obscure;
  TextInputType? type;
  FormFieldValidator? formvalidate;
  Widget? icon;
  EditText({
    Key? key,
     this.hint,
    this.suggestion,
    this.autocorrect,
    this.obscure,
     this.formvalidate,
    this.icon,
    this.type,
  }) : super(key: key);


  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: Dimensions.height85,
      width: double.infinity,
      child: TextFormField(
        keyboardType: widget.type,
        // controller: _passwordController,
        validator:widget.formvalidate,
        cursorColor: Color(0xff424242),
        obscureText: obscure,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(

          filled: true,
            hintText: widget.hint,
            hintStyle:  TextStyle(
                color: IColor.colorblack,
                fontSize: Dimensions.fontSize16,),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.paddingRight10),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.paddingRight10),
              borderSide: const BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            contentPadding:  EdgeInsets.symmetric(vertical: Dimensions.fontSize18,horizontal: Dimensions.border13),

            prefixIcon: widget.icon,
            // filled: true,
            fillColor: const Color(0xffF2F2F3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.fontSize20),
              gapPadding: 5.0,
            )),
        style: const TextStyle(
            color:Colors.black, ),
      ),
    );

  }
}