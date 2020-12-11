import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Learn extends StatefulWidget {
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName) {
    return Align(
      child: SvgPicture.asset('assets/myth/$assetName.svg', width: 160.0,height: 500,),
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 15.0);
    var pageDecoration = PageDecoration(
      titleTextStyle:
          GoogleFonts.montserrat(fontSize: 25.0, fontWeight: FontWeight.w500),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Myth Buster',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title:
                "COVID-19 can be transmitted through goods so if you feel its surface is contaminated clean with disinfectant and wash your hands after touching it.",
            body: '',
            image: _buildImage('myth1'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "COVID-19 can not be transmitted by mosquitoes.",
            body: "",
            image: _buildImage('myth2'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Wash your clothes using detergent or soap in 60-90°C water and dry clothes in the sun",
            body: "",
            image: _buildImage('myth3'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Drinking alcohol doesn't help in preventing coronavirus.",
            body: "",
            image: _buildImage('myth4'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Coronavirus can be transmitted in any kind of climate.",
            body: '',
            image: _buildImage('myth5'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "It may take the virus 1-14 days to incubate and cause symptoms so digital thermometes cannot be used to identify asymptomatic patients.",
            body: "",
            image: _buildImage('myth6'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title:
                "Don't use UV bulbs for disinfecting on your hands because it may irritate your skin.",
            body: "",
            image: _buildImage('myth7'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title:
                "Eating garlic does not prevent people from getting COVID-19.",
            body: "",
            image: _buildImage('myth8'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title:
                "Eating garlic does not prevent people from getting COVID-19.",
            body: "",
            image: _buildImage('myth9'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title:
                "Pneumonia vaccine should not be used to prevent COVID-19",
            body: "",
            image: _buildImage('myth10'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Rinsing the nose with saline does not prevent people from getting COVID-19.",
            body: "",
            image: _buildImage('myth11'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "There is no drug that can prevent or treat COVID-19.",
            body: "",
            image: _buildImage('myth12'),
            decoration: pageDecoration,
          ),
        ],

        onDone: () => {},

        skipFlex: 8,
        nextFlex: 15,

        // skip: const Text('Skip'),
        done: const Icon(
          Icons.arrow_forward,
          color: Colors.grey,
        ),

        dotsFlex: 0,

        next: const Icon(Icons.arrow_forward),
        dotsDecorator: DotsDecorator(
          size: Size(7.0, 8.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 9.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
