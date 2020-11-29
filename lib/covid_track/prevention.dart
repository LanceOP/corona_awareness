import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:google_fonts/google_fonts.dart';
class Prevention extends StatefulWidget {
  @override
  _PreventionState createState() => _PreventionState();
}

class _PreventionState extends State<Prevention> {
  String bullet = "\u2022 ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Prevention',style:GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 5,),
                Container(
                  height: 300,
                  child:PhotoView(
                        imageProvider: NetworkImage('https://newsroom.clevelandclinic.org/wp-content/uploads/sites/4/2020/03/Prevention-graphic_cloth-mask-update_04_07_20-1536x1104.jpg'),
                  ),
                  ),
                SizedBox(height: 5,),
                Text('$bullet'+'Wear a face mask to protect yourself and others when you’re out in public.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
                SizedBox(height: 5,),
                Text('$bullet'+'Practice social distancing. Maintain a 6-foot distance from other people. Avoid crowds and groups of people.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
                SizedBox(height: 5,),
                Text('$bullet'+'Wash your hands often with soap and water for at least 20 seconds. If soap and water are not available, use a hand sanitizer with at least 60% alcohol.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
                SizedBox(height: 5,),
                Text('$bullet'+'Avoid touching your eyes, nose and mouth with unwashed hands.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
                SizedBox(height: 5,),
                Text('$bullet'+'COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
                SizedBox(height: 5,),
                Text('$bullet'+'Stay home when you are sick',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
                SizedBox(height: 5,),
                Text('$bullet'+'Cover your cough or sneeze with a tissue, then throw the tissue in the trash.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
                SizedBox(height: 5,),
                Text('$bullet'+'Standard household cleansers and wipes are effective in cleaning and disinfecting frequently touched objects and surfaces.',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: (cTitle(Colors.black)),
                  maxLines:6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
