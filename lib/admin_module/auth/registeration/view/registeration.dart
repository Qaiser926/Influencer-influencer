import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:influencer/util/color.dart';
import 'package:influencer/util/editText.dart';

class InfluencerForm extends StatefulWidget {
  const InfluencerForm({Key? key}) : super(key: key);
  @override
  State<InfluencerForm> createState() => _InfluencerFormState();
}
class _InfluencerFormState extends State<InfluencerForm> {
  int _value2 = 0;

  List<String> items = <String>[
    'AUTO',
    'BENESSERE',
    'CIBO',
    'FASHION',
    'FOTOGRAFIA',
    'LINGERIE',
    'MAKEUP E TRUCCHI',
    'PARCHI TEMATICI',
    'RECENSIONI DI PRODOTTI',
    'SPORT',
    'VIAGGI',
    'VINO'
  ];
  String? dropdownValue;
  String? dropdownValue2;
  bool checkvalue = false;
  bool instagram = false;
  bool tiktok = false;
  bool isdisable = true;

  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    dropdownValue;
  }

  List categoryItemlist = [];
  String? dropdownValue3;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SafeArea(
        child: Scaffold(

          appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: InkWell(

                  onTap: (){

                    Get.back();
                  },

                  child: Icon(Icons.arrow_back)),
              elevation: 0,
              title: Image.asset(
                "assets/logo_img.png",
                height: height * .08,
                width: width * .35,
              )),
          body:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.h,vertical: 13.w),
            child: ListView(
              // physics: NeverScrollableScrollPhysics(),

              children: [
                txtname('NOME*'),
                space(),
                EditText(),
                space(),
                txtname('COGNOME*'),
                space(),
                EditText(),
                space(),
                //E-MAIL*
                txtname('E-MAIL*'),
                space( ),
                EditText(
                  // type: TextInputType.emailAddress
                ),
                space(),
                //DI COSA TI OCCUPI? (1° OPZIONE)
                txtname("DI COSA TI OCCUPI? (1° OPZIONE)"),
                space(),
                Container(
                  height: height * .05,
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      decoration:const InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(10, 0, 10, 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                      value: dropdownValue,
                      selectedItemBuilder: (BuildContext context) {
                        //<-- SEE HERE
                        return <String>[
                          'AUTO',
                          'BENESSERE',
                          'CIBO',
                          'FASHION',
                          'FOTOGRAFIA',
                          'LINGERIE',
                          'MAKEUP E TRUCCHI',
                          'PARCHI TEMATICI',
                          'RECENSIONI DI PRODOTTI',
                          'SPORT',
                          'VIAGGI',
                          'VINO'
                        ].map((String value) {
                          return Text(
                            dropdownValue.toString(),
                            style: TextStyle(
                                color: Colors.grey, fontSize: 14),
                          );
                        }).toList();
                      },
                      isExpanded: true,
                      elevation: 16,
                      // style: const TextStyle(color: BColor.color_white),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        // if(value!=dropdownValue2){
                        //   setState(() {
                        //     dropdownValue2=value!;
                        //   });
                        // }
                      },
                      items: items.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: RadioListTile(

                                value: value,
                                groupValue: dropdownValue,
                                title: Text(value,style: TextStyle(color: IColor.colorblack),),
                                // subtitle: Text("Radio 1 Subtitle"),
                                onChanged: (value) {
                                 if(value !=dropdownValue2){
                                   setState(() {
                                     dropdownValue = value.toString();
                                     Get.back();
                                   });
                                 }
                                },
                                activeColor: Colors.blue,
                                controlAffinity: ListTileControlAffinity.trailing,
                                selected: true,
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),

                space(),

                //DI COSA TI OCCUPI? (2° OPZIONE)
                txtname("DI COSA TI OCCUPI? (2° OPZIONE)"),
                space(),
                Container(
                  height: height * .05,
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.fromLTRB(10, 0, 10, 10),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                      ),
                      value: dropdownValue2,
                      selectedItemBuilder: (BuildContext context) {
                        //<-- SEE HERE
                        return <String>[
                          'AUTO',
                          'BENESSERE',
                          'CIBO',
                          'FASHION',
                          'FOTOGRAFIA',
                          'LINGERIE',
                          'MAKEUP E TRUCCHI',
                          'PARCHI TEMATICI',
                          'RECENSIONI DI PRODOTTI',
                          'SPORT',
                          'VIAGGI',
                          'VINO'
                        ].map((String value) {
                          return Text(
                            dropdownValue2.toString(),
                            style: TextStyle(
                                color: Colors.grey, fontSize: 14),
                          );
                        }).toList();
                      },
                      isExpanded: true,
                      elevation: 16,
                      // style: const TextStyle(color: BColor.color_white),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        // if (value != dropdownValue) {
                        //   setState(() {
                        //     dropdownValue2 =value ;
                        //   });
                        // }
                      },
                      items: items.map<DropdownMenuItem<String>>(
                              (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: RadioListTile(
                                value: value,
                                groupValue: dropdownValue2,
                                title: Text(value,style: TextStyle(color: IColor.colorblack)),
                                // subtitle: Text("Radio 1 Subtitle"),
                                onChanged: (value) {
                                  print("Radio Tile pressed $value");
                                if(value!=dropdownValue){
                                  setState(() {
                                    dropdownValue2 = value.toString();
                                    Get.back();
                                  });
                                }
                                },
                                activeColor: Colors.blue,
                                controlAffinity: ListTileControlAffinity.trailing,
                                selected: true,
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),

                space(),

                //PROVINCIA DI RESIDENCE*
                txtname("PROVINCIA DI RESIDENCE*"),
                space(),
                SizedBox(
                  height: height * .05,
                  width: double.infinity,
                  child: DropdownButtonFormField(
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding:
                      EdgeInsets.fromLTRB(10, 0, 10, 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                    ),
                    //dropdownColor: const Color(0xffF38222),
                    isExpanded: true,
                    items: categoryItemlist.map((item) {
                      return DropdownMenuItem(
                        value: item['id'].toString(),
                        child: Text(
                          item['maincat'].toString(),
                          style: TextStyle(
                              fontSize: 14, color: Color(0xffF38222)),
                        ),
                      );
                    }).toList(),
                    onChanged: (newVal) {
                      setState(() {
                        dropdownValue3 = newVal.toString();
                      });
                    },
                    value: dropdownValue3,
                  ),
                ),
                space(),

                //NUMERO DI TELEFONO*
                txtname("NUMERO DI TELEFONO*"),
                space(),
                EditText(
                  // type: TextInputType.number
                ),
                space(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Column(
                        children: [
                          Container(
                            height: height * .04,
                            width: width * .4,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffF392E3),
                                  Color(0xffDA96E6),
                                  Color(0xffC199E9),
                                  Color(0xff8DA1F0),
                                  Color(0xff63A8F6),
                                  Color(0xff3EADFC),
                                ]),
                                borderRadius: BorderRadius.circular(
                                    10)),
                            child: Center(
                                child: Text(
                                  "CONNETTI INSTAGRAM",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )),
                          ),
                          space()
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          instagram = !instagram;
                        });
                      },
                    ),
                    InkWell(
                      child: Column(
                        children: [
                          Container(
                            height: height * .04,
                            width: width * .3,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xffF392E3),
                                  Color(0xffDA96E6),
                                  Color(0xffC199E9),
                                  Color(0xff8DA1F0),
                                  Color(0xff63A8F6),
                                  Color(0xff3EADFC),
                                ]),
                                borderRadius: BorderRadius.circular(
                                    10)),
                            child: Center(
                                child: Text(
                                  "CONNETI TIKTOK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )),
                          ),
                          space()
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          tiktok = !tiktok;
                        });
                      },
                    )
                  ],
                ),
                Visibility(
                    visible: instagram,
                    child: Column(
                      children: [
                        EditText(
                          hint:
                          "Inserisci il nome utente del tuo Instagram",
                        ),
                        space()
                      ],
                    )),
                Visibility(
                    visible: tiktok,
                    child: Column(
                      children: [
                        EditText(
                          hint:
                          "Inserisci il nome utente del tuo tiktok",
                        ),
                        space()
                      ],
                    )),

                //PASSWORD (MASSIMO 8 CARATTERI)*
                txtname("PASSWORD (MASSIMO 8 CARATTERI)*"),
                space(),
                EditText(),
                space(),

                //CONFERMA PASSWORD*
                txtname("CONFERMA PASSWORD*"),
                space(),
                EditText(),
                space(),

                //CODICE INVITO/REFERRAL (OPZIONALE)*
                txtname("CODICE INVITO/REFERRAL (OPZIONALE)*"),
                space(),
                EditText(),
                space(),

                //PRIVACY POLICY
                txtname("PRIVACY POLICY"),
                Row(
                  children: [
                    Checkbox(
                      value: checkvalue,
                      activeColor: Color(0xff10C49F),
                      onChanged: (bool? newValue) {
                        setState(() {
                          checkvalue = newValue!;
                        });
                      },
                    ),
                    Text("PRIVACY POLICY")
                  ],
                ),
                Center(
                  child: InkWell(
                    child: Container(
                      height: height * .06,
                      width: width * .4,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xffF392E3),
                            Color(0xffDA96E6),
                            Color(0xffC199E9),
                            Color(0xff8DA1F0),
                            Color(0xff63A8F6),
                            Color(0xff3EADFC),
                          ]),
                          borderRadius: BorderRadius.circular(
                              10)),
                      child: Center(
                          child: Text(
                            "ISCRIVITI",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          )),
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),

        ),
      ),
    );

  }

  txtname(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.black, fontFamily: 'Montserrat', fontSize: 12),
    );
  }

  space() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .01,
    );
  }
}

class GroupModel {
  String text;
  int index;
  bool selected;

  GroupModel({required this.text,required this.index,required this.selected});
}