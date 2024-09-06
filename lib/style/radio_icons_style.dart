import 'package:flutter/material.dart';

import 'app_colors.dart';

class RadioIconStyle extends StatelessWidget {
  final IconData icon;

  const RadioIconStyle({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon,
        color: AppColors.primaryLightColor,
        size: MediaQuery.of(context).size.height * 0.04);
  }
}
