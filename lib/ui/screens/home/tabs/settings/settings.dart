import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c11_mon/ui/providers/language_provider.dart';
import 'package:islami_c11_mon/ui/utils/app_colors.dart';
import 'package:islami_c11_mon/ui/utils/app_style.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkThemeEnabled = false;
  late LanguageProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: AppStyle.titlesTextStyle,
          ),
          buildLanguageDropdown(),
          buildThemeSwitch(),
        ],
      ),
    );
  }

  Widget buildLanguageDropdown() => DropdownButton(
          value: provider.locale,
          isExpanded: true,
          onChanged: (value) {
            provider.locale = value ?? provider.locale;
            provider.notifyListeners();
            setState(() {});
          },
          items: const [
            DropdownMenuItem(
              value: "ar",
              child: Text("العربيه"),
            ),
            DropdownMenuItem(value: "en", child: Text("English")),
          ]);

  buildThemeSwitch() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: AppStyle.titlesTextStyle,
          ),
          Switch(
              value: isDarkThemeEnabled,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                isDarkThemeEnabled = value;
                setState(() {});
              }),
        ],
      );
}
