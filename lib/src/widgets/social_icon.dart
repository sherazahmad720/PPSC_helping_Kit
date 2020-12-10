import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData iconName;
  SocialIcon({this.iconName});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconName,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
