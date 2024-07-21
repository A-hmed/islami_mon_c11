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
        buildHeaderImage(),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  buildDivider(),
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Sura name",
                        style: AppStyle.titlesTextStyle,
                        textAlign: TextAlign.center,
                      )),
                      Expanded(
                          child: Text(
                        "Verses",
                        textAlign: TextAlign.center,
                        style: AppStyle.titlesTextStyle,
                      ))
                    ],
                  ),
                  buildDivider(),
                  buildSurasList()
                ],
              ),
              VerticalDivider(
                color: AppColors.primary,
                thickness: 3,
                indent: 10,
              )
            ],
          ),
        )
      ],
    );
  }

  Expanded buildSurasList() => Expanded(
        flex: 7,
        child: ListView.builder(
            itemCount: Constants.suraNames.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                      child: Text(
                    Constants.suraNames[index],
                    style: AppStyle.titlesTextStyle,
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    Constants.versesNumber[index].toString(),
                    textAlign: TextAlign.center,
                    style: AppStyle.titlesTextStyle,
                  ))
                ],
              );
            }),
      );

  Divider buildDivider() =>
      const Divider(color: AppColors.primary, thickness: 3);

  Expanded buildHeaderImage() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AppAssets.quranTabLogo,
        ),
      ),
    );
  }
}
