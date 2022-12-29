import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:influencer/admin_module/admin_archived/model/admin_archived_modelclass.dart';
import 'package:influencer/admin_module/admin_archived/view/component/googlemap.dart';
import 'package:influencer/util/dimension.dart';
import 'package:influencer/util/string.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:permission_handler/permission_handler.dart';
import '../../controller/admin_archived_controller.dart';

class AdminArchivedChatingSearchBarLayout extends StatefulWidget {
  AdminArchivedChatingSearchBarLayout({Key? key, required this.adduser})
      : super(key: key);
  final Function(AdminArchivedMessage) adduser;

  @override
  State<AdminArchivedChatingSearchBarLayout> createState() =>
      _AdminArchivedChatingSearchBarLayoutState();
}

class _AdminArchivedChatingSearchBarLayoutState
    extends State<AdminArchivedChatingSearchBarLayout> {
  //  var _soundRecorder=FlutterSoundRecorder();
  final AdminArchivedController controller =
      Get.put<AdminArchivedController>(AdminArchivedController());

  final TextEditingController textcontroller = TextEditingController();

  bool emojiShowing = false;
  final FocusNode focusNode = FocusNode();
  String fileType = 'All';
  FilePickerResult? result;
  PlatformFile? file;

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
   FlutterAudioRecorder2? _recorder;
  Recording? _current;
  RecordingStatus _currentStatus = RecordingStatus.Unset;




  @override
  void dispose() {
    // _soundRecorder.closeRecorder();
    super.dispose();
    _disposeControllers();
    recorder.closeRecorder();
    textcontroller.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(Dimensions.padding8),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(Dimensions.fontSize20),
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
                                    MediaQuery.of(context).size.width / 2, 50),
                                recorderController: recorderController,
                                waveStyle: const WaveStyle(
                                    waveColor: Colors.black,
                                    extendWaveform: true,
                                    showMiddleLine: false,
                                    showHourInDuration: true),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  // color: const Color(0xFF1E1B26),
                                ),
                                padding: EdgeInsets.only(left: 18.w),
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                              ),
                            ],
                          )
                        : TextFormField(
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  isButton = true;
                                });
                              } else {
                                setState(() {
                                  isButton = false;
                                });
                              }
                            },
                            controller: textcontroller,
                            focusNode: focusNode,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        // builder: (builder) => TwoWayBottomSheet());
                                        builder: (builder) {
                                          return Container(
                                            height: 240.h,
                                            child: Card(
                                              margin: EdgeInsets.all(18.sp),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      iconCreation(
                                                          'Document',
                                                          Icons
                                                              .insert_drive_file_rounded,
                                                          Colors
                                                              .purple.shade700,
                                                          () async {
                                                        result =
                                                            await FilePicker
                                                                .platform
                                                                .pickFiles();
                                                        if (result == null)
                                                          return;
                                                        file =
                                                            result!.files.first;
                                                        setState(() {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Document Selected',
                                                              toastLength: Toast
                                                                  .LENGTH_LONG);
                                                        });

                                                        Get.back();
                                                      }),
                                                      iconCreation(
                                                          'Camera',
                                                          Icons.camera_alt,
                                                          Colors.redAccent, () {
                                                        controller.getImage(
                                                            ImageSource.camera);

                                                        Get.back();
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                'Camera Selected',
                                                            toastLength: Toast
                                                                .LENGTH_LONG);
                                                      }),
                                                      iconCreation(
                                                          'Gallery',
                                                          Icons
                                                              .insert_photo_sharp,
                                                          Colors.pinkAccent
                                                              .shade400,
                                                          () async {
                                                        // controller
                                                        //     .getImage(ImageSource.gallery);
                                                        result = await FilePicker
                                                            .platform
                                                            .pickFiles(
                                                                type: FileType
                                                                    .image);
                                                        if (result == null)
                                                          return;
                                                        file =
                                                            result!.files.first;
                                                        setState(() {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Gallery Selected',
                                                              toastLength: Toast
                                                                  .LENGTH_LONG);
                                                        });

                                                        Get.back();
                                                      }),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        iconCreation(
                                                            'Audio',
                                                            Icons.headphones,
                                                            Colors.orange
                                                                .shade700,
                                                            () async {
                                                          result = await FilePicker
                                                              .platform
                                                              .pickFiles(
                                                                  type: FileType
                                                                      .audio);
                                                          if (result == null)
                                                            return;
                                                          file = result!
                                                              .files.first;
                                                          setState(() {
                                                            Fluttertoast.showToast(
                                                                msg:
                                                                    'Aduio Pikced',
                                                                toastLength: Toast
                                                                    .LENGTH_LONG);
                                                          });
                                                          //  Fluttertoast.showToast(msg: msg);
                                                          Get.back();
                                                        }),
                                                        iconCreation(
                                                            'Location',
                                                            Icons.location_pin,
                                                            Colors.greenAccent
                                                                .shade700, () {
                                                          Get.to(
                                                              CurrentUserLocation());
                                                          // Get.back();
                                                        }),
                                                        iconCreation(
                                                            'Contact',
                                                            Icons.person,
                                                            Colors.blue,
                                                            () async {
                                                          final PhoneContact
                                                              contact =
                                                              await FlutterContactPicker
                                                                  .pickPhoneContact();
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Contact Pikced',
                                                              toastLength: Toast
                                                                  .LENGTH_LONG);

                                                          setState(() {
                                                            _phoneContact =
                                                                contact;
                                                          });
                                                          Get.back();

                                                          //  Get.toNamed(Paths.numberPicker);
                                                        }
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  icon: Icon(Icons.attachment)),
                              contentPadding:
                                  EdgeInsets.all(Dimensions.paddingvertical5),
                              hintText: Strings.chating_search_hinttext,
                              hintStyle: TextStyle(color: Colors.grey),
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                              prefixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      emojiShowing = !emojiShowing;
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
              isButton
                  ? InkWell(
                      onTap: () {},
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
        emoji(),
      ],
    );
  }

  File? imageFile;
  Contact? _phoneContact;

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

  Widget iconCreation(
      String name, IconData icon, Color color, Function() onress) {
    return GestureDetector(
      onTap: onress,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
            radius: 28.r,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(name)
        ],
      ),
    );
  }

  Widget emoji() {
    return Offstage(
      offstage: !emojiShowing,
      child: SizedBox(
          height: 200.h,
          child: EmojiPicker(
            textEditingController: textcontroller,
            config: Config(
              columns: 7,
              // Issue: https://github.com/flutter/flutter/issues/28894
              emojiSizeMax: 30 *
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

Widget fileDetails(PlatformFile file) {
  final kb = file.size / 1024;
  final mb = kb / 1024;
  final size =
      (mb >= 1) ? '${mb.toStringAsFixed(2)} MB' : '${kb.toStringAsFixed(2)} KB';
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('File Name: ${file.name}'),
        Text('File Size: $size'),
        Text('File Extension: ${file.extension}'),
        Text('File Path: ${file.path}'),
      ],
    ),
  );
}
