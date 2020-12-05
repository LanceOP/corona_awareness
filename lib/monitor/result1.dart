import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constantsResultWindow.dart';

class Result1 extends StatefulWidget {
  MetricStore store;
  Metric metric;
  Result1({this.store, this.metric});

  @override
  _Result1State createState() => _Result1State();
}

class _Result1State extends State<Result1> {

  List output = [];
  double temp = 0.0;
  double spo2 = 0.0;

  Future<List> checkFever() async {

      temp = widget.metric.temperature;
      spo2 = widget.metric.spo2;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String mobile_number = prefs.getString("mobile");


      if((temp>=35 && temp<=38) && (spo2>=90 && spo2<=100)){
        this.widget.metric.mobile = mobile_number;
        this.widget.store.store(this.widget.metric, DateTime.now().millisecondsSinceEpoch);
        setState(() {
          temp = temp;
          spo2 = spo2;
          output =  ['You don\'t have risk of Covid-19 infection', Colors.green];
        });
      }else if((temp>38 || temp<35) && (spo2<90 || spo2>100))
      {
        setState(() {
          temp = temp;
          spo2 = spo2;
          output =   ['Enter correct range of values', Colors.yellow];
        });
      }
      else{
        this.widget.metric.mobile = mobile_number;
        this.widget.store.store(this.widget.metric, DateTime.now().millisecondsSinceEpoch);
         setState(() {
                     temp = temp;
          spo2 = spo2;
          output = ['You have risk of Covid-19 infection.', Colors.red];
        });
     
      }
    
    // return ["No data found\n", Colors.black];
  }

  @override
  void initState() {
    checkFever();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    MetricRow latest = this.widget.store.fetchLatest();
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Body Temperature =>',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold,),maxLines:2,overflow:TextOverflow.ellipsis,),
            SizedBox(height: 5,),
            Text(temp.toString()+ " \u2103", style: TextStyle(fontSize: 22)),
            SizedBox(height: 10,),
Divider(),
            Text('SpO2 =>',style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold,),maxLines:2,overflow:TextOverflow.ellipsis,),
            SizedBox(height: 5,),
            Text(spo2.toString() + "%", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20,),
            Divider(),

            output.length < 2 ? Container():
            Text(
              output[0],
              style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold, color: output[1]),maxLines:2, textAlign: TextAlign.center,overflow:TextOverflow.ellipsis,),
              
            
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