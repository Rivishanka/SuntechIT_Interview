import 'package:flutter/material.dart';

import '../constants.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key key,
    @required this.hintText,
    @required this.icon,
    @required this.iconColor,
    @required this.obscureText,
    @required this.controller
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final Color iconColor;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconColor,),
        hintText: hintText,
        hintStyle: TextStyle(color: KHintTextColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kTextLightColor)
        ),
      ),
    );
  }
}