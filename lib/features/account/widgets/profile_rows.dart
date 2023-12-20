import 'package:flutter/material.dart';

class ProfileRows extends StatelessWidget {
  const ProfileRows(
      {super.key,
      required this.title,
      required this.desc,
      required this.onPressed});
  final String title;
  final String desc;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 76,
        child: Column(
          children: [
            // const SizedBox(
            //   height: 5,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 19,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        desc,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Kanit',
                            color: Colors.grey.shade600),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Icon((Icons.arrow_forward_ios))
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
