import 'package:flutter/cupertino.dart';

class DataModel{
  String temp ;
  String spO2 ;
  DateTime date;


  DataModel(
    this.temp,
    this.spO2,
    this.date,
  );

  DataModel.map(dynamic obj) {
        this.temp = obj['temp'];
    this.spO2 = obj['spO2'];
    this.date = DateTime.parse(obj['date']);

  }
      

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    
    map['temp'] = temp;
    map['spO2'] = spO2;
    map['date'] = date.toIso8601String();
    return map;
  }



  DataModel.fromMap(Map<String, dynamic> map)  {
        this.temp = map['temp'];
    this.spO2 = map['spO2'];
    this.date = DateTime.parse(map['date']);

  }

}
