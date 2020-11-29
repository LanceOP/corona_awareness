import 'package:flutter/material.dart';

List imgList = [
  'assets/images/blue1.png',
  'assets/images/blue2.png',
  'assets/images/blue3.png',
  'assets/images/blue4.png',
  'assets/images/pic1.png',
  'assets/images/pic2.png',
  'assets/images/pic3.png',
  'assets/images/safe_greetings.png',
  'assets/images/handshaking.png',
  'assets/images/wearing_gloves.png'
];

cTitle(color){
  return TextStyle(
    fontSize:19,
    fontWeight: FontWeight.bold,
    fontFamily: 'Arvo',
    color: color,
  );
}

var rFont=TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  fontFamily: 'Patrick Hand',
  color: Colors.black,
);

rFontColor(color){
  return TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Patrick Hand',
    color: color,
  );
}
