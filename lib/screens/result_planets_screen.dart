import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultPlanetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Planets Screen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ResultContainer(),
          ),
        ],
      ),
    );
  }
}

class ResultContainer extends StatefulWidget {
  const ResultContainer({Key? key}) : super(key: key);

  @override
  _ResultContainerState createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {
  String selectedImagePath = '';
  final _flutterTts = FlutterTts();
  var mapsImage = [
    AssetImage('assets/images/planets_banner.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //row 1 start
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      _flutterTts.speak(
                          "Our solar system is made up of a star, eight planets,The eight planets are Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, and Neptune. Mercury is closest to the Sun. Neptune is the farthest,Jupiter is the largest planet of the solar system.Earth is the fifth largest planet of our solar system and has one large natural satellite, the Moon.");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.all(10.0),
                      child: Ink.image(
                        image: mapsImage[0],
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ],
          ),
        ),
        //row 1 end
      ],
    );
  }
}
