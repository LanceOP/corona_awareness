import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

import 'Retired.dart';
import 'college.dart';
import 'highschool.dart';
import 'housewives.dart';
import 'instructor.dart';
import 'job.dart';
import 'middleschool.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    // title: 'Flutter Demo',
    // theme: ThemeData(
    //   // This is the theme of your application.
    //   //
    //   // Try running your application with "flutter run". You'll see the
    //   // application has a blue toolbar. Then, without quitting the app, try
    //   // changing the primarySwatch below to Colors.green and then invoke
    //   // "hot reload" (press "r" in the console where you ran "flutter run",
    //   // or simply save your changes to "hot reload" in a Flutter IDE).
    //   // Notice that the counter didn't reset back to zero; the application
    //   // is not restarted.
    //   primarySwatch: Colors.blue,
    // ),
    // home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(), // mutiple page navigation
      '/first': (context) => MiddleSchool(),
      '/second': (context) => HighSchool(),
      '/third': (context) => College(),
      '/fourth': (context) => Instructor(),
      '/five': (context) => Job(),
      '/six': (context) => Housewives(),
      '/seven': (context) => Retired(),
    },

    );
  }
}


class HomeRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
          alignment: Alignment.center,
          child: ListView(
            
            children: <Widget>[
    SizedBox(height: 10,),        
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Middle School",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
                 Navigator.pushNamed(context, '/first');
    },
    ),

    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "High School",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
       Navigator.pushNamed(context, '/second');
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "College",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
       Navigator.pushNamed(context, '/third');
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Instructor",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.pushNamed(context, '/fourth');
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Job",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.pushNamed(context, '/five');
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Housewives",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.pushNamed(context, '/six');
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Retired",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
       Navigator.pushNamed(context, '/seven');
    },
    ),
          

      ],
          ),
      ),
    );
  }
} // home page