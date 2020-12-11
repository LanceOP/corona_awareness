import 'package:aware/models/data_model.dart';
import 'package:aware/monitor/analysis.dart';
import 'package:aware/motivation/mainScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
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
        .orderBy('date_time', descending: false)
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

      

    const cutOffYValue = 0.0;
    const yearTextStyle =
    TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold);
    int index = -1;
      return Scaffold(
        appBar: AppBar(
          title: Text('History',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          Row(children: [
            Expanded(child: Center(
              child: Text(
                'Readings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),),
          
            RaisedButton(
            color: Colors.blueAccent,
            
            padding: const EdgeInsets.all(12),
            onPressed: () async {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Analysis(dateModelList)));

            },
            child: Text(
              'Show Analysis',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          ],),
          
          DataTable(
            columns: [
              DataColumn(label: Text('Temperature'+ '(' + '\u2103' + ')')),
              DataColumn(label: Text('Spo2'+ '(%)')),
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

    //       SizedBox(
    //   // width: 100,
    //   // height: 180,
    //   child: LineChart(
    //     LineChartData(
    //       lineTouchData: LineTouchData(enabled: false),
    //       lineBarsData: [
    //         LineChartBarData(
    //           spots: dateModelList.map((e) {
    //             index = index+1;
    //             print(index);
    //             return FlSpot((index).toDouble(), double.parse(e.temp));
    //           }).toList(),
    //           isCurved: false,
    //           barWidth: 1,
    //           colors: [
    //             Colors.black,
    //           ],
    //           belowBarData: BarAreaData(
    //             show: true,
    //             colors: [Colors.lightGreen.withOpacity(0.4)],
    //             cutOffY: cutOffYValue,
    //             applyCutOffY: true,
    //           ),
    //           aboveBarData: BarAreaData(
    //             show: true,
    //             colors: [Colors.red.withOpacity(0.6)],
    //             cutOffY: cutOffYValue,
    //             applyCutOffY: true,
    //           ),
    //           dotData: FlDotData(
    //             show: false,
    //           ),
    //         ),
    //       ],
    //       minY: 0,
    //       titlesData: FlTitlesData(
    //         bottomTitles: SideTitles(
    //             showTitles: true,
    //             reservedSize: 5,
    //             // textStyle: yearTextStyle,
    //             getTitles: (value) {
    //               return dateModelList[value.toInt()].date.hour.toString() + ":" + dateModelList[value.toInt()].date.minute.toString();
    //             }),
    //         leftTitles: SideTitles(
    //           showTitles: true,
    //           reservedSize: 5,
    //           interval: 10,
    //           getTitles: (value) {
    //             print(value);
    //             return '${value }';
    //           },
    //         ),
    //       ),
    //       axisTitleData: FlAxisTitleData(
    //           leftTitle: AxisTitle(showTitle: true, titleText: 'Temperature'+ '(' + '\u2103' + ')', margin: 20),
    //           rightTitle: AxisTitle(showTitle: true, margin: 10),

    //           bottomTitle: AxisTitle(
    //               showTitle: true,
    //               margin: 10,
    //               titleText: 'Time(hh:mm)',
    //               textStyle: yearTextStyle,
    //               textAlign: TextAlign.center)),
    //       gridData: FlGridData(
    //         show: true,
    //         checkToShowHorizontalLine: (double value) {
    //           return value == 1 || value == 2 || value == 3 || value == 4;
    //         },
    //       ),
    //     ),
    //   ),
    // )
        ],
        ),
      );
  }
}
