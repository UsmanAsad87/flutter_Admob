import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdPage extends StatefulWidget {
  const InterstitialAdPage({Key? key}) : super(key: key);

  @override
  State<InterstitialAdPage> createState() => _InterstitialAdPageState();
}

class _InterstitialAdPageState extends State<InterstitialAdPage> {
  late InterstitialAd interstitialAd;
  bool isAdLoaded =false;
  var adUnit = "ca-app-pub-3940256099942544/1033173712"; //testing ad id
  // var adUnit="ca-app-pub-8535871404297462/4518496172"; //real ad id

  @override
  void initState(){
    super.initState();
    initInterstitailAd();
  }

  initInterstitailAd(){
      InterstitialAd.load(adUnitId: adUnit, request: const AdRequest(), adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad){
        interstitialAd=ad;
        setState(() {
          isAdLoaded=true;
        });
        interstitialAd.fullScreenContentCallback=FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad){
            ad.dispose();

            //do what ever you want
            Navigator.pop(context);
            // initInterstitailAd();
          },
          onAdFailedToShowFullScreenContent: (ad,error){
            ad.dispose();
            setState(() {
              isAdLoaded=false;
            });
          }

        );
      }, onAdFailedToLoad: (error){
        print("Interstitial Error: $error");
        interstitialAd.dispose();
      }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InterstitialAd'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            if(isAdLoaded){
              interstitialAd.show();
            }
          },
          child: const Text("Task Completed"),
        ),
      ),
    );
  }
}
