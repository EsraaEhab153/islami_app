import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import 'item_hadeth_details.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'hadeth_details';

  HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Hadeth args = ModalRoute.of(context)?.settings.arguments as Hadeth;
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
                  '${args.title}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(
                  color: AppColors.primaryLightColor,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ItemHadethDetailes(content: args.content[index]);
                    },
                    itemCount: args.content.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
