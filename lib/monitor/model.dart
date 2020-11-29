import 'package:flutter/material.dart';

class Metric {
  int temperature;
  int spo2;
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

  factory MetricStore(){
    return _metricStore;
  }

  MetricStore._internal();

  List<MetricRow> metrics =  List<MetricRow>();

  store(Metric metric, int timeInMillis) {
    Metric copy = Metric();
    copy.temperature = metric.temperature;
    copy.spo2 = metric.spo2;
    this.metrics.insert(0, MetricRow(copy, timeInMillis));
  }

  fetchLatest(){
    if(metrics.isNotEmpty){
      return metrics[0];
    }else{
      return null;
    }
  }

  fetch(double timeInMillis) {
     List<MetricRow> returnList = List<MetricRow>();
     for(MetricRow i in this.metrics){
       if(i.timeInMillis >= timeInMillis){
         returnList.add(i);
       }
     }
     // select * from table whet
     return returnList;
  }

}