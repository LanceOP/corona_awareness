import 'language_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';
import 'package:google_fonts/google_fonts.dart';

class Job extends StatefulWidget {
  Job({Key key}) : super(key: key);

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  final translator = GoogleTranslator();
  bool _loading = false;
  String _currentSelectedValue = 'English';
  String translatedText1;
  String translatedText2;
  String translatedText3;
  String translatedText4;
  String translatedTh1;
  String translatedTh2;
  String translatedTh3;
  String translatedTh4;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Employee/Job Seeker",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: ListView(
          children: [
             Container(
   height: MediaQuery.of(context).size.height*0.4,
                  child: InAppWebView(
                    initialUrl: LanguageCodes.ytjob,
                    
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
                                LanguageCodes.jobh1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated2 = await translator.translate(
                                LanguageCodes.jobText1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated3 = await translator.translate(
                                LanguageCodes.jobh2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated4 = await translator.translate(
                                LanguageCodes.jobText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated5 = await translator.translate(
                                LanguageCodes.jobh3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated6 = await translator.translate(
                                LanguageCodes.jobText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated7 = await translator.translate(
                                LanguageCodes.jobh4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated8 = await translator.translate(
                                LanguageCodes.jobText4,
                                to: LanguageCodes.launguage_codes[newValue]);

                            setState(() {
                              _currentSelectedValue = newValue;
                              translatedTh1 = translated1.text;
                              translatedText1 = translated2.text;
                              translatedTh2 = translated3.text;
                              translatedText2 = translated4.text;
                              translatedTh3 = translated5.text;
                              translatedText3 = translated6.text;
                              translatedTh4 = translated7.text;
                              translatedText4 = translated8.text;
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
                    Text(translatedTh1 ?? "Please select the language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) 
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText1 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Image.network('https://www.adzuna.co.uk/wp-content/uploads/2020/03/do-not-give-up.jpg'),

                  Padding(padding: EdgeInsets.all(10),
                  
                  child: Text(translatedTh2 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  
                  Padding(padding: EdgeInsets.all(10),
                  child : Text(translatedText2 ??"", style: TextStyle(fontSize: 18)),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child: Text(translatedTh3 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),  ),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child: Text(translatedText3 ??"", style: TextStyle(fontSize: 18))
                  ),
                   
                  Padding(padding: EdgeInsets.all(10),
                  child: Text(translatedTh4 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), ),
                  ),

                  Padding(padding: EdgeInsets.all(10),
                  child: Text(translatedText4 ??"", style: TextStyle(fontSize: 18)),
                  ), 

 
                  ],),
                  

                  ),
           
          ],
        ));
  }
}
