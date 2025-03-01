import 'package:flutter/material.dart';

void preloadImages(context) {
  List<String> images = [
    //Users
    'assets/image/Users/user1.webp',
    'assets/image/Users/user2.webp',
    'assets/image/Users/user3.webp',
    'assets/image/Users/user4.webp',
    'assets/image/Users/user5.webp',
    'assets/image/Users/user6.webp',
    'assets/image/Users/user7.webp',
    'assets/image/Users/user8.webp',
    'assets/image/Users/user9.webp',
    'assets/image/Users/user10.webp',
    'assets/image/Users/user11.webp',
    'assets/image/Users/user12.webp',
    'assets/image/Users/user13.webp',
    'assets/image/Users/user14.webp',
    'assets/image/Users/user15.webp',
    'assets/image/Users/user16.webp',

    //Status
    'assets/image/Status/cake.webp',
    'assets/image/Status/car_deal.webp',
    'assets/image/Status/google_hq.webp',
    'assets/image/Status/japan_streets.webp',
    'assets/image/Status/picnic.webp',
    'assets/image/Status/plane.webp',
    'assets/image/Status/school.webp',
    'assets/image/Status/stadium.webp',
    'assets/image/Status/streets_of_SF.webp',
    'assets/image/Status/theater.webp',

    //Channels
    'assets/image/Channels/amazon.webp',
    'assets/image/Channels/apple.webp',
    'assets/image/Channels/bbc.webp',
    'assets/image/Channels/google.webp',
    'assets/image/Channels/lg.webp',
    'assets/image/Channels/linux.webp',
    'assets/image/Channels/mcdonalds.webp',
    'assets/image/Channels/mercedes.webp',
    'assets/image/Channels/meta.webp',
    'assets/image/Channels/microsoft.webp',
    'assets/image/Channels/nike.webp',
    'assets/image/Channels/railway.webp',
    'assets/image/Channels/samsung.webp',
    'assets/image/Channels/tata.webp',
    'assets/image/Channels/tesla.webp',
    'assets/image/Channels/waymo.webp',
  ];

  for (String imagePath in images) {
    precacheImage(AssetImage(imagePath), context);
  }
}
