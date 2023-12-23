import 'package:flutter/material.dart';

class TextYouMaylike extends StatelessWidget {
  const TextYouMaylike({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'You may also Like',
        style: TextStyle(
            fontFamily: 'Kanit', fontSize: 18, fontWeight: FontWeight.normal),
      ),
    );
  }
}
