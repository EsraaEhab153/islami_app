import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:islami_app/style/app_colors.dart';
import 'package:provider/provider.dart';

class ItemSuraDetailes extends StatelessWidget {
  final String content;

  const ItemSuraDetailes({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
    return Text(
      content,
      style: TextStyle(
          color: provider.isDark()
              ? AppColors.darkGoldColor
              : AppColors.blackColor),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
