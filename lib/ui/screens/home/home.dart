import 'package:flutter/material.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/quran/quran.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/radio/app_radio.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/sebha/sebha.dart';
import 'package:islami_c11_mon/ui/utils/app_assets.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_style.dart';


class Home extends StatefulWidget {
  static const String routeName = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  List<Widget> tabs = [Quran(), Ahadeth(), Sebha(), AppRadio()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.lightBackground))
      ),
      child: Scaffold(
        body: tabs[selectedTabIndex],
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: const Text("Islami", style: AppStyle.appBarStyle,),
          centerTitle: true,
        ),
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: AppColors.primaryColor),
          child: BottomNavigationBar(
            onTap: (index){
             selectedTabIndex = index;
             setState(() {});
            },
            currentIndex: selectedTabIndex,
            selectedItemColor: AppColors.accentColor,
            selectedIconTheme: IconThemeData(size: 38 ),
            unselectedIconTheme: IconThemeData(size: 34),
            items: const [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)), label: "Ahadeth"),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio")
            ],
          ),
        ),
      ),
    );
  }
}
