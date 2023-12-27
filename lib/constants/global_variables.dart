import 'package:flutter/material.dart';

// https://dark-ruby-coveralls.cyclic.app
//localhost must be 10.0.2.2 to run in emulator
//http://192.168.1.9:3000
String uri = 'http://192.168.1.7:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [Colors.white10, Colors.white],
    stops: [0.5, 1.0],
  );
  static const appBarPrivate = LinearGradient(
    colors: [Color.fromARGB(255, 0, 150, 130), Colors.teal],
    // colors: [Color(0xff0077ad), Color(0xff009eff)],
    stops: [0.5, 1.0],
  );
  static const appBarAdmin = LinearGradient(
    colors: [Color(0xff0077ad), Color(0xff009eff)],
    stops: [0.5, 1.0],
  );
  static const myTealColor = Color.fromARGB(255, 2, 128, 115);
  // static const mypetroleumColor = Color(0xff00283a);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color(0xff00283a);
  static const unselectedNavBarColor = Colors.black;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images.puma.com/image/upload/q_auto,f_auto,w_1440/regional/%7Eregional%7EDFA%7Eothers%7EKOPs%7E24SS%7ESPORTSTYLE%7EPALERMO%7E24SS_Ecom_SP_Palermo-Dua-Lipa_FullBleedHero_Desktop_1440x500_1.jpg/fmt/jpg/fmt/png',
    'https://images.puma.com/image/upload/q_auto,f_auto,w_1440/regional/%7Eregional%7EDFA%7Eothers%7EKOPs%7EAW23%7EBASKETBALL%7EMB03+TOXIC%7E23AW_Ecom_BB_MB03_Toxic_Full-Bleed-Hero_Large_Desk_1440x500px_2.jpg/fmt/jpg/fmt/png',
    'https://dfcdn.defacto.com.tr/df/1600/Mobile/en_buy-2-get-3rd-free_3960x1440-desktop-2_556e034b-718e-4ce5-bd3c-d7663d56782d_42b62bba-e9c4-4be4-94f4-da7f52993854_DI_297.jpg',
  ];
  static const List<String> searchCategory = [
    'HighestRated',
    'HighestPrice',
    'LowestPrice'
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/iphone.jpg',
    },
    {
      'title': 'Cosmetics',
      'image': 'assets/images/cosmeticsf.jpg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliancesf.jpg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashionf.jpg',
    },
  ];
}
