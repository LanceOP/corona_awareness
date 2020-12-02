import 'language_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';

class College extends StatefulWidget {
  College({Key key}) : super(key: key);

  @override
  _CollegeState createState() => _CollegeState();
}

class _CollegeState extends State<College> {
  final translator = GoogleTranslator();
  bool _loading = false;
  String _currentSelectedValue = 'English';
  String translatedText1;
  String translatedText2;
  String translatedText3;
  String translatedText4;
  String translatedText5;
  String translatedText6;
  String translatedText7;
  String translatedTh1;
  String translatedTh2;
  
  

  @override
  void initState() {
    // TODO: implement initState
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("College Page"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: [
             Container(
   height: MediaQuery.of(context).size.height*0.4,
                  child: InAppWebView(
                    initialUrl: LanguageCodes.ytcollege,
                    
                    onLoadStart: (InAppWebViewController controller, String url) {

                    },
                    onLoadStop: (InAppWebViewController controller, String url) {

                    },
                  ),
                ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Center(
                    child: Text(
                      "Motivation",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text(
                            "English",
                            style: TextStyle(fontSize: 18),
                          ),
                          iconDisabledColor: Colors.transparent,
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) async {
                            setState(() {
                              _loading = true;
                            });
                                Translation translated1 = await translator.translate(
                                LanguageCodes.collegeText1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated2 = await translator.translate(
                                LanguageCodes.collegeText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated3 = await translator.translate(
                                LanguageCodes.collegeText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated4 = await translator.translate(
                                LanguageCodes.collegeText4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated5 = await translator.translate(
                                LanguageCodes.collegeText5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated6 = await translator.translate(
                                LanguageCodes.collegeText6,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated7 = await translator.translate(
                                LanguageCodes.collegeText7,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh1 = await translator.translate(
                                LanguageCodes.collegeh1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh2 = await translator.translate(
                                LanguageCodes.collegeh2,
                                to: LanguageCodes.launguage_codes[newValue]);

                            setState(() {
                              _currentSelectedValue = newValue;
                              translatedText1 = translated1.text;
                              translatedText2 = translated2.text;
                              translatedText3 = translated3.text;
                              translatedText4 = translated4.text;
                              translatedText5 = translated5.text;
                              translatedText6 = translated6.text;
                              translatedText7 = translated7.text;
                              translatedTh1 = translatedh1.text;
                              translatedTh2 = translatedh2.text;
                              _loading = false;
                            });
                          },
                          items: <String>[
                            'English',
                            'Hindi',
                            'Marathi',
                            'Punjabi','Telugu','Tamil',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(

              padding: EdgeInsets.all(20),
              child : _loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(children: <Widget>[

                    Text(translatedTh1 ?? "Please Select Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),  
                  ),

                  Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText1 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Image.network('https://cdn.thewire.in/wp-content/uploads/2020/03/23184336/coronavirus-lockdown-1600x982.jpg'),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText2 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh2 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText3 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText4 ?? "", style: TextStyle(fontSize: 18)),
            ),

                  ],) 
                  
                  
                  
            ),
           
            
          ],
        ));
  }
}
