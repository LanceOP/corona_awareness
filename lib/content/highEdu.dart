
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';
import 'language_codes.dart';
import 'package:google_fonts/google_fonts.dart';
class HighEdu extends StatefulWidget {
  HighEdu({Key key}) : super(key: key);

  @override
  _HighEduState createState() => _HighEduState();
}

class _HighEduState extends State<HighEdu> {
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
  String translatedText8;
  String translatedText9;
  String translatedText10;
  String translatedText11;
  String translatedText12;
  String translatedText13;
  String translatedText14;
  String translatedText15;

  String translatedTh1;
  String translatedTh2;
  String translatedTh3;
  String translatedTh4;
  String translatedTh5;
  String translatedDc;

  @override
  void initState() {
    // TODO: implement initState
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Higher Education Page',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
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
                            style: TextStyle(fontSize: 16),
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
                                LanguageCodes.hightSchoolText6,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated11 = await translator.translate(
                                LanguageCodes.hightSchoolText7,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated12 = await translator.translate(
                                LanguageCodes.hightSchoolText8,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated13 = await translator.translate(
                                LanguageCodes.hightSchoolText9,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated14 = await translator.translate(
                                LanguageCodes.hightSchoolText10,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated15 = await translator.translate(
                                LanguageCodes.hightSchoolText11,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated16 = await translator.translate(
                                LanguageCodes.hightSchoolText12,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated17 = await translator.translate(
                                LanguageCodes.hightSchoolText13,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated18 = await translator.translate(
                                LanguageCodes.hightSchoolText14,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated19 = await translator.translate(
                                LanguageCodes.hightSchoolText15,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translateddc = await translator.translate(
                                LanguageCodes.highSchooldc,
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
                              translatedText6 = translated10.text;
                              translatedText7 = translated11.text;
                              translatedText8 = translated12.text;
                              translatedText9 = translated13.text;
                              translatedText10 = translated14.text;
                              translatedText11 = translated15.text;
                              translatedText12 = translated16.text;
                              translatedText13 = translated17.text;
                              translatedText14 = translated18.text;
                              translatedText15 = translated19.text;

                              translatedDc = translateddc.text;
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
              padding: EdgeInsets.all(10),
              child: Text(translatedDc ?? "", style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey,)),
            ), 


            Padding(
              padding: EdgeInsets.all(10),
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(children: <Widget>[
                    Text(translatedTh1 ?? "Please Select Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),  
                  ),

                  Image.network("https://www.indiaeducation.net/imagesvr_ce/4134/slide_5462f7d765225.jpg"),

                  Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText1 ?? "", style: TextStyle(fontSize: 18)),
            ), 
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText2 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh2 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText3 ?? "", style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh3 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText4 ?? "", style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh4 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText5 ?? "", style: TextStyle(fontSize: 18)),
            ),
            
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText6 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText7 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText8 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText9 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText10 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText11 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText12 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText13 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText14 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText15 ?? "", style: TextStyle(fontSize: 18)),
            ),




                  ],),
            )
          ],
        ));
  }
}
