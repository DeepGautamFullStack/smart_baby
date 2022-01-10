import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultWeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Weathers Screen'),
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
  var weatherImage = [
    AssetImage('assets/images/weather/cloudy.png'),
    AssetImage('assets/images/weather/cold.png'),
    AssetImage('assets/images/weather/hot.png'),
    AssetImage('assets/images/weather/lightining.png'),
    AssetImage('assets/images/weather/rainy.png'),
    AssetImage('assets/images/weather/snowy.png'),
    AssetImage('assets/images/weather/stormy.png'),
    AssetImage('assets/images/weather/sunny.png'),
    AssetImage('assets/images/weather/windy.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 65),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Ink.image(
                    image: AssetImage(selectedImagePath),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 65),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  children: List.generate(9, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImagePath = weatherImage[index].assetName;
                        });
                        var startIndex = selectedImagePath.lastIndexOf('/');
                        var lastIndex = selectedImagePath.lastIndexOf('.');
                        _flutterTts.speak(
                            selectedImagePath.substring(startIndex, lastIndex));
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Ink.image(
                          image: weatherImage[index],
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
