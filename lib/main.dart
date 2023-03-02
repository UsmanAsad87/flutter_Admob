import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  // OR you can use the below due if ad are not display due to device id issue
  // var devices=[''];
  // WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize();
  //
  // RequestConfiguration requestConfiguration =RequestConfiguration(
  //   testDeviceIds:devices
  // );
  // MobileAds.instance.updateRequestConfiguration(requestConfiguration);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AdMobs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}
