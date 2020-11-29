import 'package:flutter/material.dart';
import './textcontroller.dart';
import './data.dart';

class TextDisplay extends StatefulWidget {
  @override
  _TextDisplayState createState() => _TextDisplayState();
}

class _TextDisplayState extends State<TextDisplay> {
  int tog = 0;

/*  List text = [
    '"All our dreams can come true, if we have the courage to pursue them.” – Walt Disney.',
    '“If people are doubting how far you can go, go so far that you can’t hear them anymore.” – Michele Ruiz',
    'We need to accept that we won’t always make the right decisions, that we’ll screw up royally sometimes – understanding that failure is not the opposite of success, it’s part of success.” – Arianna Huffington',
    '“Everything you can imagine is real.”― Pablo Picasso',
    '“Do one thing every day that scares you.”― Eleanor Roosevelt',
    '“Smart people learn from everything and everyone, average people from their experiences, stupid people already have all the answers.” – Socrates',
    '“Do what you feel in your heart to be right – for you’ll be criticized anyway.”― Eleanor Roosevelt',
    '“Whatever you are, be a good one.” ― Abraham Lincoln',
    '“Magic is believing in yourself. If you can make that happen, you can make anything happen.” – Johann Wolfgang Von Goethe',
    '“So. Monday. We meet again. We will never be friends—but maybe we can move past our mutual enmity toward a more-positive partnership.” ― Julio-Alexi Genao',
  ]; */

  List text = [
    '"You are braver than you believe, and stronger than you seem, and smarter than you think"',
    '"Keep calm and carry on"',
    '"The only thing we have to fear is fear itself"',
    '"A life lived in fear is a life half lived"',
    '"Are you not worried? Would that help?"',
    '"Worry is like a rocking chair: It gives you something to do but never gets you anywhere"',
    '"Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less"',
    '"Do not worry, be happy"',
    '"Do not worry bout a thing, cause every little things gonna be alright"',
    '"Things could always be better, but things could always be worse"',
    '"Nothing\'s okay. So it\'s okay."',
    '"I like to think of life as an adventure, like a roller coaster. It helps with the ups and downs"',
    '"Often when you think you\'re at the end of something, you\'re at the beginning of something else"',
    '"Better to be busy than to be busy worrying"',
    '"Life isn\'t about waiting for the storm to pass. It\'s about learning how to dance in the rain."',
    '"If you\'re going through hell, keep going"',
    '"Praise and blame, gain and loss, pleasure and sorrow come and go like the wind"',
    '"Dawn comes after the darkness"',
    '"I know what I have to do now, I\'ve got to keep breathing because tomorrow the sun will rise. Who knows what the tide could bring?"',
    '"Everything will be okay in the end. If it\'s not okay, it\'s not the end"',
  ];



  void pressMe() {
    if (tog == 19) {
      setState(() {
        tog = 0;
      });
    } else {
      setState(() {
        tog++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/quote_background3.jpg"), fit: BoxFit.cover)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: Data(text[tog]),
          ),
          SizedBox(
            height: 20,
          ),
          Changer(pressMe),
        ],
      ),
    );
  }
}
