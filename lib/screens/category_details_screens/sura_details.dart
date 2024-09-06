import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/screens/item_sura_details.dart';
import 'package:islami_app/style/app_colors.dart';

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
    SuraDetailsArgs sura =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(sura.index);
    }
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_image.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Islami',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: const Color.fromARGB(200, 248, 248, 248),
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
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(
                  color: AppColors.primaryLightColor,
                  thickness: 2,
                ),
                (verses.isEmpty)
                    ? CircularProgressIndicator(
                        color: AppColors.primaryLightColor,
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
