// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:influencer/admin_module/two_way_channel/view/widgets/detail_page.dart';
// import 'package:flutter/foundation.dart' as foundation;
// class UserSideTwoWayEmoji extends StatelessWidget {
//   final TextEditingController controller = TextEditingController();
//   bool emojiShowing = false;
//   final FocusNode focusNode = FocusNode();
//    UserSideTwoWayEmoji({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Offstage(
//       offstage: !emojiShowing,
//       child: SizedBox(
//           height: 200.h,
//           child: EmojiPicker(
//             textEditingController: controller,
//             config: Config(
//               columns: 7,
//               // Issue: https://github.com/flutter/flutter/issues/28894
//               emojiSizeMax: 32 *
//                   (foundation.defaultTargetPlatform == TargetPlatform.android
//                       ? 1.30
//                       : 1.0),
//               verticalSpacing: 0,
//               horizontalSpacing: 0,
//               gridPadding: EdgeInsets.zero,

//               bgColor: const Color(0xFFF2F2F2),
//               indicatorColor: Colors.blue,
//               iconColor: Colors.grey,
//               iconColorSelected: Colors.blue,
//               backspaceColor: Colors.blue,
//               skinToneDialogBgColor: Colors.white,
//               skinToneIndicatorColor: Colors.grey,
//               enableSkinTones: true,
//               showRecentsTab: false,
//               replaceEmojiOnLimitExceed: false,
//               tabIndicatorAnimDuration: kTabScrollDuration,
//               categoryIcons: const CategoryIcons(),
//               buttonMode: ButtonMode.MATERIAL,
//               checkPlatformCompatibility: true,
//             ),
//           )),
//     );
//   }
//   }
