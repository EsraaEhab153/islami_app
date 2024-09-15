import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:provider/provider.dart';

import '../style/app_colors.dart';

class ItemHadethDetailes extends StatelessWidget {
  final String content;

  const ItemHadethDetailes({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
    return Text(
      content,
      textAlign: TextAlign.center,
      style: TextStyle(
        color:
            provider.isDark() ? AppColors.darkGoldColor : AppColors.blackColor,
      ),
    );
  }
}
