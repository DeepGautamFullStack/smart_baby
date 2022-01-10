import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Numbers Screen'),
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
                  children: List.generate(101, (index) {
                    return Center(
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            pressedButtonText = '$index';
                          });
                          _flutterTts.speak(pressedButtonText);
                        },
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                        backgroundColor: Colors.pink,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$index',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '$index',
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
