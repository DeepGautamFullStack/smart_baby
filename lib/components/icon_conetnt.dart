import 'package:flutter/material.dart';
import 'package:smart_baby/constants/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.lable});
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: klabelTextStyle,
        )
      ],
    );
  }
}
