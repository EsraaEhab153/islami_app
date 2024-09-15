import 'package:flutter/material.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:islami_app/style/app_colors.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double turns = 0.0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله'
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.46,
                  right: MediaQuery.of(context).size.width * 0.36,
                ),
                child: Image.asset(
                  provider.isDark()
                      ? 'assets/images/sebha_head_dark.png'
                      : 'assets/images/sebha_head_logo.png',
                  width: MediaQuery.of(context).size.width * 0.177,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09),
                child: InkWell(
                  onTap: () {
                    turns += 1 / 33;
                    counter++;
                    if (counter == 34) {
                      counter = 0;
                      index++;
                      if (index == azkar.length) {
                        index = 0;
                      }
                    }
                    setState(() {});
                  },
                  child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(milliseconds: 200),
                    child: Image.asset(
                      provider.isDark()
                          ? 'assets/images/sebha_body_dark.png'
                          : 'assets/images/sebha_body_light.png',
                      width: MediaQuery.of(context).size.height * 0.56,
                      height: MediaQuery.of(context).size.height * 0.30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.03),
            width: MediaQuery.of(context).size.width * 0.16,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
              color: provider.isDark()
                  ? AppColors.primaryDarkColor
                  : AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(child: Text('$counter')),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.06,
            decoration: BoxDecoration(
              color: provider.isDark()
                  ? AppColors.darkGoldColor
                  : AppColors.primaryLightColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
                child: Text(
              '${azkar[index]}',
              style: TextStyle(
                  color: provider.isDark()
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                  fontSize: 24.0),
            )),
          ),
        ],
      ),
    );
  }
}
