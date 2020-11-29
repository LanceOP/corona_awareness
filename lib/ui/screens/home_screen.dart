import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:aware/covid_track/state_screen.dart';
import 'package:aware/ui/screens/dashboard.dart';
import 'package:aware/ui/screens/details.dart';
import 'package:aware/ui/screens/health.dart';
import 'package:aware/ui/screens/indian_states.dart';
import 'package:aware/ui/screens/news_page.dart';
import 'package:aware/ui/screens/zones.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aware/covid_track/loading_page.dart';

//FontAwesome Icons
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          dragStartBehavior: DragStartBehavior.down,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            DashBoard(),
            StateScreen(),
            Health(),
            NewsScreen(),
            //Details(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 500),
        // itemCornerRadius: 15,
        showElevation: true,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Dashboard', style: GoogleFonts.montserrat()),
            icon: Icon(Icons.dashboard),
            activeColor: Colors.blueGrey,
          ),
          BottomNavyBarItem(
            title: Text(' States', style: GoogleFonts.montserrat()),
            icon: Icon(Icons.flag),
            activeColor: Colors.indigo,
          ),
          BottomNavyBarItem(
            title: Text(' Health', style: GoogleFonts.montserrat()),
            icon: Icon(FontAwesomeIcons.stethoscope),
            activeColor: Color(0xFF28a745),
          ),
          BottomNavyBarItem(
            title: Text(' News', style: GoogleFonts.montserrat()),
            icon: Icon(Icons.explore),
            activeColor: Color(0xFFFFB339),
          ),
          /*BottomNavyBarItem(
            title: Text(' Facts', style: GoogleFonts.montserrat()),
            icon: Icon(Icons.lightbulb_outline),
            activeColor: Color(0xFF299489),
          ),*/
        ],
      ),
    );
  }
}
