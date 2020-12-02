import 'package:flutter/material.dart';

class Data extends StatelessWidget {
  String text;
  Data(this.text);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //  gradient: new LinearGradient(
        //    colors: [
        //      Colors.purple[200].withOpacity(0.5),
        //      Colors.cyan.withOpacity(1.0)
        //    ],
        //  ),
        // ),
        alignment: Alignment.center,
        margin: EdgeInsets.all(60),
        padding: EdgeInsets.all(10),
        width: 300,
        height: 400,
        child: Text(
          text,
          style: TextStyle(fontSize: 29, color: Colors.white,fontWeight:FontWeight.bold),
        ),
      ),
    );
  }
}
