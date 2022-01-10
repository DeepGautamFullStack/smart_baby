import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';
import 'package:smart_baby/components/custom_card.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({required this.name});
  final String name;
  final alphabetCardImage = AssetImage('assets/images/abc_banner.png');
  final headingAlphabet = 'Alphabets';
  final subheadingAlphabet = 'abcdefghijgkl..';
  final iconAlphabet = Icons.sort_by_alpha;
  final myRouteAlphabet = '/resultalphabet';

  final numbersCardImage = AssetImage('assets/images/numbers_banner.png');
  final headingNumbers = 'Numbers';
  final subheadingNumbers = '1234567..';
  final iconNumbers = Icons.format_list_numbered;
  final myRouteNumbers = '/resultnumber';

  final colorsCardImage = AssetImage('assets/images/colors_banner.png');
  final headingColors = 'Colors';
  final subheadingColors = 'red,blue....';
  final iconColors = Icons.color_lens;
  final myRouteColors = '/resultcolor';

  final fruitsCardImage = AssetImage('assets/images/fruits_banner.png');
  final headingFruits = 'Fruits';
  final subheadingFruits = 'mango....';
  final iconFruits = Icons.flourescent;
  final myRouteFruits = '/resultfruit';

  final vegetablesCardImage = AssetImage('assets/images/vegetables_banner.png');
  final headingVegetables = 'Vegetables';
  final subheadingVegetables = 'potato....';
  final iconVegetables = Icons.food_bank_outlined;
  final myRouteVegetables = '/resultvegetable';

  final weekdaysCardImage = AssetImage('assets/images/weekdays_banner.png');
  final headingWeekdays = 'Weekdays';
  final subheadingWeekdays = 'sunday....';
  final iconWeekdays = Icons.calendar_view_week_rounded;
  final myRouteWeekdays = '/resultweekday';

  final shapesCardImage = AssetImage('assets/images/shapes_banner.png');
  final headingShapes = 'Shapes';
  final subheadingShapes = 'circle....';
  final iconShapes = Icons.circle;
  final myRouteShapes = '/resultshape';

  final animalsCardImage = AssetImage('assets/images/animal_banner.png');
  final headingAnimals = 'Animals';
  final subheadingAnimals = 'tiger....';
  final iconAnimals = Icons.hail_rounded;
  final myRouteAnimals = '/resultanimal';

  final planetsCardImage = AssetImage('assets/images/planets_banner.png');
  final headingPlanets = 'Planets';
  final subheadingPlanets = 'venus....';
  final iconPlanets = Icons.hail_rounded;
  final myRoutePlanets = '/resultplanets';

  final weatherCardImage = AssetImage('assets/images/weather_banner.png');
  final headingWeather = 'Weather';
  final subheadingWeather = 'cold....';
  final iconWeather = Icons.cloud;
  final myRouteWeather = '/resultweather';

  final mapsCardImage = AssetImage('assets/images/map_banner.png');
  final headingMaps = 'Maps';
  final subheadingMaps = 'India, world....';
  final iconMaps = Icons.map;
  final myRouteMaps = '/resultmap';

  final paintsCardImage = AssetImage('assets/images/paint_banner.png');
  final headingPaints = 'Paints';
  final subheadingPaintss = 'painting...';
  final iconPaints = Icons.map;
  final myRoutePaints = '/resultpaint';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('WELCOME SMART BABY-$name'.toUpperCase()),
      ),
      body: Container(
        decoration: kappGradient,
        child: ListView(
          children: <Widget>[
            //row 1 start
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteAlphabet,
                      heading: headingAlphabet,
                      subheading: subheadingAlphabet,
                      icon: iconAlphabet,
                      cardImage: alphabetCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteNumbers,
                      heading: headingNumbers,
                      subheading: subheadingNumbers,
                      icon: iconNumbers,
                      cardImage: numbersCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                ],
              ),
            ),
            //row 1 end

            //row 2 start
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteColors,
                      heading: headingColors,
                      subheading: subheadingColors,
                      icon: iconColors,
                      cardImage: colorsCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteFruits,
                      heading: headingFruits,
                      subheading: subheadingFruits,
                      icon: iconFruits,
                      cardImage: fruitsCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                ],
              ),
            ),
            //row 2 end

            //row 3 start
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteVegetables,
                      heading: headingVegetables,
                      subheading: subheadingVegetables,
                      icon: iconVegetables,
                      cardImage: vegetablesCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteWeekdays,
                      heading: headingWeekdays,
                      subheading: subheadingWeekdays,
                      icon: iconWeekdays,
                      cardImage: weekdaysCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                ],
              ),
            ),
            // row 3 end
            //row 4 start
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteShapes,
                      heading: headingShapes,
                      subheading: subheadingShapes,
                      icon: iconShapes,
                      cardImage: shapesCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteAnimals,
                      heading: headingAnimals,
                      subheading: subheadingAnimals,
                      icon: iconAnimals,
                      cardImage: animalsCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                ],
              ),
            ),
            // row 4 end

            //row 5 start
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      myRoute: myRoutePlanets,
                      heading: headingPlanets,
                      subheading: subheadingPlanets,
                      icon: iconPlanets,
                      cardImage: planetsCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteWeather,
                      heading: headingWeather,
                      subheading: subheadingWeather,
                      icon: iconWeather,
                      cardImage: weatherCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                ],
              ),
            ),
            // row 5 end

            //row 6 start
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      myRoute: myRouteMaps,
                      heading: headingMaps,
                      subheading: subheadingMaps,
                      icon: iconMaps,
                      cardImage: mapsCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      myRoute: myRoutePaints,
                      heading: headingPaints,
                      subheading: subheadingPaintss,
                      icon: iconPaints,
                      cardImage: paintsCardImage,
                      colour: kactiveCardcolor,
                    ),
                  ),
                ],
              ),
            ),
            // row 6 end
          ],
        ),
      ),
    );
  }
}
