
// import 'package:flutter/material.dart';
// import 'package:fluttercontactpicker/fluttercontactpicker.dart';


// class NumberPicker extends StatefulWidget {
//   @override
//   _NumberPickerState createState() => _NumberPickerState();
// }

// class _NumberPickerState extends State<NumberPicker> {
//   // final ContactPicker _contactPicker = ContactPicker();
//   Contact? _phoneContact;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ElevatedButton(
//                 child: Text("CLICK ME"),
//                   onPressed: () async {
//                     final PhoneContact contact = await FlutterContactPicker.pickPhoneContact();
//                     print(contact);
//                     setState(() {
//                       _phoneContact = contact;
//                     });
//                   }
//               ),
//               Text(
//                 _phoneContact == null ? 'No contact selected.' : _phoneContact.toString(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }