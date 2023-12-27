import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(5)),
      height: 40,
      width: 60,
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: Center(child: Icon(Icons.sort)
            //  Text(
            //   'SORT',
            //   style: TextStyle(
            //       fontFamily: 'Kanit', fontSize: 15, color: Colors.white),
            // ),
            ),
      ),
    );
  }
}
