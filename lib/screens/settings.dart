import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_language_provider.dart';
import 'package:islami_app/screens/language_bottom_sheet.dart';
import 'package:islami_app/screens/theme_bottom_sheet.dart';
import 'package:islami_app/style/app_colors.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_theme_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppConfigLanguageProvider>(context);
    var themeProvider = Provider.of<AppConfigThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: themeProvider.isDark()
                            ? AppColors.darkGoldColor
                            : AppColors.primaryLightColor,
                        width: MediaQuery.of(context).size.height * 0.003)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      langProvider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: themeProvider.isDark()
                          ? AppColors.darkGoldColor
                          : AppColors.primaryLightColor,
                      size: MediaQuery.of(context).size.height * 0.05,
                    )
                  ],
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: themeProvider.isDark()
                            ? AppColors.darkGoldColor
                            : AppColors.primaryLightColor,
                        width: MediaQuery.of(context).size.height * 0.003)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.isDark()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: themeProvider.isDark()
                          ? AppColors.darkGoldColor
                          : AppColors.primaryLightColor,
                      size: MediaQuery.of(context).size.height * 0.05,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
