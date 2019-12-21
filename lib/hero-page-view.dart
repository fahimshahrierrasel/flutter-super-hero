import 'package:flutter/material.dart';
import 'package:super_hero/helpers.dart';
import 'package:super_hero/hero-details.dart';

class HeroPageView extends StatelessWidget {
  final Color color;
  final String heroLogo;
  final String heroActionImage;
  final String heroName;
  final String heroActualName;
  final String heroBio;

  const HeroPageView(
      {Key key,
      @required this.color,
      @required this.heroLogo,
      @required this.heroActionImage,
      @required this.heroName,
      @required this.heroActualName,
      @required this.heroBio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        GestureDetector(
          onVerticalDragUpdate: (dragUpdateDetails) {
            Navigator.of(context).push(FadePageRoute(
                builder: (context) => HeroDetails(
                      color: color,
                      heroLogo: heroLogo,
                      heroActionImage: heroActionImage,
                      heroName: heroName,
                      heroActualName: heroActualName,
                      heroBio: heroBio,
                    )));
          },
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20.0),
//                boxShadow: [
//                  BoxShadow(
//                    color: color.withOpacity(0.7),
//                    offset: Offset(0, 3.0),
//                    blurRadius: 6,
//                  ),
//                ]
            ),
            margin: EdgeInsets.only(left: 10, right: 10, top: 95, bottom: 10),
            width: double.infinity,
            child: Stack(
              overflow: Overflow.clip,
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  top: -115,
                  child: Hero(
                    tag: heroLogo,
                    child: Image.asset(
                      heroLogo,
                      color: Colors.white,
                      width: 220,
                    ),
                  ),
                ),
                Positioned(
                  top: 220,
                  left: 30,
                  right: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        heroName,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        heroActualName,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          heroBio,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Icon(
                    Icons.expand_less,
                    size: 24,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        Hero(
          tag: heroActionImage,
          child: Image.asset(
            heroActionImage,
            width: 280,
          ),
        ),
      ],
    );
  }
}
