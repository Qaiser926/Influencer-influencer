import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';

import 'package:influencer/routes/app_pages.dart';
import 'package:influencer/admin_module/profile/profile.dart';
import 'package:influencer/userModule/user_two_way_channel/model/two_way_modelclass.dart';
import 'package:influencer/userModule/user_two_way_channel/model/two_way_user_model.dart';
import 'package:influencer/userModule/user_two_way_channel/view/component/user_bottom_sheet.dart';
import 'package:influencer/userModule/user_two_way_channel/view/widgets/user_twoway_chating_videocall.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/commonText.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/image_const.dart';
import 'package:influencer/util/string.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:path_provider/path_provider.dart';

class UserSideTwoWayChating extends StatefulWidget {
  // final LocalFileSystem localFileSystem;
  final UserSideTwoWayUserModel? user;
  // UserSideTwoWayChating({localFileSystemm,this.user}) : this.localFileSystem = localFileSystem ?? LocalFileSystem();

  UserSideTwoWayChating({this.user});

  @override
  _UserSideTwoWayChatingState createState() => _UserSideTwoWayChatingState();
}

class _UserSideTwoWayChatingState extends State<UserSideTwoWayChating> {
  final TextEditingController controller = TextEditingController();
  bool emojiShowing = false;
  bool isbutton = false;
  final FocusNode focusNode = FocusNode();

  bool isRecording = false;
  bool isstart = true;
  @override
  void initState() {
    super.initState();

    _initialiseControllers();
    initRecorder();
    _init();
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
    recorderController.dispose();
  }

  bool isButton = false;

  final recorder = FlutterSoundRecorder();

  FlutterAudioRecorder2? _recorder;
  Recording? _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;

  Future initRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Permission not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future startRecord() async {
    
    await recorder.startRecorder(toFile: "/audio_recorder_");

  }

  Future stopRecorder() async {

    final filePath = await recorder.stopRecorder();

    // final file = File(filePath!);
    print('Recorded file path: $filePath');
  }

  File? imageFile;

  _chatBubble(UserSideTwoWayMessage message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: Dimensions.padding8,
                    ),
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
                      child: CircleAvatar(
                        radius: 22.r,
                        child: Image.asset(widget.user!.imageUrl.toString()),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.70,
              ),
              padding: EdgeInsets.all(Dimensions.paddingLeft10),
              margin: EdgeInsets.symmetric(vertical: Dimensions.paddingLeft10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.textsize15),
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
      return Row(
        // textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
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
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.blue,
                        backgroundImage: AssetImage(ImageConstant.dummyImage3),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
          SizedBox(
            width: Dimensions.height6,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.70,
              ),
              padding: EdgeInsets.all(Dimensions.paddingLeft10),
              margin: EdgeInsets.symmetric(vertical: Dimensions.paddingLeft10),
              decoration: BoxDecoration(
                color: IColor.recieve_message_container_color,
                borderRadius: BorderRadius.circular(Dimensions.textsize15),
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
                  SizedBox(height: 10.h,),
                  appbar(),

                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.all(Dimensions.fontSize20),
                      itemCount: UserSidetwowaymessage.length,
                      itemBuilder: (BuildContext context, int index) {
                        final UserSideTwoWayMessage message = UserSidetwowaymessage[index];
                        final bool isMe = message.sender.id == usersideTwowayCurrentUser.id;
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
                        padding: EdgeInsets.all(Dimensions.padding8),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.fontSize20),
                                    color: Colors.white),
                                width: MediaQuery.of(context).size.width - 80,
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 100),
                                  child: isRecording
                                      ? Container(
                                          height: 100.h,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 6.w,
                                                  ),
                                                Text(
                                                          '${_current?.duration!.toHHMMSS()}'),
                                                  AudioWaveforms(

                                                    enableGesture: true,
                                                    size: Size(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.3,
                                                        40),
                                                    recorderController:
                                                        recorderController,
                                                    waveStyle: const WaveStyle(
                                                        waveColor: Colors.black,
                                                        showTop: false,
                                                        
                                                        extendWaveform: true,
                                                        showMiddleLine: false,
                                                        showHourInDuration:
                                                            true),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      // color: const Color(0xFF1E1B26),
                                                    ),
                                                    padding: EdgeInsets.only(
                                                      top: 10.h,
                                                        left: 18.w),
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.w),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                    IconButton(onPressed: (){
                                                      _startOrStopRecording();
                                                    }, icon: Icon(Icons.delete,color: Colors.red,size: 30.sp,)),
                                                  
                                                  TextButton(
                                                    onPressed: () {
                                                      if(_currentStatus.index==2){
                                                        _pause();
                                                        setState(() {
                                                          
                                                        });
                                                      }else{
                                                        _resume();
                                                        setState(() {
                                                          
                                                        });
                                                      }
                                                    },
                                                   
                                                    child: _buildText(
                                                        _currentStatus),
                                                    style: ButtonStyle(
                                                      
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                      Colors.transparent,
                                                    )),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
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
                                          controller: controller,
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
                                                        TwoWayBottomSheet());
                                              },
                                              icon: Icon(Icons.attachment),
                                            ),
                                            contentPadding: EdgeInsets.all(
                                                Dimensions.paddingvertical5),
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
                              width: Dimensions.fontSize12,
                            ),
                            isbutton
                                ? InkWell(
                                    onTap: () {
                                   
                                    },
                                    child: CircleAvatar(
                                      radius: 22.r,
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
                      // TwoWayEmoji()
                      Offstage(
                        offstage: !emojiShowing,
                        child: SizedBox(
                            height: 200.h,
                            child: EmojiPicker(
                              textEditingController: controller,
                              config: Config(
                                columns: 7,
                                // Issue: https://github.com/flutter/flutter/issues/28894
                                emojiSizeMax: 32 *
                                    (foundation.defaultTargetPlatform ==
                                            TargetPlatform.android
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
                      ),
                    ],
                  ),

                  // emojiPicker()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _init() async {
    try {
      bool hasPermission = await FlutterAudioRecorder2.hasPermissions ?? false;

      if (hasPermission) {
        String customPath = '/audio_recorder_';
        io.Directory appDocDirectory;
//        io.Directory appDocDirectory = await getApplicationDocumentsDirectory();
        if (io.Platform.isIOS) {
          appDocDirectory = await getApplicationDocumentsDirectory();
        } else {
          appDocDirectory = (await getExternalStorageDirectory())!;
        }

        // can add extension like ".mp4" ".wav" ".m4a" ".aac"
        customPath = appDocDirectory.path +
            customPath +
            DateTime.now().millisecondsSinceEpoch.toString();

        _recorder =
            FlutterAudioRecorder2(customPath, audioFormat: AudioFormat.AAC);

        await _recorder!.initialized;
        // after initialization
        var current = await _recorder!.current(channel: 0);
        print(current);
        // should be "Initialized", if all working fine
        setState(() {
          _current = current;
          _currentStatus = current!.status!;
          print(_currentStatus);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("You must accept permissions")));
      }
    } catch (e) {
      print(e);
    }
  }

  _start() async {
    try {
      await _recorder!.start();
      var recording = await _recorder!.current(channel: 0);
      setState(() {
        _current = recording;
      });

      const tick = const Duration(milliseconds: 50);
      new Timer.periodic(tick, (Timer t) async {
        if (_currentStatus == RecordingStatus.Stopped) {
          t.cancel();
        }

        var current = await _recorder!.current(channel: 0);
        // print(current.status);
        setState(() {
          _current = current;
          _currentStatus = _current!.status!;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  _resume() async {
    await _recorder!.resume();
      await recorderController.record(path);
    setState(() {});
  }

  _pause() async {
    await _recorder!.pause();
      await recorderController.stop();
    setState(() {});
  }

  _stop() async {
    var result = await _recorder!.stop();
    // File file = widget.localFileSystem.file(result!.path);
    setState(() {
      // _current = result;
    
      // _currentStatus = _current!.status!;
      
    });
  }

  Widget _buildText(RecordingStatus status) {

    var icon;
    if(_currentStatus.index==2){
      
      setState(() {
        icon = Icons.pause;
      });
    }
    else{
     
      setState(() {
         icon = Icons.play_arrow;
      });
    }
    
    return Container(
        height: 50,
        width: 50,
        child: IconButton(
          icon: Icon(icon,size: 30.sp,),
          onPressed: null,
        ));
  }

  void _startOrStopRecording() async {
  
    if (isRecording) {
      
      recorderController.reset();
      await stopRecorder();
    
      setState(() {   _stop();});
      if (path != null) {}
    } else {
       _start();
      await recorderController.record(path);
    }
    setState(() {
      isRecording = !isRecording;
    });
  }
  void _refreshWave() {
    if (isRecording) recorderController.refresh();
  }

  Container appbar() {
    return Container(
      child: Column(
        children: [
          Padding(
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
                              padding:
                                  EdgeInsets.only(right: Dimensions.fontSize12),
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
                              child:
                                  Image.asset(widget.user!.imageUrl.toString()),
                              radius: 22.r,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width8,
                          ),
                          online_offline_message(),
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
                            child:
                                Icon(Icons.call, color: IColor.mainBlueColor),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(TwowayChatingVideoCall());
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
          ),
          Text(Strings.oggi)
        ],
      ),
    );
  }

  RichText online_offline_message() {
    return RichText(
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
    );
  }
}
