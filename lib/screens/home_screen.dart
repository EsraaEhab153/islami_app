import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:islami_app/quran/quran_tab.dart';
import 'package:islami_app/screens/radio_tab.dart';
import 'package:islami_app/screens/sebha_tab.dart';
import 'package:islami_app/screens/settings.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIcon = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
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
            title: Text(
              AppLocalizations.of(context)!.app_title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIcon,
              onTap: (index) {
                selectedIcon = index;
                setState(() {});
              },
              backgroundColor: Theme.of(context).primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/icon_quran.png'),
                  ),
                  label: AppLocalizations.of(context)!.quran_tab,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png'),
                  ),
                  label: AppLocalizations.of(context)!.hadeth_tab,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/icon_sebha.png'),
                  ),
                  label: AppLocalizations.of(context)!.sebha_tab,
                ),
                BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/images/icon_radio.png'),
                  ),
                  label: AppLocalizations.of(context)!.radio_tab,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings_tab,
                ),
              ],
            ),
          ),
          body: tabs[selectedIcon],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
}
