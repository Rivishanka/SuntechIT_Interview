import 'package:flutter/material.dart';

import '../constants.dart';

class filterChipWidget extends StatefulWidget{
  final String chipName;
  final ValueChanged<int> addPad;
  final ValueChanged<int> removePad;

  const filterChipWidget({Key key, this.chipName, this.addPad, this.removePad}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
       
      selected: _isSelected,
      showCheckmark: false,
      
      avatar: _isSelected
        ? Icon(Icons.check, color: Colors.white)
        :Icon(Icons.add, color: Colors.grey,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: _isSelected ? Colors.blue : Colors.grey,
        )
      ),
      label: Text(widget.chipName,
        style: TextStyle(
          color: _isSelected ? Colors.white : Colors.black,
        ),
      ),
      labelStyle: TextStyle(color: kTextColor, fontSize: 16.0, fontWeight: FontWeight.bold),
      
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          if(isSelected){
            widget.addPad(1);
          } else{
            widget.removePad(1);
          }
        });
      },
      
      backgroundColor: Colors.white,
      selectedColor: Colors.blue,
      checkmarkColor: Colors.white,
      
    );
  }
}