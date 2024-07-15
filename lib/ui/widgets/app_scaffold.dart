import 'package:flutter/material.dart';
import 'package:islami_c11_mon/ui/utils/app_style.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final String? appBarTitle;
  final Widget? bottomNavigationBar;

  const AppScaffold(
      {super.key, this.body, this.appBarTitle, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.lightBackground))),
      child: Scaffold(
        body: body,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: Text(
            appBarTitle ?? "",
            style: AppStyle.appBarStyle,
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.transparent,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
