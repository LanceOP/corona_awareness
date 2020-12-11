import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'senior.dart';
import 'college.dart';
import 'highEdu.dart';
import 'housewives.dart';
import 'educator.dart';
import 'employee.dart';
import 'school.dart';

class Content extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
    debugShowCheckedModeBanner: false,
      routes: {
      '/': (context) => HomeRoute(), // mutiple page navigation
      '/first': (context) => School(),
      '/second': (context) => College(),
      '/third': (context) => HighEdu(),
      '/fourth': (context) => Instructor(),
      '/five': (context) => Employee(),
      '/six': (context) => Housewives(),
      '/seven': (context) => Senior(),
    },

    );
  }
}


class HomeRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,45,0,0),
        child: Container(
            alignment: Alignment.center,
            child: ListView(

              children: <Widget>[
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "School Students",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => School()));
        }, background: null,
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "College Students",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => College()));
    }, background: null,
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Higher Education",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HighEdu()));
    }, background: null,
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Educators",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Instructor()));
        }, background: null,
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Employees",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Employee()));
     }, background: null,
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Housewives",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Housewives()));
    }, background: null,
    ),
    SizedBox(height: 10,),
    NiceButton(
    radius: 40,
    padding: const EdgeInsets.all(15),
    text: "Senior Citizens",
    gradientColors: [Color(0xff5b86e5), Color(0xff36d1dc)],
    onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Senior()));
         }, background: null,
    ),
              ],
            ),
        ),
      ),
    );
  }
} // home page