import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:google_fonts/google_fonts.dart';
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
    debugShowCheckedModeBanner: false,
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
        title: Text('Content',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => MiddleSchool()));
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => HighSchool()));
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => Job()));
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => Retired()));
         }, background: null,
    ),
              ],
            ),
        ),
      ),
    );
  }
} // home page