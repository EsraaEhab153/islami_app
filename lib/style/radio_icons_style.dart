import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart';

class RadioIconStyle extends StatelessWidget {
  final IconData icon;

  const RadioIconStyle({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
    return Icon(icon,
        color: provider.isDark()
            ? AppColors.darkGoldColor
            : AppColors.primaryLightColor,
        size: MediaQuery.of(context).size.height * 0.04);
  }
}
