import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suntech_it/Components/FilterChipWidget.dart';

import '../constants.dart';

class Interests extends StatefulWidget {
  @override
  _InterestsState createState() => _InterestsState();
}

const TWO_PI = 3.14*2;

class _InterestsState extends State<Interests> {

  bool pressAttention = false; 
  bool isReligonExpanded = false;
  bool isTechExpanded = false;
  bool isLifeExpanded = false;
  bool isKnowExpanded = false;
  bool isComedyExpanded = false;
  bool isTravelExpanded = false;

  bool _progressBarActive = true;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),

      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Text(
                  "Tap on Your Interests",
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20.0,),

              Text(
                "Tap to Select what you like. Please select",
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontSize: 16.0,
                  color: kTextLightColor
                ), 
              ),
              Text(
                "more than 4 to proceed.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontSize: 16.0,
                  color: kTextLightColor
                ), 
              ),
              SizedBox(height: 20.0,),

              ExpansionTile(
                onExpansionChanged: (bool expanding) => setState(() => this.isReligonExpanded = expanding),

                leading: ClipOval(child: SvgPicture.asset("assets/icons/please.svg", height: 28, width: 28,),),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 95),
                  child: isReligonExpanded 
                  ? Icon(Icons.close)
                  : Icon(Icons.add),
                ),
                title: Text("Religion"),
                children: [
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: [
                      filterChipWidget(chipName: 'Buddhism',),
                      filterChipWidget(chipName: 'Hinduism',),
                      filterChipWidget(chipName: 'Christianity',),
                      filterChipWidget(chipName: 'Chinese Tradional Religion',),
                      filterChipWidget(chipName: 'African Tradional Religion',),
                      filterChipWidget(chipName: 'Christianity',),
                      filterChipWidget(chipName: 'Buddhism',),
                      filterChipWidget(chipName: 'Hinduism',),
                      filterChipWidget(chipName: 'Christianity',)
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                onExpansionChanged: (bool expanding) => setState(() => this.isTechExpanded = expanding),

                leading: ClipOval(child: SvgPicture.asset("assets/icons/robot.svg", height: 28, width: 28,),),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 115),
                  child: isTechExpanded 
                  ? Icon(Icons.close)
                  : Icon(Icons.add),
                ),
                title: Text("Tech"),
                children: [
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: [
                      filterChipWidget(chipName: 'Item Name',),
                      filterChipWidget(chipName: 'Item Name',),
                      filterChipWidget(chipName: 'Item Name',),
                      filterChipWidget(chipName: 'Item Name',),
                      filterChipWidget(chipName: 'Item Name',),
                      filterChipWidget(chipName: 'Item Name',),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                onExpansionChanged: (bool expanding) => setState(() => this.isLifeExpanded = expanding),

                leading: ClipOval(child: SvgPicture.asset("assets/icons/flower.svg", height: 28, width: 28,),),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 125),
                  child: isLifeExpanded 
                  ? Icon(Icons.close)
                  : Icon(Icons.add),
                ),
                title: Text("Life"),
                children: [
                  Text("Item list here")
                ],
              ),
              ExpansionTile(
                onExpansionChanged: (bool expanding) => setState(() => this.isKnowExpanded = expanding),

                leading: ClipOval(child: SvgPicture.asset("assets/icons/book.svg", height: 28, width: 28,),),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 72),
                  child: isKnowExpanded 
                  ? Icon(Icons.close)
                  : Icon(Icons.add),
                ),
                title: Text("Knowledge"),
                children: [
                  Text("Item list here")
                ],
              ),
              ExpansionTile(
                onExpansionChanged: (bool expanding) => setState(() => this.isComedyExpanded = expanding),

                leading: ClipOval(child: SvgPicture.asset("assets/icons/laughing.svg", height: 28, width: 28,),),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 92),
                  child: isComedyExpanded 
                  ? Icon(Icons.close)
                  : Icon(Icons.add),
                ),
                title: Text("Comedy"),
                children: [
                  Text("Item list here")
                ],
              ),
              ExpansionTile(
                onExpansionChanged: (bool expanding) => setState(() => this.isTravelExpanded = expanding),

                leading: ClipOval(child: SvgPicture.asset("assets/icons/beach.svg", height: 28, width: 28,),),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 42),
                  child: isTravelExpanded 
                  ? Icon(Icons.close)
                  : Icon(Icons.add),
                ),
                title: Text("Travel & Places"),
                children: [
                  Text("Item list here")
                ],
              ),

              SizedBox(height: 20.0,),

              TweenAnimationBuilder(
                tween: Tween(begin:0.0, end: 1.0), 
                duration: Duration(seconds: 4), 
                builder: (context, value, child) {
                  return Container(
                    width: 100,
                    height: 100,
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return SweepGradient(
                              startAngle: 0.0,
                              stops: [value, value],
                              endAngle: TWO_PI,
                              center: Alignment.center,
                              colors: [Colors.blue, Colors.grey.withAlpha(55)]
                            ).createShader(rect);
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              )
              
            ],
          ),
        ),
      ),
      
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/arrow_back.svg"), 
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        FlatButton(
          textColor: pressAttention ? Colors.blue : Colors.grey,
          onPressed: (){
            setState(() {
              pressAttention = !pressAttention;
            });
          }, 
          child: Text(
            "Done",
            style: TextStyle(fontSize: 20.0),
          ),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          
        )
      ],
      centerTitle: true,
      title: Text("SuntechIT", style: TextStyle(fontSize: 20.0, color: kTextColor),),
    );
  }
}