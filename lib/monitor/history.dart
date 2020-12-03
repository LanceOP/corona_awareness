import 'package:aware/models/data_model.dart';
import 'package:aware/motivation/mainScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model.dart';
import 'constantsResultWindow.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  MetricStore store =  MetricStore();

 List<MetricRow> rows = List<MetricRow>();
  // String temp = '';
  // String spO2 = '';
  // String mobile = '';
  // DateTime date = DateTime.now();
  List<DataModel> dateModelList = [];
 final databaseReference = FirebaseDatabase.instance.reference();
 
  getRows() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobile_number = prefs.getString("mobile");
    
    FirebaseFirestore.instance
        .collection(mobile_number)
        .snapshots()
        .listen((data) {
      if (dateModelList != null) {
        dateModelList.clear();
      }
      data.docs.forEach((doc) async {
        if (this.mounted) {
          setState(() {
            dateModelList.add(DataModel(
                doc['body_temp'].toString(),
                doc['spO2'].toString(),
                DateTime.parse(doc['date_time'],)));
          });
        }
      });

  setState(() {
    dateModelList = dateModelList;
  });
  } );
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
          title: Text('History',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
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
            rows: dateModelList.map((e) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(e.temp.toString())), //Extracting from Map element the value
                  DataCell(Text(e.spO2.toString())),
                  DataCell(Text(e.date.day.toString() + "/" + e.date.month.toString() + "/" + e.date.year.toString() + " " + e.date.hour.toString() + ":" + e.date.minute.toString()))
                ],
              )).toList()
          ),
        ],
        ),
      );
  }
}
