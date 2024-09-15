import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:islami_app/quran/item_sura_details.dart';
import 'package:islami_app/style/app_colors.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
    SuraDetailsArgs sura =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(sura.index);
    }
    return Stack(
      children: [
        Image.asset(
          provider.isDark()
              ? 'assets/images/dark_background.png'
              : 'assets/images/background_image.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          body: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: provider.isDark()
                  ? AppColors.primaryDarkColor
                  : const Color.fromARGB(200, 248, 248, 248),
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                width: 0.5,
                color: const Color(0xd8707070),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'سورة ${sura.suraName}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: provider.isDark()
                          ? AppColors.darkGoldColor
                          : AppColors.blackColor),
                ),
                Divider(
                  color: provider.isDark()
                      ? AppColors.darkGoldColor
                      : AppColors.primaryLightColor,
                  thickness: 2,
                ),
                (verses.isEmpty)
                    ? CircularProgressIndicator(
                        color: provider.isDark()
                            ? AppColors.darkGoldColor
                            : AppColors.primaryLightColor,
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ItemSuraDetailes(
                                content: '${verses[index]}(${index + 1})');
                          },
                          itemCount: verses.length,
                        ),
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/quran_files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs({
    required this.suraName,
    required this.index,
  });
}
