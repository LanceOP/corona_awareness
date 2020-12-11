import 'language_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:translator/translator.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String translatedText31;
  String translatedText32;
  String translatedText4;
  String translatedText5;
  String translatedText6;
  String translatedText7;
  String translatedText8;
  String translatedText9;
  String translatedText10;
  
  
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
          title: Text('College Page',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
          centerTitle: true,
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
                                LanguageCodes.collegeText1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated2 = await translator.translate(
                                LanguageCodes.collegeText2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated3 = await translator.translate(
                                LanguageCodes.collegeText3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated31 = await translator.translate(
                                LanguageCodes.collegeText31,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated32 = await translator.translate(
                                LanguageCodes.collegeText32,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated4 = await translator.translate(
                                LanguageCodes.collegeText41,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated5 = await translator.translate(
                                LanguageCodes.collegeText51,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated6 = await translator.translate(
                                LanguageCodes.collegeText61,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated7 = await translator.translate(
                                LanguageCodes.collegeText71,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated8 = await translator.translate(
                                LanguageCodes.collegeText81,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated9 = await translator.translate(
                                LanguageCodes.collegeText91,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translated10 = await translator.translate(
                                LanguageCodes.collegeText101,
                                to: LanguageCodes.launguage_codes[newValue]);

                                
                                Translation translatedh1 = await translator.translate(
                                LanguageCodes.collegeh1,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh2 = await translator.translate(
                                LanguageCodes.collegeh2,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh3 = await translator.translate(
                                LanguageCodes.collegeh3,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh4 = await translator.translate(
                                LanguageCodes.collegeh4,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh5 = await translator.translate(
                                LanguageCodes.collegeh5,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh6 = await translator.translate(
                                LanguageCodes.collegeh6,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh7 = await translator.translate(
                                LanguageCodes.collegeh7,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh8 = await translator.translate(
                                LanguageCodes.collegeh8,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh9 = await translator.translate(
                                LanguageCodes.collegeh9,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translatedh10 = await translator.translate(
                                LanguageCodes.collegeh10,
                                to: LanguageCodes.launguage_codes[newValue]);

                                Translation translateddc = await translator.translate(
                                LanguageCodes.collegedc,
                                to: LanguageCodes.launguage_codes[newValue]);

                            setState(() {
                              _currentSelectedValue = newValue;
                              translatedText1 = translated1.text;
                              translatedText2 = translated2.text;
                              translatedText3 = translated3.text;
                              translatedText31 = translated31.text;
                              translatedText32 = translated32.text;
                              translatedText4 = translated4.text;
                              translatedText5 = translated5.text;
                              translatedText6 = translated6.text;
                              translatedText7 = translated7.text;
                              translatedText8 = translated8.text;
                              translatedText9 = translated9.text;
                              translatedText10 = translated10.text;
                              

                              translatedTh1 = translatedh1.text;
                              translatedTh2 = translatedh2.text;
                              translatedTh3 = translatedh3.text;
                              translatedTh4 = translatedh4.text;
                              translatedTh5 = translatedh5.text;
                              translatedTh6 = translatedh6.text;
                              translatedTh7 = translatedh7.text;
                              translatedTh8 = translatedh8.text;
                              translatedTh9 = translatedh9.text;
                              translatedTh10 = translatedh10.text;

                              translatedDc = translateddc.text;
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
              padding: EdgeInsets.all(10),
              child: Text(translatedDc ?? "", style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: Colors.grey,)),
            ), 


            Padding(

              padding: EdgeInsets.all(10),
              child : _loading
                  ? Center(child: CircularProgressIndicator())
                  : Column(children: <Widget>[

                    Text(translatedTh1 ?? "Please Select Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),  
                   
                  ),

                  Image.network('https://2vfp4w3qqsd3w56vrl16qu16-wpengine.netdna-ssl.com/wp-content/uploads/2020/08/TLC-Activities.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh2 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            
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
              child: Text(translatedText3 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh3 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://www.scripps.org/sparkle-assets/variants/hi_res_strike-a-pose-branded-9788899044413983540_desktop_x++-1200x1200.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText31 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText32 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh4 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://mindpowergolf.com/wp-content/uploads/2018/06/Meditation.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText4 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh5 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://www.adityabirlacapital.com/healthinsurance/active-together/wp-content/uploads/2020/04/Healthy-food-1.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText5 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh6 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://www.falmouth.ac.uk/sites/default/files/styles/focal_point___course_hero_image/public/image/ba_dance_choreography_143mjessop_copyjpg_75.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText6 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh7 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://www.calmsage.com/wp-content/uploads/2020/05/what-is-4me-time-and-10-ways-to-enjoy-your-me-time2-.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText7 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh8 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://www.bleedingheartland.com/static/media/2020/09/shutterstock_1306792438-700x442.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText8 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh9 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/03/watching-tv-1585122957.jpg'),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText9 ?? "", style: TextStyle(fontSize: 18)),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedTh10 ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

            Image.network('https://www.howtogeek.com/wp-content/uploads/2018/11/shutterstock_507995524.png'),


            Padding(
              padding: EdgeInsets.all(10),
              child: Text(translatedText10 ?? "", style: TextStyle(fontSize: 18)),
            ),


                  ],) 
                  
                  
                  
            ),
           
            
          ],
        ));
  }
}
