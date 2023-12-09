import 'package:flutter/material.dart';

//localhost must be 10.0.2.2 to run in emulator
String uri = 'http://10.0.2.2:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 255, 255, 255),
      Color.fromARGB(255, 255, 255, 255),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images.puma.com/image/upload/q_auto,f_auto,w_1440/regional/%7Eregional%7EDFA%7Eothers%7EKOPs%7EAW23%7EBASKETBALL%7EMB03+TOXIC%7E23AW_Ecom_BB_MB03_Toxic_Full-Bleed-Hero_Large_Desk_1440x500px_2.jpg/fmt/jpg/fmt/png',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images.puma.com/image/upload/q_auto,f_auto,w_1440/regional/%7Eregional%7EDFA%7Eothers%7EKOPs%7E24SS%7ESPORTSTYLE%7EPALERMO%7E24SS_Ecom_SP_Palermo-Dua-Lipa_FullBleedHero_Desktop_1440x500_1.jpg/fmt/jpg/fmt/png',
    'https://dfcdn.defacto.com.tr/df/1600/Mobile/en_buy-2-get-3rd-free_3960x1440-desktop-2_556e034b-718e-4ce5-bd3c-d7663d56782d_42b62bba-e9c4-4be4-94f4-da7f52993854_DI_297.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/smartphone.png',
    },
    {
      'title': 'Cosmetics',
      'image': 'assets/images/shampoo.png',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/home-appliance.png',
    },
    // {
    //   'title': 'Books',
    //   'image': 'assets/images/books.jpeg',
    // },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.png',
    },
  ];
}
