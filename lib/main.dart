import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/providers/app_config_language_provider.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:islami_app/quran/sura_details.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:islami_app/style/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppConfigLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppConfigThemeProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var langProvider = Provider.of<AppConfigLanguageProvider>(context);
    var themeProvider = Provider.of<AppConfigThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(langProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: HomeScreen.routeName,
      theme: MyThemeData.lightModeStyle,
      darkTheme: MyThemeData.darkModeStyle,
      themeMode: themeProvider.appTheme,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
    );
  }
}
