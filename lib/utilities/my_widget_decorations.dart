import 'package:flutter/material.dart';



InputDecoration buildInputDecoration(String value, {String hint = ""}) {
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff003458))
    ),
    labelStyle: TextStyle(color: Colors.black87),
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    labelText: value,
    hintText: hint,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}


BoxDecoration buildButtonBoxDecoration( Color color ){
  return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: color
  );
}

SnackBar buildCustomSnackBar(Color color, String message){
  return SnackBar(
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
    content: Text(message, textAlign: TextAlign.center,
    style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
  );
}


