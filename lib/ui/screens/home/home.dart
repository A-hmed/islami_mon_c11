import 'package:flutter/material.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/ahadeth/ahadeth.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/quran/quran.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/radio/app_radio.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/sebha/sebha.dart';
import 'package:islami_c11_mon/ui/screens/home/tabs/settings/settings.dart';
import 'package:islami_c11_mon/ui/utils/app_assets.dart';
import 'package:islami_c11_mon/ui/utils/extensions/build_context_extensions.dart';
import 'package:islami_c11_mon/ui/widgets/app_scaffold.dart';

import '../../utils/app_colors.dart';


class Home extends StatefulWidget {
  static const String routeName = "home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 4;
  List<Widget> tabs = [
    const Quran(),
    Ahadeth(),
    const Sebha(),
    const AppRadio(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: context.locale.islami,
      body: tabs[selectedTabIndex],
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Theme buildBottomNavigation() {
    return Theme(
      data: ThemeData(canvasColor: AppColors.primaryColor),
      child: BottomNavigationBar(
        onTap: (index) {
          selectedTabIndex = index;
          setState(() {});
        },
        currentIndex: selectedTabIndex,
        selectedItemColor: AppColors.accentColor,
        selectedIconTheme: const IconThemeData(size: 38),
        unselectedIconTheme: const IconThemeData(size: 34),
        items: [
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
              label: "Ahadeth"),
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
          const BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: context.locale.settings)
        ],
      ),
    );
  }
}