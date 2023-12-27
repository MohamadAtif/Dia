import 'package:flutter/material.dart';

class TextSort extends StatelessWidget {
  final Function() onTap;
  final String text;
  const TextSort({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2, top: 2, left: 7, right: 7),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade100),
              color: Colors.grey.shade300),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8, left: 15),
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: 'Kanit',
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
