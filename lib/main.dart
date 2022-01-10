import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:smart_baby/components/login_component.dart';
import 'package:smart_baby/screens/base_screen.dart';
import 'package:smart_baby/screens/result_alphabet_screen.dart';
import 'package:smart_baby/screens/result_color_screen.dart';
import 'package:smart_baby/screens/result_number_screen.dart';
import 'package:smart_baby/screens/result_fruit_screen.dart';
import 'package:smart_baby/screens/result_vegetable_screen.dart';
import 'package:smart_baby/screens/result_weekday_screen.dart';
import 'package:smart_baby/screens/result_shape_screen.dart';
import 'package:smart_baby/screens/result_weather_screen.dart';
import 'package:smart_baby/screens/result_animal_screen.dart';
import 'package:smart_baby/screens/result_map_screen.dart';
import 'package:smart_baby/screens/result_planets_screen.dart';
import 'package:smart_baby/screens/result_paint_screen.dart';

void main() {
  runApp(SmartBabyApp());
}

class SmartBabyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMART BABY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //initialRoute: '/',
      routes: {
        '/base': (context) => BaseScreen(
              name: '',
            ),
        '/resultalphabet': (context) => ResultAlphabetScreen(),
        '/resultnumber': (context) => ResultNumberScreen(),
        '/resultcolor': (context) => ResultColorScreen(),
        '/resultfruit': (context) => ResultFruitScreen(),
        '/resultvegetable': (context) => ResultVegetableScreen(),
        '/resultweekday': (context) => ResultWeekdayScreen(),
        '/resultshape': (context) => ResultShapeScreen(),
        '/resultanimal': (context) => ResultAnimalScreen(),
        '/resultweather': (context) => ResultWeatherScreen(),
        '/resultmap': (context) => ResultMapScreen(),
        '/resultplanets': (context) => ResultPlanetsScreen(),
        '/resultpaint': (context) => ResultPaintScreen(),
      },
      home: SbHomePage(title: 'Welcome to SMART BABY APP'),
    );
  }
}

class SbHomePage extends StatefulWidget {
  SbHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SbHomePageState createState() => _SbHomePageState();
}

class _SbHomePageState extends State<SbHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: kappGradient,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: size.height * 0.30,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/images/ani_anvi_playing.jpg'),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: const LoginComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
