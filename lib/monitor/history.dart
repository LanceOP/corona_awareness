import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';
import 'constantsResultWindow.dart';

class History extends StatelessWidget {
  MetricStore store =  MetricStore();
//  History({this.store});
  @override
  Widget build(BuildContext context) {

    List<MetricRow> rows  = store.fetch(0);
    if(rows == null){
      rows = List<MetricRow>();
    }

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
            rows:
            rows // Loops through dataColumnText, each iteration assigning the value to element
                .map(
              ((element) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(element.metric.temperature.toString())), //Extracting from Map element the value
                  DataCell(Text(element.metric.spo2.toString())),
                  DataCell(Text(element.getFormattedDate())),
                ],
              )),
            )
                .toList(),
            // listOfColumns // Loops through dataColumnText, each iteration assigning the value to element
            //     .map(
            //   ((element) => DataRow(
            //     cells: <DataCell>[
            //       DataCell(Text(element["Name"])), //Extracting from Map element the value
            //       DataCell(Text(element["Number"])),
            //       DataCell(Text(element["State"])),
            //     ],
            //   )),
            // )
            //     .toList(),
          ),
        ],
        ),
      );
  }
}
