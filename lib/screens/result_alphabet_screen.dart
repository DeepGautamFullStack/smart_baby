import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultAlphabetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Alphabets Screen'),
      ),
      body: Container(
        decoration: kappGradient,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ResultContainer(),
            ),
          ],
        ),
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
  final _flutterTts = FlutterTts();
  String pressedButtonText = '';
  var characters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

  var letters = [
    'apple',
    'ball',
    'cat',
    'dog',
    'egg',
    'fish',
    'goat',
    'hen',
    'ink',
    'juice',
    'kite',
    'lion',
    'moneky',
    'nest',
    'orange',
    'parrot',
    'queen',
    'rat',
    'sun',
    'tiger',
    'up',
    'van',
    'watch',
    'x-mas',
    'yak',
    'zebra',
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
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Text(
                    pressedButtonText.toUpperCase(),
                    style: kbigLabelTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  children: List.generate(26, (index) {
                    return Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            pressedButtonText = characters[index];
                          });
                          _flutterTts.speak(
                              pressedButtonText + ' for' + letters[index]);
                        },
                        backgroundColor: Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              characters[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              letters[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
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
