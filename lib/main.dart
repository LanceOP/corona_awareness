import 'package:aware/covid_track/protective.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:aware/covid_track/box_display.dart';
import 'package:aware/covid_track/constants.dart';
import 'package:aware/covid_track/gesture_box.dart';
import 'package:aware/covid_track/helpline_page.dart';
import 'package:aware/covid_track/indicator.dart';
import 'package:aware/covid_track/loading_page.dart';
import 'package:aware/covid_track/network_helper.dart';
import 'package:aware/covid_track/state_screen.dart';
import 'package:aware/covid_track/symptoms_page.dart';
import 'package:aware/covid_track/prevention.dart';
import 'package:aware/ui/screens/health.dart';
import 'package:aware/ui/screens/news_page.dart';
import 'package:aware/motivation/mainScreen.dart';
import 'package:aware/monitor/sensor.dart';
import 'package:aware/content/contentScreen.dart';
import 'package:aware/ui/widgets/learn.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {


  runApp(MaterialApp(
    title: 'Corona Monitor',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/content':(context) => HomeRoute(),
      '/health':(context) => Health(),
      '/news':(context) => NewsScreen(),
      '/quote': (context) => Quotes(),
      '/sensor':(context) => Sensor(),
    },
  ));
}

class HomeScreen extends StatefulWidget {
  final statesData;
  final dailyStateData;
  HomeScreen({this.statesData, this.dailyStateData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0,
      touchedIndex;
  int tActive, tDeaths, tConfirmed, tRecovered;
  var stateWise, dailyStateWise;
  var districtWise;
  @override
  void initState() {
    super.initState();
      Firebase.initializeApp();
    stateWise = widget.statesData;
    dailyStateWise = widget.dailyStateData;
    tActive = int.parse(widget.statesData[0]['active']);
    tDeaths = int.parse(widget.statesData[0]['deaths']);
    tConfirmed = int.parse(widget.statesData[0]['confirmed']);
    tRecovered = int.parse(widget.statesData[0]['recovered']);
    getDistrictData();
  }
  void cardsCallBack(int index) {
    setState(() {
      current = index;
    });
  }

  void getDistrictData() async {
    NetworkHelper networkHelper = NetworkHelper(
        url: 'https://api.covid19india.org/v2/state_district_wise.json');
    districtWise = await networkHelper.getData();
  }

  findState(sState) {
    var temp;
    if (districtWise != null) {
      for (var i = 0; i < districtWise.length; i++) {
        if (sState == districtWise[i]['statecode']) {
          temp = districtWise[i]['districtData'];
        }
      }
    }
    return temp;
  }
  rowWidget(changes, data, color) {
    if (changes == '0') {
      return Text(
        '$data',
        style: rFont,
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.arrow_upward, size: 10, color: color,),
        Text(
          ' ($changes)',
          style: rFontColor(color),
        ),
        SizedBox(width: 4,),
        Text(
          '$data',
          style: rFont,
        ),
      ],
    );
  }
  list() {
    List<DataRow> rows = [];
    var sCode;
    for (var i = 1; i < stateWise.length; i++) {
      sCode = stateWise[i]['statecode'].toLowerCase();
      DataRow r = DataRow(cells: [
        DataCell(
          Text(
            '${stateWise[i]['state']}',
            style: rFont,
          ),
          onTap: () {
            //var confirm=int.parse(widget.statesData[i]['confirmed']);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return StateScreen(
                districtData: findState(stateWise[i]['statecode']),
                stateName: stateWise[i]['state'],
                active: stateWise[i]['active'],
                confirm: stateWise[i]['confirmed'],
                death: stateWise[i]['deaths'],
                recover: stateWise[i]['recovered'],
              );
            }));
          },
        ),
        DataCell(rowWidget(dailyStateWise[2][sCode], stateWise[i]['confirmed'],
            Colors.orange),),
        DataCell(Text(
          '${stateWise[i]['active']}',
          style: rFont,
        )),
        DataCell(rowWidget(
            dailyStateWise[0][sCode], stateWise[i]['deaths'], Colors.blue),),
        DataCell(rowWidget(dailyStateWise[1][sCode], stateWise[i]['recovered'],
            Colors.green),),
        DataCell(Text(
          '${stateWise[i]['lastupdatedtime']}',
          style: rFont,
        )),
      ]);
      rows.add(r);
    }
    return rows;
  }
  statesList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
              label: Text(
                'State',
                style: cTitle(Colors.black),
              )),
          DataColumn(
            label: Text(
              'Confirmed',
              style: cTitle(Colors.orange),
            ),
            numeric: true,
          ),
          DataColumn(
            label: Text(
              '  Active',
              style: cTitle(Colors.red),
            ),
            numeric: true,
          ),
          DataColumn(
            label: Text(
              'Deaths',
              style: cTitle(Colors.blue),
            ),
            numeric: true,
          ),
          DataColumn(
            label: Text(
              'Recovered',
              style: cTitle(Colors.green),
            ),
            numeric: true,
          ),
          DataColumn(
            label: Text(
              '  Updated time',
              style: cTitle(Colors.grey),
            ),
            numeric: true,
          ),
        ],
        rows: list(),
        columnSpacing: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corona Monitor',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
        centerTitle: true,
      //  backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 5.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureBox(
                    callBack: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Symptoms();
                      }));
                    },
                    title: 'COVID-19',
                    color: Colors.white,
                    text: 'Symptoms',
                    bgColor: Colors.redAccent,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureBox(
                    callBack: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Prevention();
                       // return VideoBox(videoId: "8c_UJwLq8PI",);
                      }));
                    },
                    title: 'COVID-19',
                    color: Colors.white,
                    text: 'Prevention',
                    bgColor: Colors.green,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureBox(
                    callBack: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HelpLine();
                      }));
                    },
                    title: 'HELPLINE',
                    color: Colors.white,
                    text: 'Numbers',
                    bgColor: Colors.orange,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  GestureBox(
                    callBack: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Protective();
                      }));
                    },
                    title: 'PROTECTIVE',
                    color: Colors.white,
                    text: 'Measures',
                    bgColor: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  GestureBox(
                    callBack: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Learn();
                      }));
                    },
                    title: 'COVID-19',
                    color: Colors.white,
                    text: 'Myths',
                    bgColor: Colors.deepPurple,
                  ),

                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'COVID-19 INDIA',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                        maxLines:2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Center(
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback: (pieTouchResponse) {
                            },
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 30,
                          startDegreeOffset: 180,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Indicator(
                              color: Colors.red,
                              text: 'Active ',
                              isSquare: false,
                              size: touchedIndex == 1 ? 15 : 12,
                            ),
                            Indicator(
                              color: Colors.blue,
                              text: 'Deaths ',
                              isSquare: false,
                              size: touchedIndex == 1 ? 15 : 12,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Indicator(
                              color: Colors.green,
                              text: 'Recovered',
                              isSquare: false,
                              size: touchedIndex == 1 ? 15 : 12,
                            ),
                            Indicator(
                              color: Colors.orange,
                              text: 'Confirmed',
                              isSquare: false,
                              size: touchedIndex == 1 ? 15 : 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            topCard(),
            SizedBox(
              height: 5.0,
            ),
            Text(
              '  State wise Cases',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 3.0,
            ),
            statesList(),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.blue[800],
                  Colors.lightBlueAccent,
                ])
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      elevation: 10,
                      child: Padding(padding: EdgeInsets.all(8),
                      child: Image.asset('assets/images/app_icon.png',width: 80,height:80,),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Awareness and Monitor',style:TextStyle(color:Colors.white,fontSize:18),),
                    ),
                  ],
                ),
              ),

            ),
            CustomListTile(Icons.article_outlined,'Content',()=>{
              Navigator.popAndPushNamed(context,'/content')
            }),
            CustomListTile(Icons.format_quote,'Inspiring quotes',()=>{
              Navigator.popAndPushNamed(context,'/quote')
            }),
            CustomListTile(Icons.coronavirus,'News',()=>{
              Navigator.pushNamed(context,'/news')
            }),
            CustomListTile(Icons.medical_services,'Health assessment',()=>{
              Navigator.pushNamed(context,'/health')
            }),
            CustomListTile(Icons.monitor,'Monitor',()=>{
              Navigator.popAndPushNamed(context,'/sensor')
            }),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20 : 12;
      final double radius = isTouched ? 80 : 70;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: tActive.toDouble(),
            title: '$tActive',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.orange,
            value: tConfirmed.toDouble(),
            title: '$tConfirmed',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blue,
            value: tDeaths.toDouble(),
            title: '$tDeaths',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: Colors.green,
            value: tRecovered.toDouble(),
            title: '$tRecovered',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        default:
          return null;
      }
    });
  }

  topCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              '                   Total Count',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Balsamiq Sans',
              ),
              textAlign: TextAlign.start,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BoxDisplay(
                        color: Colors.red,
                        title: 'Active',
                        text: widget.statesData[0]['active']),
                    BoxDisplay(
                        color: Colors.orange,
                        title: 'Confirmed',
                        text: widget.statesData[0]['confirmed']),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BoxDisplay(
                        color: Colors.blue,
                        title: 'Deaths',
                        text: widget.statesData[0]['deaths']),
                    BoxDisplay(
                        color: Colors.green,
                        title: 'Recovered',
                        text: widget.statesData[0]['recovered']),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }




}

class CustomListTile extends StatefulWidget{
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon,this.text,this.onTap);

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context){
    //TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8,0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
        child: InkWell(
          splashColor: Colors.lightBlueAccent,
          onTap: widget.onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(widget.icon),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(widget.text,style: TextStyle(
                        fontSize: 16,
                      ),),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Launch screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

