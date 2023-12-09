import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffd9d9d9)),
            child: Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                const Text("Thank you!",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w500,
                    )),
                const Text("Your transaction was successful",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Kanit',
                      fontWeight: FontWeight.w400,
                    )),
                const Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Text("Date",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w400,
                          )),
                      Spacer(),
                      Text("01/24/2023",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Text("Time",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w400,
                          )),
                      Spacer(),
                      Text('10:15 AM',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(17.0),
                  child: Row(
                    children: [
                      Text("To",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w400,
                          )),
                      Spacer(),
                      Text("SameH",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text("Total",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w400,
                          )),
                      Spacer(),
                      Text("5000",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 305,
                  height: 73,
                  child: Image.asset('assets/images/pie-chart.png'),
                ),
                const SizedBox(
                  height: 91,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.barcode,
                        size: 70,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'PAID',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * .23,
              left: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * .23,
              right: -20,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              left: 0,
              right: 0,
              top: -22,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey.shade300,
                child: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * .24,
              left: 20,
              right: 20,
              child: Text(
                " ----------------------------",
                style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 20,
                    color: Colors.grey.shade500),
              )),
        ],
      ),
    );
  }
}
