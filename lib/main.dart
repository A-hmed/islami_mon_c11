import 'package:flutter/material.dart';
import 'package:islami_c11_mon/ui/screens/home/home.dart';
import 'package:islami_c11_mon/ui/screens/splash/splash.dart';
import 'package:islami_c11_mon/ui/utils/app_assets.dart';
import 'package:islami_c11_mon/ui/utils/app_colors.dart';

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
        Home.routeName: (_) => const Home()
      },
      initialRoute: Splash.routeName,
    );
  }
}