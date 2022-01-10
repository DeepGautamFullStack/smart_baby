import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.myRoute,
    required this.heading,
    required this.subheading,
    required this.icon,
    required this.cardImage,
    required this.colour,
  }) : super(key: key);

  final String myRoute;
  final String heading;
  final String subheading;
  final IconData icon;
  final AssetImage cardImage;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, myRoute);
        },
        child: Container(
          height: 180.0,
          width: 180.0,
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(10.0)),
          margin: EdgeInsets.all(15.0),
          child: Card(
            elevation: 40.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(heading),
                  subtitle: Text(subheading),
                  trailing: Icon(icon),
                ),
                Container(
                  height: 100.0,
                  child: Ink.image(
                    image: cardImage,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
