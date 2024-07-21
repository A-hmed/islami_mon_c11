import 'package:flutter/material.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/quran/quran.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/radio/radio.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/sebha/sebha.dart';
import 'package:islami_c11_mon/ui/utils/app_assets.dart';
import 'package:islami_c11_mon/ui/utils/app_colors.dart';
import 'package:islami_c11_mon/ui/utils/app_style.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;
  List<Widget> tabs = [Quran(), Ahadeth(), MyRadio(), Sebha()];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.lightBackground))),
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: buildBottomNavigation(),
        body: tabs[selectedTabIndex],
      ),
    );
  }

  Theme buildBottomNavigation() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.primary),
      child: BottomNavigationBar(
        currentIndex: selectedTabIndex,
        onTap: (index) {
          selectedTabIndex = index;
          setState(() {});
        },
        selectedIconTheme: IconThemeData(size: 36),
        selectedItemColor: AppColors.accentColor,
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
              label: "Ahadeth"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
        ],
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        title: Text(
          "Islami",
          style: AppStyle.appBarStyle,
        ),
        centerTitle: true,
        backgroundColor: AppColors.transparent,
        elevation: 0,
      );
}
