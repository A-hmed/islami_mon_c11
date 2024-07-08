import 'package:flutter/material.dart';
import 'package:islami_c11_mon/ui/utils/app_assets.dart';
import 'package:islami_c11_mon/ui/utils/app_colors.dart';
import 'package:islami_c11_mon/ui/utils/app_style.dart';
import 'package:islami_c11_mon/ui/utils/constants.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 3,
            child: Image.asset(
              AppAssets.quranTabLogo,
            )),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    height: 3,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Name",
                          textAlign: TextAlign.center,
                          style: AppStyle.titlesTextStyle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Verses",
                          textAlign: TextAlign.center,
                          style: AppStyle.titlesTextStyle,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(
                    height: 3,
                    thickness: 3,
                    color: AppColors.primaryColor,
                  ),
                  Expanded(child: buildSurasList()),
                ],
              ),
              VerticalDivider(thickness: 3, color: AppColors.primaryColor,)
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSurasList() => ListView.builder(
      itemCount: Constants.suraNames.length,
      itemBuilder: (context, index) => Row(
            children: [
              Expanded(
                  child: Text(
                Constants.suraNames[index],
                textAlign: TextAlign.center,
                style: AppStyle.titlesTextStyle,
              )),
              Expanded(
                  child: Text(
                Constants.versesNumber[index].toString(),
                textAlign: TextAlign.center,
                style: AppStyle.titlesTextStyle,
              ))
            ],
          ));
}
