import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Metric {
  double temperature;
  double spo2;
  String mobile;
}

/*int timeInMillis = 1586348737122;
var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
var formattedDate = DateFormat.yMMMd().format(date);*/

class MetricRow {
  Metric metric;
  int timeInMillis;
  MetricRow(this.metric,this.timeInMillis);

  getFormattedDate(){
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    return date.toString();
  }
}

/*
class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
 */


class MetricStore {
  static final MetricStore _metricStore = MetricStore._internal();

    final FirebaseFirestore _db = FirebaseFirestore.instance;
  factory MetricStore(){
    return _metricStore;
  }

  MetricStore._internal();

  List<MetricRow> metrics =  List<MetricRow>();
  Metric metric_value = Metric();


  store(Metric metric, int timeInMillis) async {
    Metric copy = Metric();
    copy.temperature = metric.temperature;
    copy.spo2 = metric.spo2;
    copy.mobile = metric.mobile;
  this.metric_value = metric;

    this.metrics.insert(0, MetricRow(copy, timeInMillis));

_db
            .collection(metric.mobile)
            .doc(metric.temperature.toString())
            .set({
    'body_temp': metric.temperature,
    'spO2': metric.spo2,
    'date_time': DateTime.now().toIso8601String()
        });
  //   databaseReference.child(copy.mobile).set({
  //   'body_temp': metric.temperature,
  //   'spO2': metric.spo2,
  //   'date_time': DateTime.now().toIso8601String()
  // });

  SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setString("mobile", metric.mobile);

   
  }

  fetchLatest(){
    if(metrics.isNotEmpty){
      return metrics[0];
    }else{
      return null;
    }
  }

  Future<List<MetricRow>> fetch(double timeInMillis) async {
     List<MetricRow> returnList = List<MetricRow>();
    //  for(MetricRow i in this.metrics){
    //    if(i.timeInMillis >= timeInMillis){
    //      returnList.add(i);
    //    }
    //  }


    Metric copy = Metric();
    copy.mobile = this.metric_value.mobile;
    print(copy.mobile);    
  //   await databaseReference.child(this.metric_value.mobile).child('body_temp').once().then((DataSnapshot snapshot) {
          
  //   copy.temperature = snapshot.value;
    
  // });

  //   await  databaseReference.child(this.metric_value.mobile).child('spO2').once().then((DataSnapshot snapshot) {
          
  //   copy.spo2 = snapshot.value;
    
  // });


  MetricRow metricRow = MetricRow(copy, timeInMillis.toInt());
    returnList.add(metricRow);
     return returnList;
  }

}