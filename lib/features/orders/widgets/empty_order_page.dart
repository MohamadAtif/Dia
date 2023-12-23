import 'package:diamart_commerce/common/widgets/bottom_bar.dart';
import 'package:diamart_commerce/constants/global_variables.dart';
import 'package:flutter/material.dart';

class EmptyOrderPage extends StatelessWidget {
  const EmptyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 120,
            ),
            Icon(Icons.speaker_notes_off_rounded,
                color: Colors.grey.shade400, size: 60),
            const SizedBox(
              height: 30,
            ),
            Text(
              "You don't have any Orders Yet",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Kanit',
                  color: Colors.grey.shade400),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomBar()),
                      (route) => false);
                },
                child: const Text('Keep Shopping',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Kanit',
                        color: GlobalVariables.myTealColor)))
          ],
        ),
      ),
    );
  }
}
