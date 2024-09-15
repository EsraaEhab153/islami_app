import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_theme_provider.dart';
import '../style/app_colors.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
    return Container(
      color:
          provider.isDark() ? AppColors.primaryDarkColor : AppColors.whiteColor,
      height: MediaQuery.of(context).size.height * 0.25,
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
              // change theme to light
              provider.changeTheme(ThemeMode.light);
            },
            // light is selected
            child: provider.isDark()
                ? unSelectedItemWidget(AppLocalizations.of(context)!.light)
                : selectedItemWidget(
                    AppLocalizations.of(context)!.light, provider.isDark()),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
              onTap: () {
                //change theme to dark
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? selectedItemWidget(
                      AppLocalizations.of(context)!.dark, provider.isDark())
                  : unSelectedItemWidget(AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  Widget selectedItemWidget(String theme, bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          theme,
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

  Widget unSelectedItemWidget(String theme) {
    return Text(
      theme,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
