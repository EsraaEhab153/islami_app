import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/hadeth/item_hadeth_name.dart';
import 'package:islami_app/providers/app_config_theme_provider.dart';
import 'package:provider/provider.dart';

import '../style/app_colors.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> oneHadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigThemeProvider>(context);
    loadHadeth();
    return Column(
      children: [
        Expanded(
          child: Image.asset('assets/images/hadeth_logo.png'),
        ),
        Divider(
          color: provider.isDark()
              ? AppColors.darkGoldColor
              : AppColors.primaryLightColor,
          thickness: 2,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(
          color: provider.isDark()
              ? AppColors.darkGoldColor
              : AppColors.primaryLightColor,
          thickness: 2,
        ),
        Expanded(
            flex: 2,
            child: (oneHadeth.isEmpty)
                ? CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemHadethName(
                        hadeth: oneHadeth[index],
                      );
                    },
                    itemCount: oneHadeth.length,
                  ))
      ],
    );
  }

  void loadHadeth() async {
    String hadeth = await rootBundle.loadString('assets/ahadeth/ahadeth.txt');
    List<String> ahadeth = hadeth.split('#\r\n');
    for (int i = 0; i < ahadeth.length; i++) {
      List<String> hadethLines = ahadeth[i].split('\n');
      String hadethtitle = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: hadethtitle, content: hadethLines);
      oneHadeth.add(hadeth);
      setState(() {});
    }
  }
}
