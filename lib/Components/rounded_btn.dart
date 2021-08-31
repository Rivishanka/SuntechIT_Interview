import 'package:flutter/material.dart';

import '../constants.dart';

class Button extends StatelessWidget {
  const Button({
    @required this.text,
    @required this.ontap,
    Key key,
  }) : super(key: key);

  final String text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      child: RaisedButton(
        color: kTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        onPressed: ontap,
        child: Text(
          text, 
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}