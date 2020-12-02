import 'package:aware/motivation/mainScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';
import 'constantsResultWindow.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  MetricStore store =  MetricStore();

 List<MetricRow> rows = List<MetricRow>();
  String temp = '';
  String spO2 = '';
  String mobile = '';
  DateTime date = DateTime.now();
 final databaseReference = FirebaseDatabase.instance.reference();
 
  getRows() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobile_number = prefs.getString("mobile");
    await databaseReference.child(mobile_number).child('body_temp').once().then((DataSnapshot snapshot) {
          
    temp = snapshot.value.toString();
    
  });

    await  databaseReference.child(mobile_number).child('spO2').once().then((DataSnapshot snapshot) {
          
    spO2 = snapshot.value.toString();
    
  });

  await  databaseReference.child(mobile_number).child('date_time').once().then((DataSnapshot snapshot) {
          
    date = DateTime.parse(snapshot.value.toString());
    
  });

  setState(() {
    mobile = mobile_number;
    temp = temp;
    spO2 = spO2;
  });
  } 
 @override
  void initState() {
    // TODO: implement initState
    getRows();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

      

  //  MetricRow latest = this.store.fetchLatest();
  //   final List<Map<String, String>> listOfColumns = [
  //     {"Name": "AAAAAA", "Number": "1", "State": "Yes"},
  //     {"Name": "BBBBBB", "Number": "2", "State": "no"},
  //     {"Name": "CCCCCC", "Number": "3", "State": "Yes"}
  //   ];
//  DataTableWidget(this.listOfColumns);     // Getting the data from outside, on initialization
      return Scaffold(
        appBar: AppBar(
          title: Text('History'),
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          Center(
              child: Text(
                'Readings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          DataTable(
            columns: [
              DataColumn(label: Text('Temperature')),
              DataColumn(label: Text('Spo2')),
              DataColumn(label: Text('Date')),
            ],
            rows: [DataRow(
                cells: <DataCell>[
                  DataCell(Text(temp.toString())), //Extracting from Map element the value
                  DataCell(Text(spO2.toString())),
                  DataCell(Text(date.day.toString() + "/" + date.month.toString() + "/" + date.year.toString() + " " + date.hour.toString() + ":" + date.minute.toString()))
                ],
              )]
          ),
        ],
        ),
      );
  }
}
