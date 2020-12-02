import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as u;
import 'telephone_nos.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpLine extends StatefulWidget {
  @override
  _HelpLineState createState() => _HelpLineState();
}

class _HelpLineState extends State<HelpLine> {

  TextStyle tStyle(double size){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      color: Colors.black,
    );
  }

  noList(){
    return Expanded(
      child:ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: stateNames.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              title: Text(
              stateNames[index],
              style: tStyle(20.0),
              ),
              subtitle: Text(
                number[index],
                style: tStyle(15.0),
              ),
              trailing: IconButton(
                icon: Icon(Icons.phone, size:20, color:Colors.blue,),
                onPressed: (){
                  callMethod(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  callMethod(i){
    String phoneNo='tel:'+number[i];
    u.launch(phoneNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Emergency',style:GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
      ),
      body:Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'HelpLine Numbers',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: 5,),
            noList(),
          ],
        ),
      ),
    );
  }
}
