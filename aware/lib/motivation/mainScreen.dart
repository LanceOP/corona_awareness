import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './textdisplay.dart';


class Quotes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title: Text('Quotes',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
        ),
        body: TextDisplay(),
      ),
    );
  }
}
