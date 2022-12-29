import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';


import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:influencer/admin_module/admin_archived/view/widgets/admin_archived_chating.dart';
class AdminArchivedEmoji extends StatelessWidget {
   AdminArchivedEmoji({Key? key}) : super(key: key);

   final TextEditingController _controller = TextEditingController();
   bool emojiShowing = false;
   final FocusNode focusNode = FocusNode();
 
  @override
  Widget build(BuildContext conrtext) {

    return  Offstage(
      // offstage: !emojiShowing,
      offstage: false,

      child: SizedBox(
          height: 250.h,
          child: EmojiPicker(
            textEditingController: _controller,
            config: Config(
              columns: 7,
              // Issue: https://github.com/flutter/flutter/issues/28894
              emojiSizeMax: 32 *
                  (foundation.defaultTargetPlatform == TargetPlatform.android
                      ? 1.30
                      : 1.0),
              verticalSpacing: 0,
              horizontalSpacing: 0,
              gridPadding: EdgeInsets.zero,
              bgColor: const Color(0xFFF2F2F2),
              indicatorColor: Colors.blue,
              iconColor: Colors.grey,
              iconColorSelected: Colors.blue,
              backspaceColor: Colors.blue,
              skinToneDialogBgColor: Colors.white,
              skinToneIndicatorColor: Colors.grey,
              enableSkinTones: true,
              showRecentsTab: false,

              replaceEmojiOnLimitExceed: false,

              tabIndicatorAnimDuration: kTabScrollDuration,
              categoryIcons: const CategoryIcons(),
              buttonMode: ButtonMode.MATERIAL,
              checkPlatformCompatibility: true,
            ),
          )),
    );
  }

  
}