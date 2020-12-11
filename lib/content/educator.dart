import 'language_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';
import 'package:google_fonts/google_fonts.dart';
class Instructor extends StatefulWidget {
  Instructor({Key key}) : super(key: key);

  @override
  _InstructorState createState() => _InstructorState();
}

class _InstructorState extends State<Instructor> {
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

  
  String translatedTh1;
  String translatedTh2;
  String translatedTh3;
  String translatedTh4;
  String translatedTh5;
  String translatedTh6;
  String translatedTh7;
  String translatedTh8;
  String translatedTh9;
  String translatedTh10;
  String translatedTh11;
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
          title: Text('Educators Page',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: ListView(
          children: [
             Container(
   height: MediaQuery.of(context).size.height*0.4,
                  child: InAppWebView(
                    initialUrl: LanguageCodes.ytinsturctor,
                    
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
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                                LanguageCodes.instructorText1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated2 = await translator.translate(
                                LanguageCodes.instructorText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated3 = await translator.translate(
                                LanguageCodes.instructorText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated4 = await translator.translate(
                                LanguageCodes.instructorText4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated5 = await translator.translate(
                                LanguageCodes.instructorText5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated6 = await translator.translate(
                                LanguageCodes.instructorText6,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated7 = await translator.translate(
                                LanguageCodes.instructorText7,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated8 = await translator.translate(
                                LanguageCodes.instructorText8,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated9 = await translator.translate(
                                LanguageCodes.instructorText9,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated10 = await translator.translate(
                                LanguageCodes.instructorText10,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated11 = await translator.translate(
                                LanguageCodes.instructorText11,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated12 = await translator.translate(
                                LanguageCodes.instructorText12,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated13 = await translator.translate(
                                LanguageCodes.instructorText13,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated14 = await translator.translate(
                                LanguageCodes.instructorh1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated15 = await translator.translate(
                                LanguageCodes.instructorh2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated16 = await translator.translate(
                                LanguageCodes.instructorh3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated17 = await translator.translate(
                                LanguageCodes.instructorh4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated18 = await translator.translate(
                                LanguageCodes.instructorh5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated19 = await translator.translate(
                                LanguageCodes.instructorh6,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated20 = await translator.translate(
                                LanguageCodes.instructorh7,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated21 = await translator.translate(
                                LanguageCodes.instructorh8,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated22 = await translator.translate(
                                LanguageCodes.instructorh9,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated23 = await translator.translate(
                                LanguageCodes.instructorh10,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated24 = await translator.translate(
                                LanguageCodes.instructorh11,
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
                              translatedText13 = translated13.text;

                              translatedTh1 = translated14.text;
                              translatedTh2 = translated15.text;
                              translatedTh3 = translated16.text;
                              translatedTh4 = translated17.text;
                              translatedTh5 = translated18.text;
                              translatedTh6 = translated19.text;
                              translatedTh7 = translated20.text;
                              translatedTh8 = translated21.text;
                              translatedTh9 = translated22.text;
                              translatedTh10 = translated23.text;
                              translatedTh11 = translated24.text;
                          
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
              child : _loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(children: <Widget>[

                    Text(translatedTh1 ?? "Please Select Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),

                    Image.network('https://i1.wp.com/aul.org/wp-content/uploads/2018/06/you-are-not-alone-1-e1528469033172.png'),

                    Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh2 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText1 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh3 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText2 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh4 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText3 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh5 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText4 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh6 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText5 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh7 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText6 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText7 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh8 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText8 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText9 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh9 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText10 ??"", style: TextStyle(fontSize: 18)),
                  ),


                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh10 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  
                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText11 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText12 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedTh11 ??"", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText13 ??"", style: TextStyle(fontSize: 18)),
                  ),
                
                  ],)
                  
                    
                  ),
          ],
            ),  
          
        );
  }
}
