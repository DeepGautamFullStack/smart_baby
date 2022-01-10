import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultVegetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Vegetable Screen'),
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
  var vegetableImage = [
    AssetImage('assets/images/vegetable/bottolegourd.png'),
    AssetImage('assets/images/vegetable/brinjal.png'),
    AssetImage('assets/images/vegetable/cabbage.png'),
    AssetImage('assets/images/vegetable/cauliflower.png'),
    AssetImage('assets/images/vegetable/chilies.png'),
    AssetImage('assets/images/vegetable/cucumber.png'),
    AssetImage('assets/images/vegetable/onion.png'),
    AssetImage('assets/images/vegetable/peas.png'),
    AssetImage('assets/images/vegetable/potato.png'),
    AssetImage('assets/images/vegetable/radish.png'),
    AssetImage('assets/images/vegetable/tomato.png'),
    AssetImage('assets/images/vegetable/turnip.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
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
          flex: 3,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  children: List.generate(12, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImagePath = vegetableImage[index].assetName;
                        });
                        var startIndex = selectedImagePath.lastIndexOf('/');
                        var lastIndex = selectedImagePath.lastIndexOf('.');
                        _flutterTts.speak(
                            selectedImagePath.substring(startIndex, lastIndex));
                      },
                      child: Container(
                        height: 180.0,
                        width: 180.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.all(15.0),
                        child: Ink.image(
                          image: vegetableImage[index],
                          fit: BoxFit.cover,
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
