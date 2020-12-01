import 'language_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';
import 'package:google_fonts/google_fonts.dart';
class Housewives extends StatefulWidget {
  Housewives({Key key}) : super(key: key);

  @override
  _HousewivesState createState() => _HousewivesState();
}

class _HousewivesState extends State<Housewives> {
  final translator = GoogleTranslator();
  bool _loading = false;
  String _currentSelectedValue = 'English';
  String translatedText1;
  String translatedText2;
  String translatedText3;
  String translatedText4;
  String translatedText5;
  String translatedTh1;

  @override
  void initState() {
    // TODO: implement initState
    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Housewives",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: ListView(
          children: [
             Container(
   height: MediaQuery.of(context).size.height*0.4,
                  child: InAppWebView(
                    initialUrl: LanguageCodes.ythousewife,
                    
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
                                LanguageCodes.housewifeText1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated2 = await translator.translate(
                                LanguageCodes.housewifeText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated3 = await translator.translate(
                                LanguageCodes.housewifeText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated4 = await translator.translate(
                                LanguageCodes.housewifeText4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated5 = await translator.translate(
                                LanguageCodes.housewifeh1,
                                to: LanguageCodes.launguage_codes[newValue]);


                            setState(() {
                              _currentSelectedValue = newValue;
                              translatedText1 = translated1.text;
                              translatedText2 = translated2.text;
                              translatedText3 = translated3.text;
                              translatedText4 = translated4.text;
                              translatedTh1 = translated5.text;
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
                    Text(translatedTh1 ?? "Please select the language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) 
                  ),

                  Padding(padding: EdgeInsets.all(20),
                  child : Text(translatedText1 ??""),
                  ),

                  Image.network('https://images.yourstory.com/cs/4/8e7cc4102d6c11e9aa979329348d4c3e/Homemaker-Corona-1585571681072.png'),

                  Padding(padding: EdgeInsets.all(20),
                  
                  child: Text(translatedText2 ?? ""),
                  ),
                  
                  Padding(padding: EdgeInsets.all(20),
                  child : Text(translatedText3 ??""),
                  ),

                  Image.network('https://images.yourstory.com/cs/4/8e7cc4102d6c11e9aa979329348d4c3e/WhatsAppImage2020-03-29at12-1585571851633.jpeg'),

                  Padding(padding: EdgeInsets.all(20),
                  child: Text(translatedText4 ??""),
                  ),

                  Padding(padding: EdgeInsets.all(20),
                  child: Text(translatedText5 ??""),
                  ), 

 
                  ],),
                  

                  ),
           
          ],
            )
          
        );
  }
}
