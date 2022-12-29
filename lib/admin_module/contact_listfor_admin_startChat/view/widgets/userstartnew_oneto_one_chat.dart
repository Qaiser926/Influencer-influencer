import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:influencer/admin_module/admin_archived/controller/admin_archived_controller.dart';
import 'package:influencer/admin_module/admin_archived/view/component/googlemap.dart';
import 'package:influencer/admin_module/contact_listfor_admin_startChat/model/contact_list_modelclass.dart';
import 'package:influencer/admin_module/contact_listfor_admin_startChat/model/userdata.dart';
import 'package:influencer/routes/app_pages.dart';

import 'package:influencer/admin_module/profile/profile.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:permission_handler/permission_handler.dart';

class ContactListAdminChatingOneToOne extends StatefulWidget {
  final ContactListUserData? user;

  ContactListAdminChatingOneToOne({this.user});

  @override
  _ContactListAdminChatingOneToOneState createState() =>
      _ContactListAdminChatingOneToOneState();
}

class _ContactListAdminChatingOneToOneState
    extends State<ContactListAdminChatingOneToOne> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;
  final FocusNode focusNode = FocusNode();

  bool isRecording = false;
  @override
  void initState() {
    super.initState();

    _initialiseControllers();
    initRecorder();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // _soundRecorder.closeRecorder();
    super.dispose();
    _disposeControllers();
    recorder.closeRecorder();
  }

  late final RecorderController recorderController;
  late final PlayerController playerController1;

  String? path;
  String? musicFile;
  // late Directory appDirectory;

  void _initialiseControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.amr_nb
      ..androidOutputFormat = AndroidOutputFormat.three_gpp
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 1000
      ..bitRate = 4000;
    playerController1 = PlayerController()
      ..addListener(() {
        if (mounted) setState(() {});
      });
  }

  void _disposeControllers() {
    // recorderController.dispose();
    playerController1.stopAllPlayers();
  }

  bool isButton = false;

  final recorder = FlutterSoundRecorder();

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Permission not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future startRecord() async {
    await recorder.startRecorder(toFile: "audio");
  }

  Future stopRecorder() async {
    final filePath = await recorder.stopRecorder();
    final file = File(filePath!);
    print('Recorded file path: $filePath');
  }

  final AdminArchivedController controller =
      Get.put<AdminArchivedController>(AdminArchivedController());

  String fileType = 'All';
  FilePickerResult? result;
  PlatformFile? file;

  File? imageFile;
  Contact? _phoneContact;

  bool isbutton = false;

  _chatBubble(ContactLIstUserDataMessage message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      Dimensions.fontSize12,
                    ),
                    bottomLeft: Radius.circular(Dimensions.fontSize12),
                    bottomRight: Radius.circular(Dimensions.fontSize12)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80,
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: IColor.recieve_message_container_color,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      // child: CircleAvatar(
                      //   radius: 15,
                      //   backgroundColor: Colors.blue,
                      // ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  // _sendMessageArea() {
  //   return }

  @override
  Widget build(BuildContext context) {
    int? prevUserId;
    return WillPopScope(
      onWillPop: () {
        if (emojiShowing) {
          setState(() {
            emojiShowing = false;
          });
        } else {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    // width: double.infinity,
                    // height: Dimensions.height135,
                    child: Column(
                      children: [
                       
                        appBar(),
                        Text(Strings.oggi)
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.all(Dimensions.fontSize20),
                      itemCount: getcontactListdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ContactLIstUserDataMessage message =
                            getcontactListdata[index];
                        final bool isMe = message.sender.id == ContactListcurrentUser.id;
                        final bool isSameUser = prevUserId == message.sender.id;
                        prevUserId = message.sender.id;
                        return _chatBubble(message, isMe, isSameUser);
                      },
                    ),
                  ),
                  // _sendMessageArea(),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.fontSize20),
                        child: Row(
                          children: [
                            CommonText(
                              title: widget.user!.name.toString(),
                              color: IColor.grey_color,
                            ),
                            SizedBox(
                              width: Dimensions.height4,
                            ),
                            CommonText(
                              title: Strings.sta_scrivendo,
                              color: IColor.grey_color,
                            )
                          ],
                        ),
                      )),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    color: Colors.white),
                                width: MediaQuery.of(context).size.width - 80.w,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 100),
                                  child: isRecording
                                      ? Row(
                                        children: [
                                               SizedBox(
                                width: 6.w,
                              ),
                              StreamBuilder<RecordingDisposition>(
                                builder: (context, snapshot) {
                                  final duration = snapshot.hasData
                                      ? snapshot.data!.duration
                                      : Duration.zero;

                                  String twoDigits(int n) =>
                                      n.toString().padLeft(2, '0');

                                  final twoDigitMinutes = twoDigits(
                                      duration.inMinutes.remainder(60));
                                  final twoDigitSeconds = twoDigits(
                                      duration.inSeconds.remainder(60));

                                  return Text(
                                    '$twoDigitMinutes:$twoDigitSeconds',
                                 
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                                stream: recorder.onProgress,
                              ),
                                          AudioWaveforms(
                                              enableGesture: true,
                                              size: Size(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  50),
                                              recorderController:
                                                  recorderController,
                                              waveStyle: const WaveStyle(
                                                  waveColor: Colors.black,
                                                  extendWaveform: true,
                                                  showMiddleLine: false,
                                                  showHourInDuration: true),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                // color: const Color(0xFF1E1B26),
                                              ),
                                              padding: EdgeInsets.only(left: 18.w),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                            ),
                                        ],
                                      )
                                      : TextFormField(
                                          onChanged: (value) {
                                            if (value.length > 0) {
                                              setState(() {
                                                isbutton = true;
                                              });
                                            } else {
                                              setState(() {
                                                isbutton = false;
                                              });
                                            }
                                          },
                                          controller: _controller,
                                          focusNode: focusNode,
                                          keyboardType: TextInputType.multiline,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (builder) =>
                                                          bottomsheet());
                                                },
                                                icon: Icon(Icons.attachment)),
                                            contentPadding: EdgeInsets.all(5),
                                            hintText:
                                                Strings.chating_search_hinttext,
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            alignLabelWithHint: true,
                                            border: InputBorder.none,
                                            prefixIcon: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    focusNode.unfocus();
                                                    focusNode.canRequestFocus =
                                                        false;
                                                    emojiShowing =
                                                        !emojiShowing;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.emoji_emotions,
                                                )),
                                          ),
                                        ),
                              
                                )),
                            SizedBox(
                              width: 12.w,
                            ),
                            isbutton
                                ? InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      radius: 25,
                                      child: Icon(Icons.send),
                                    ),
                                  )
                                : InkWell(
                                    onTap: _startOrStopRecording,
                                    child: CircleAvatar(
                                      radius: 22.r,
                                      child: isRecording
                                          ? Icon(Icons.send)
                                          : Icon(
                                              Icons.mic,
                                            ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      emojiPicker(),
                    ],
                  )
                  // emojiPicker()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startOrStopRecording() async {
    if (recorder.isRecording) {
      await stopRecorder();
      setState(() {});
    } else {
      await startRecord();
      setState(() {});
    }
    if (isRecording) {
      recorderController.reset();
      await stopRecorder();
      setState(() {});
      if (path != null) {}
    } else {
      await recorderController.record(path);
    }
    setState(() {
      isRecording = !isRecording;
    });
  }

  void _refreshWave() {
    if (isRecording) recorderController.refresh();
  }

  Padding appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.fontSize16,
          vertical: Dimensions.paddingLeft10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Row(
              children: [
                InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                        padding: EdgeInsets.only(right: Dimensions.fontSize12),
                        child: Icon(Icons.arrow_back))),
                SizedBox(
                  width: Dimensions.sizedbox_width10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Profile());
                      },
                      child: CircleAvatar(
                        child: Image.asset(widget.user!.imageUrl.toString()),
                        radius: 24,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width8,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: widget.user?.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                          TextSpan(text: '\n'),
                          widget.user!.isOnline!
                              ? TextSpan(
                                  text: 'Online',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : TextSpan(
                                  text: 'Offline',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Paths.voiceCall);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.fontSize12),
                      child: Icon(Icons.call, color: IColor.mainBlueColor),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Paths.onetoOneChatingVideoCal);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.fontSize12),
                      child: Icon(
                        Icons.videocam_rounded,
                        color: IColor.mainBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 240.h,
      child: Card(
        margin: EdgeInsets.all(18.sp),

        // height: 278,
        // width: double.infinity,
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
                    Fluttertoast.showToast(
                        msg: 'Document Selected',
                        toastLength: Toast.LENGTH_LONG);
                  });
                  Get.back();
                }),
                iconCreation('Camera', Icons.camera_alt, Colors.redAccent, () {
                  controller.getImage(ImageSource.camera);

                  Get.back();
                  Fluttertoast.showToast(
                      msg: 'Camera Selected', toastLength: Toast.LENGTH_LONG);
                }),
                iconCreation('Gallery', Icons.insert_photo_sharp,
                    Colors.pinkAccent.shade400, () async {
                  // _getFromGallery();
                  result =
                      await FilePicker.platform.pickFiles(type: FileType.image);
                  if (result == null) return;
                  file = result!.files.first;
                  setState(() {
                    Fluttertoast.showToast(
                        msg: 'Gallery Selected',
                        toastLength: Toast.LENGTH_LONG);
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
                      Fluttertoast.showToast(
                          msg: 'Audio Selected',
                          toastLength: Toast.LENGTH_LONG);
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
                    Fluttertoast.showToast(
                        msg: 'Contact Selected',
                        toastLength: Toast.LENGTH_LONG);
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

  Widget iconCreation(
      String name, IconData icon, Color color, Function() onpress) {
    return GestureDetector(
      onTap: onpress,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
            radius: 28,
          ),
          SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    );
  }

  Widget emojiPicker() {
    return Offstage(
      offstage: !emojiShowing,
      child: SizedBox(
          height: 200.h,
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
