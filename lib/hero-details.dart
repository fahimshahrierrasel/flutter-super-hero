import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeroDetails extends StatefulWidget {
  final Color color;
  final String heroLogo;
  final String heroActionImage;
  final String heroName;
  final String heroActualName;
  final String heroBio;

  const HeroDetails(
      {Key key,
      this.color,
      this.heroLogo,
      this.heroActionImage,
      this.heroName,
      this.heroActualName,
      this.heroBio})
      : super(key: key);

  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  double bottomNavigationMargin = 150;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ));

    return Scaffold(
      backgroundColor: widget.color,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 30,
                  left: 20,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.dark,
                          systemNavigationBarIconBrightness: Brightness.dark
                        ));
                      },
                      child: Hero(
                          tag: "navigation",
                          child: Icon(
                            Icons.expand_more,
                            size: 36,
                            color: Colors.white,
                          ))),
                ),
                Hero(
                    tag: widget.heroLogo,
                    child: Image.asset(
                      widget.heroLogo,
                      height: 300,
                      color: Colors.white,
                    )),
                Hero(
                    tag: widget.heroActionImage,
                    child: Image.asset(
                      widget.heroActionImage,
                      height: 250,
                    ))
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.heroName,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        widget.heroActualName,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            widget.heroBio,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onVerticalDragUpdate: (onVerticalDragDetails) {
                    setState(() {
                      if (onVerticalDragDetails.primaryDelta > 0)
                        bottomNavigationMargin = 150;
                      else
                        bottomNavigationMargin = 0;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.bounceOut,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    margin: EdgeInsets.only(top: bottomNavigationMargin),
                    padding: EdgeInsets.only(top: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 5),
                            child: Text(
                              "Latest News",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 30,
                                        top: 8,
                                        bottom: 8,
                                        right: 8),
                                    width: 150,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: Colors.green[100],
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                Container(
                                    margin: EdgeInsets.all(8),
                                    width: 150,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: Colors.green[400],
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                Container(
                                    margin: EdgeInsets.all(8),
                                    width: 150,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: Colors.green[800],
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 5),
                            child: Text(
                              "Related Movies",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 30, top: 8, bottom: 8, right: 8),
                                  width: 150,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.teal[100],
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  width: 150,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.teal[400],
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  width: 150,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      color: Colors.teal[800],
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
