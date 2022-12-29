import 'package:flutter/material.dart';
import 'package:influencer/util/dimension.dart';

class CommonEditText extends StatefulWidget {
  String? hint;
  //FormFieldValidator formvalidate;
  Widget? icon;
  CommonEditText({
    Key? key,
    //required this.formvalidate,
    this.icon,
    this.hint
  }) : super(key: key);


  @override
  State<CommonEditText> createState() => _CommonEditTextState();
}

class _CommonEditTextState extends State<CommonEditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Dimensions.height40,
        width: double.infinity,
        child: TextFormField(
          cursorWidth: 1,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.icon,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
            ),
          ),
        ));
  }
}
