import 'language_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';
import 'package:google_fonts/google_fonts.dart';
class School extends StatefulWidget {
  School({Key key}) : super(key: key);

  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
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
  String translatedTh1;
  String translatedTh2;
  String translatedTh3;
  String translatedTh4;
  String translatedTh5;
  String translatedTh6;
  String translatedTh7;
  String translatedTh8;
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
          title: Text('School Page',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: ListView(
          children: [
             Container(
   height: MediaQuery.of(context).size.height*0.4,
                  child: InAppWebView(
                    initialUrl: LanguageCodes.ytmidschool,
                    
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
                                LanguageCodes.middleSchoolText1,
                                
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated2 = await translator.translate(
                                LanguageCodes.middleSchoolText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated3 = await translator.translate(
                                LanguageCodes.middleSchoolText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated4 = await translator.translate(
                                LanguageCodes.middleSchoolText4,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated5 = await translator.translate(
                                LanguageCodes.middleSchoolText5,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated6 = await translator.translate(
                                LanguageCodes.middleSchoolText6,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated7 = await translator.translate(
                                LanguageCodes.middleSchoolText7,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated8 = await translator.translate(
                                LanguageCodes.middleSchoolText8,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated9 = await translator.translate(
                                LanguageCodes.middleSchoolText9,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated10 = await translator.translate(
                                LanguageCodes.middleSchoolText10,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated11 = await translator.translate(
                                LanguageCodes.middleSchoolText12,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translated12 = await translator.translate(
                                LanguageCodes.middleSchoolText12,
                                to: LanguageCodes.launguage_codes[newValue]);    

                            Translation translatedh1 = await translator.translate(
                                LanguageCodes.middleSchoolh1,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translatedh2 = await translator.translate(
                                LanguageCodes.middleSchoolh2,
                                to: LanguageCodes.launguage_codes[newValue]);  

                            Translation translatedh3 = await translator.translate(
                                LanguageCodes.middleSchoolh3,
                                to: LanguageCodes.launguage_codes[newValue]);  

                            Translation translatedh4 = await translator.translate(
                                LanguageCodes.middleSchoolh4,
                                to: LanguageCodes.launguage_codes[newValue]);  

                            Translation translatedh5 = await translator.translate(
                                LanguageCodes.middleSchoolh5,
                                to: LanguageCodes.launguage_codes[newValue]);  

                            Translation translatedh6 = await translator.translate(
                                LanguageCodes.middleSchoolh6,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translatedh7 = await translator.translate(
                                LanguageCodes.middleSchoolh7,
                                to: LanguageCodes.launguage_codes[newValue]);  

                            Translation translatedh8 = await translator.translate(
                                LanguageCodes.middleSchoolh8,
                                to: LanguageCodes.launguage_codes[newValue]);

                            Translation translateddc = await translator.translate(
                                LanguageCodes.middleSchooldc,
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
                              translatedText8 = translated8.text;
                              translatedText9 = translated9.text;
                              translatedText10 = translated10.text;
                              translatedText11 = translated11.text;
                              translatedText12 = translated12.text;
                              translatedTh1 = translatedh1.text;
                              translatedTh2 = translatedh2.text;
                              translatedTh3 = translatedh3.text;
                              translatedTh4 = translatedh4.text;
                              translatedTh5 = translatedh5.text;
                              translatedTh6 = translatedh6.text;
                              translatedTh7 = translatedh7.text;
                              translatedTh8 = translatedh8.text;
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
              child : _loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(children: <Widget>[

                    Text(translatedTh1 ?? "Please select language", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

                    Image.network("https://i0.wp.com/marketscale.com/industries/wp-content/uploads/2020/07/Online-Remote-Learning-768x513-1.jpg"),

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
              child : Text(translatedTh2 ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText3 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText4 ?? "", style: TextStyle(fontSize: 18)),
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
              child : Text(translatedTh3 ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText7 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child : Text(translatedTh4 ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText8 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child : Text(translatedTh5 ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText9 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child : Text(translatedTh6 ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText10 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child : Text(translatedTh7 ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText11 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child : Text(translatedTh8 ?? "", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText12 ?? "", style: TextStyle(fontSize: 18)),
            ),


                  ],) 
                  
                  
            ),
  
          ],
        ));
  }
}
