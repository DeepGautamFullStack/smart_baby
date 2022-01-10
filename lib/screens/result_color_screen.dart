import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Colors Screen'),
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
  String pressedButtonText = '';
  final _flutterTts = FlutterTts();
  var colours = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.black,
    Colors.lime,
    Colors.purple,
    Colors.grey,
    Colors.brown,
    Colors.pink,
  ];

  var letters = [
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'indigo',
    'black',
    'lime',
    'purple',
    'grey',
    'brown',
    'pink',
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
                    style: kbigLabelColorTextStyle,
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
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  children: List.generate(12, (index) {
                    return Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            pressedButtonText = letters[index];
                          });

                          _flutterTts.speak(letters[index]);
                        },
                        backgroundColor: colours[index],
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              letters[index].substring(0, 1).toUpperCase(),
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
