import 'package:flutter/material.dart';
import 'package:islami_c11_mon/ui/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_c11_mon/ui/screens/home/home.dart';
import 'package:islami_c11_mon/ui/screens/splash/splash.dart';
import 'package:islami_c11_mon/ui/screens/sura_details/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails()
      },
      initialRoute: Splash.routeName,
    );
  }
}
