
import 'package:aware/monitor/sensor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: Text('Login',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
        
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Padding(
            padding: const EdgeInsets.fromLTRB(25,0,25,0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
              validator: (String value){
                if(value.isEmpty){
                  return 'Enter phone number';
                }
                return null;
              },
              
              controller: mobileController,
            ),
          ),

          SizedBox(
            height: 10,
          ),

           RaisedButton(
            color: Colors.blueAccent,
            
            padding: const EdgeInsets.all(12),
            onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
               prefs.setString("mobile", mobileController.text);
              Navigator.push(context,MaterialPageRoute(builder: (context) => Sensor()));

            },
            child: Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
       ],
    ),
    ); 
  }
}