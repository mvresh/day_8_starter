import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Icon icon;
  Function callback;
  RoundButton(this.icon,this.callback);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: callback,
      child: icon,
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xFF4C5FE),
      constraints: BoxConstraints(minWidth: 56,minHeight: 56),
      padding: const EdgeInsets.all(15.0),);
  }
}