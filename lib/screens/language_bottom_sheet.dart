import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_language_provider.dart';
import 'package:islami_app/style/app_colors.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_theme_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppConfigLanguageProvider>(context);
    var themeProvider = Provider.of<AppConfigThemeProvider>(context);
    return Container(
      color: themeProvider.isDark()
          ? AppColors.primaryDarkColor
          : AppColors.whiteColor,
      height: MediaQuery.of(context).size.height * 0.25,
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                // change language to english
                langProvider.changeLanguage('en');
              },
              // english is selected
              child: langProvider.appLanguage == 'en'
                  ? selectedItemWidget(AppLocalizations.of(context)!.english,
                      themeProvider.isDark())
                  : unSelectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
            onTap: () {
              //change language to arabic
              langProvider.changeLanguage('ar');
            },
            child: langProvider.appLanguage == 'ar'
                ? selectedItemWidget(AppLocalizations.of(context)!.arabic,
                    themeProvider.isDark())
                : unSelectedItemWidget(AppLocalizations.of(context)!.arabic),
          ),
        ],
      ),
    );
  }

  Widget selectedItemWidget(String lang, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lang,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark
                  ? AppColors.darkGoldColor
                  : AppColors.primaryLightColor),
        ),
        Icon(
          Icons.check,
          size: MediaQuery.of(context).size.height * 0.035,
          color: isDark ? AppColors.darkGoldColor : AppColors.primaryLightColor,
        )
      ],
    );
  }

  Widget unSelectedItemWidget(String lang) {
    return Text(
      lang,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
