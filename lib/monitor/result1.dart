import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';
import 'constantsResultWindow.dart';

class Result1 extends StatelessWidget {
  MetricStore store;
  Result1({this.store});
  String checkFever(){
    MetricRow latest = store.fetchLatest();
    if(latest != null){
      int temp = latest.metric.temperature;
      int spo2 = latest.metric.spo2;
      if((temp>=36 && temp<=37) && (spo2>=90 && spo2<=100)){
        return 'You don\'t have risk of Covid-19 infection';
      }else if((temp>37 || temp<36) && (spo2<90 || spo2>100))
      {
        return 'Enter correct range of values';
      }
      else{
        return 'You have risk of Covid-19 infection.';
      }
    }
    return "No data found\n";
  }
  @override
  Widget build(BuildContext context) {

    MetricRow latest = this.store.fetchLatest();
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Body Temperature',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,),maxLines:2,overflow:TextOverflow.ellipsis,),
            SizedBox(height: 5,),
            Text(latest.metric.temperature.toString(), style: TextStyle(fontSize: 22)),
            SizedBox(height: 10,),
            Text('% SpO2',style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold,),maxLines:2,overflow:TextOverflow.ellipsis,),
            SizedBox(height: 5,),
            Text(latest.metric.spo2.toString(), style: TextStyle(fontSize: 22)),
            SizedBox(height: 20,),
            Text(checkFever(),style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold,),maxLines:2,overflow:TextOverflow.ellipsis,),
            Text(
              'Hello',
              style:TextStyle(
                fontSize:30,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class DataTableWidget extends StatelessWidget {
  final List<Map<String, String>> listOfColumns = [
    {"Name": "AAAAAA", "Number": "1", "State": "Yes"},
    {"Name": "BBBBBB", "Number": "2", "State": "no"},
    {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  ];
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FittedBox(
          fit: BoxFit.fill,
          child: DataTable(
            columns: [
              DataColumn(label: Text('Patch')),
              DataColumn(label: Text('Version')),
              DataColumn(label: Text('Ready')),
            ],
            rows:
            listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
                .map(
              ((element) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(element["Name"])), //Extracting from Map element the value
                  DataCell(Text(element["Number"])),
                  DataCell(Text(element["State"])),
                ],
              )),
            )
                .toList(),
          ),
        ),
      ),
    );
  }
}
*/