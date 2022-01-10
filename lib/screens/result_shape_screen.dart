import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultShapeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Shapes Screen'),
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
  var shapeImage = [
    AssetImage('assets/images/shapes/circle.png'),
    AssetImage('assets/images/shapes/heart.png'),
    AssetImage('assets/images/shapes/hexagonal.png'),
    AssetImage('assets/images/shapes/oval.png'),
    AssetImage('assets/images/shapes/rectangle.png'),
    AssetImage('assets/images/shapes/rhombus.png'),
    AssetImage('assets/images/shapes/square.png'),
    AssetImage('assets/images/shapes/star.png'),
    AssetImage('assets/images/shapes/triangle.png'),
    AssetImage('assets/images/shapes/cube.png'),
    AssetImage('assets/images/shapes/cylinder.png'),
    AssetImage('assets/images/shapes/daimond.png'),
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
                  children: List.generate(12, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedImagePath = shapeImage[index].assetName;
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
                          image: shapeImage[index],
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
