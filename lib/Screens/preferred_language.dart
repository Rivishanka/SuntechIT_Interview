import 'package:alphabet_scroll_view/alphabet_scroll_view.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:suntech_it/Components/rounded_btn.dart';
import 'package:suntech_it/Model/languageModel.dart';
import 'package:suntech_it/Screens/interests.dart';

import '../constants.dart';

class PreferredLanguage extends StatefulWidget {
  @override
  _PreferredLanguageState createState() => _PreferredLanguageState();
}

class _PreferredLanguageState extends State<PreferredLanguage> {
  
  List<LanguageModel> languageModelList = [
    LanguageModel("Engligh (US)|Engligh (US)", true),
    LanguageModel("සිංහල|Sinhala", false),
    LanguageModel("தமிழ்|Tamil", false),
    LanguageModel("Spanish|Espaniol", false),
    LanguageModel("French|Français", false),
    LanguageModel("Lorum ipsum|Lorum ipsum", false),
    LanguageModel("Lorum ipsum|Lorum ipsum", false),
    LanguageModel("Lorum ipsum|Lorum ipsum", false),
    LanguageModel("Lorum ipsum|Lorum ipsum", false),
    LanguageModel("Lorum ipsum|Lorum ipsum", false),
    LanguageModel("gorum ipsum|Lorum ipsum", false),
    LanguageModel("morum ipsum|Lorum ipsum", false),
    LanguageModel("vorum ipsum|Lorum ipsum", false),
    LanguageModel("xorum ipsum|Lorum ipsum", false),
    LanguageModel("zorum ipsum|Lorum ipsum", false),
  ];

  List<String> list = [
    "Engligh (US)|Engligh (US)",
    "සිංහල|Sinhala",
    "தமிழ்|Tamil",
    "Spanish|Espaniol",
    "French|Français",
    "Lorum ipsum|Lorum ipsum",
    "Lorum ipsum|Lorum ipsum",
    "Lorum ipsum|Lorum ipsum",
    "Lorum ipsum|Lorum ipsum",
    "Lorum ipsum|Lorum ipsum",
    "gorum ipsum|Lorum ipsum",
    "morum ipsum|Lorum ipsum",
    "vorum ipsum|Lorum ipsum",
    "xorum ipsum|Lorum ipsum",
    "zorum ipsum|Lorum ipsum",

  ];

  int selectedIndex = 0;
  // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                "Preffered Languages",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 20.0,),

            Text(
              "Please select your preferred languages",
              style: TextStyle(
                fontSize: 16.0,
                color: kTextLightColor
              ), 
            ),
            
            SizedBox(height: 20.0,),

            Expanded(
              child: SizedBox(
                height: 100.0,
                child: AlphabetScrollView(
                  list: list.map((e) => AlphaModel(e)).toList(),
                  alignment: LetterAlignment.right, 
                  itemExtent: 50,
                  unselectedTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                  ),

                  selectedTextStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),

                  overlayWidget: (value) => Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kTextColor,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$value'.toUpperCase(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),

                  itemBuilder: (_, k, id) {
                    String nativeName = id;
                    String result = nativeName.substring(0, nativeName.indexOf('|'));
                    String languageName = nativeName.substring(nativeName.indexOf('|')+1);

                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: ListTile(
                        title: Text(result),
                        subtitle: Text(languageName),
                        trailing: CircularCheckBox(
                          inactiveColor: Colors.blue,
                          value: languageModelList[k].isSelected, 
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          onChanged: (x) {
                            setState(() {
                            languageModelList[k].isSelected = !languageModelList[k].isSelected; //to track boolean value of each list tile after tapping it
                            // if (languageModelList[k].isSelected == true) {
                            //   
                            // } else if (languageModelList[k].isSelected == false) {
                            //   
                            });
                          }
                        ),
                      ),

                    );
                  }
                ),
              ),
            ),

            SizedBox(height: 20.0,),

            Button(
              text: "Next",
              ontap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Interests()));
              },
            ),

            SizedBox(height: 20.0,),

          ],
        ),
      ),

    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text("SuntechIT", style: TextStyle(fontSize: 20.0, color: kTextColor),),
    );
  }
}