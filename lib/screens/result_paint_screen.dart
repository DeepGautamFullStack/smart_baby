import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ResultPaintScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text('Paint Screen'),
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
  List<Offset> points = [];
  Color selectedColor = Colors.green;
  double strokeWidth = 7.0;

  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  void initState() {
    super.initState();
    strokeWidth = 7.0;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          decoration: kappGradient,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width * 0.8,
                height: height * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.4)),
                  ],
                ),
                child: GestureDetector(
                  onPanDown: (details) {
                    this.setState(() {
                      points.add(details.localPosition);
                    });
                  },
                  onPanUpdate: (details) {
                    this.setState(() {
                      points.add(details.localPosition);
                    });
                  },
                  onPanEnd: (details) {
                    this.setState(() {
                      // points.add(null);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child: CustomPaint(
                      painter: MyCustomPainter(
                          points: points,
                          color: selectedColor,
                          strokeWidth: strokeWidth),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.color_lens),
                      color: selectedColor,
                      onPressed: () {
                        setColor(context);
                      },
                    ),
                    Expanded(
                      child: Slider(
                          min: 1,
                          max: 12,
                          activeColor: selectedColor,
                          value: strokeWidth,
                          onChanged: (value) {
                            setState(() {
                              strokeWidth = value;
                            });
                          }),
                    ),
                    IconButton(
                      icon: Icon(Icons.layers_clear),
                      onPressed: () {
                        setState(() {
                          points.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> setColor(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Choose color'),
              content: SingleChildScrollView(
                child: BlockPicker(
                    pickerColor: pickerColor,
                    onColorChanged: (value) {
                      setState(() {
                        selectedColor = value;
                      });
                    }),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}

class MyCustomPainter extends CustomPainter {
  MyCustomPainter(
      {required this.points, required this.color, required this.strokeWidth});
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Paint bkg = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, bkg);

    Paint paint = Paint();
    paint.color = color;
    paint.strokeWidth = strokeWidth;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    canvas.drawPoints(PointMode.points, points, paint);

    // for (int x = 0; x < points.length - 1; x++) {
    //   canvas.drawLine(points[x], points[x + 1], paint);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
