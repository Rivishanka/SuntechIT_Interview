import 'package:circular_check_box/circular_check_box.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:suntech_it/Components/input_Text_Feild.dart';
import 'package:suntech_it/Components/rounded_btn.dart';
import 'package:suntech_it/Screens/preferred_language.dart';
import 'package:suntech_it/constants.dart';

class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool remember = false;

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image.asset("assets/images/blueSquare.png", width: 100, height: 100,),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.2),
                  //     spreadRadius: 4,
                  //     blurRadius: 20,

                  //   ),
                  // ]
                ),
                // child: Center(
                //   child: Icon(
                //     Icons.person_outline,
                //     size: 60,
                //     color: Colors.white,
                //   ),
                // ),

              ),
              SizedBox(height: 20.0,),

              Text(
                "Welcome Back",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.0,),

              Text(
                "We welcome you back to SuntechIT, \nPlease enter your existing login \ncredentials below",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: kTextLightColor
                ), 
              ),

              SizedBox(height: 20.0,),
            
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: CountryListPick(
                    initialSelection: 'US',
                    theme: CountryTheme(
                      isShowFlag: true,
                      isShowCode: true,
                      isDownIcon: true,
                      isShowTitle: false,
                    ),
                    onChanged: (code) {
                      print(code.name);
                      print(code.code);
                      print(code.dialCode);
                    },
                    
                  ),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: KHintTextColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kTextLightColor),
                  )
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 20.0,),

              InputText(
                hintText: "Password", 
                icon: Icons.lock_outline, 
                iconColor: kTextColor, 
                obscureText: true, 
                controller: password
              ),

              SizedBox(height: 20.0,),

              Row(
                children: [
                  CircularCheckBox(
                    value: remember,
                    activeColor: kTextColor,
                    inactiveColor: kTextColor,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    }
                  ),

                  SizedBox(width: 10.0,),

                  Text("Remind me next time"),
                ],

              ),

              SizedBox(height: 20.0,),

              Button(
                text: "Sign in",
                ontap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PreferredLanguage()));
                },
                
              ),

              SizedBox(height: 20.0,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member ? Register now",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 16.0
                    ),
                  ),

                  SizedBox(height: 20.0,),

                  Text(
                    "Forget Password ?",
                    style: TextStyle(
                      color: kTextLightColor
                    ),
                  )
                ],
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
        icon: SvgPicture.asset("assets/icons/arrow_back.svg"), onPressed: () {},
      ),
      centerTitle: true,
      title: Text("SuntechIT", style: TextStyle(fontSize: 20.0, color: kTextColor),),
    );
  }
}