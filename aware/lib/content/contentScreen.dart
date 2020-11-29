import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';

import 'Retired.dart';
import 'college.dart';
import 'highschool.dart';
import 'housewives.dart';
import 'instructor.dart';
import 'job.dart';
import 'middleschool.dart';


class Content extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => MiddleSchool()));
      },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "High School",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HighSchool()));
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "College",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => College()));
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Instructor",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Instructor()));
      },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Job",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Job()));
     }
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Housewives",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Housewives()));
    },
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Retired",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Retired()));
       },
    ),
            ],
          ),
      ),
    );
  }
} // home page