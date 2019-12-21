import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_hero/helpers.dart';
import 'package:super_hero/hero-page-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));

    return MaterialApp(
      title: 'Super Hero',
      theme: ThemeData(
          primarySwatch: whiteSwatch,
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.85,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Hero(tag: "navigation", child: Icon(Icons.keyboard_arrow_left, size: 36,)),
                    Icon(Icons.search)
                  ],
                ),
              ),

              Container(
                color: Color.fromRGBO(246, 29, 42, 1.0),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
                child: Text(
                  "MARVEL",
                  style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    HeroPageView(
                      color: Colors.blue[800],
                      heroName: "Captain America",
                      heroActualName: "Steve Rogers",
                      heroBio: cap_subtitle,
                      heroLogo: "assets/cap_sheild.png",
                      heroActionImage: "assets/cap.png",
                    ),
                    HeroPageView(
                      color: Colors.red,
                      heroName: "Spider Man",
                      heroActualName: "Peter Parker",
                      heroBio: spiderman_subtitle,
                      heroLogo: "assets/spider.png",
                      heroActionImage: "assets/spiderman.png",
                    ),
                    HeroPageView(
                      color: Colors.orange,
                      heroName: "Iron Man",
                      heroActualName: "Tony Stark",
                      heroBio: ironman_subtitle,
                      heroLogo: "assets/ironman_mask.png",
                      heroActionImage: "assets/ironman.png",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
