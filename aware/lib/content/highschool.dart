
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';
import 'language_codes.dart';

class HighSchool extends StatefulWidget {
  HighSchool({Key key}) : super(key: key);

  @override
  _HighSchoolState createState() => _HighSchoolState();
}

class _HighSchoolState extends State<HighSchool> {
  final translator = GoogleTranslator();
  bool _loading = false;
  String _currentSelectedValue = 'English';
  String translatedText1;
  String translatedText2;
  String translatedText3;
  String translatedText4;
  String translatedText5;
  String translatedText6;
  String translatedTh1;
  String translatedTh2;
  String translatedTh3;
  String translatedTh4;
  String translatedTh5;

  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("High School Page"),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: [
             Container(
   height: MediaQuery.of(context).size.height*0.4,
                  child: InAppWebView(
                    initialUrl: LanguageCodes.ythighschool,
                    
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
                                LanguageCodes.highSchoolh1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated2 = await translator.translate(
                                LanguageCodes.highSchoolText1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated3 = await translator.translate(
                                LanguageCodes.highSchoolText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated4 = await translator.translate(
                                LanguageCodes.highSchoolh2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated5 = await translator.translate(
                                LanguageCodes.highSchoolText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated6 = await translator.translate(
                                LanguageCodes.highSchoolh3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated7 = await translator.translate(
                                LanguageCodes.hightSchoolText4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated8 = await translator.translate(
                                LanguageCodes.highSchoolh4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated9 = await translator.translate(
                                LanguageCodes.hightSchoolText5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated10 = await translator.translate(
                                LanguageCodes.highSchoolh5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated11 = await translator.translate(
                                LanguageCodes.hightSchoolText6,
                                to: LanguageCodes.launguage_codes[newValue]);

                            setState(() {
                              _currentSelectedValue = newValue;
                              translatedTh1 = translated1.text;
                              translatedText1 = translated2.text;
                              translatedText2 = translated3.text;
                              translatedTh2 = translated4.text;
                              translatedText3 = translated5.text;
                              translatedTh3 = translated6.text;
                              translatedText4 = translated7.text;
                              translatedTh4 = translated8.text;
                              translatedText5 = translated9.text;
                              translatedTh5 = translated10.text;
                              translatedText6 = translated11.text;
                              _loading = false;
                            });
                          },
                          items: <String>[
                            'English',
                            'Hindi',
                            'Marathi',
                            'Punjabi','Telugu','Tamil'
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
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(children: <Widget>[
                    Text(translatedTh1 ?? "Please Select Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),  
                  ),

                  Image.network("https://static.india.com/wp-content/uploads/2020/08/school-1.jpg"),

                  Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText1 ?? ""),
            ), 
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText2 ?? ""),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh2 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText3 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh3 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText4 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh4 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText5 ?? ""),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedTh5 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(translatedText6 ?? ""),
            ),


                  ],),
            )
          ],
        ));
  }
}
