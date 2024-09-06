import 'package:flutter/material.dart';
import 'package:islami_app/screens/category_details_screens/sura_details.dart';

class ItemSuraName extends StatelessWidget {
  final String suraName;
  final int verses;
  final int index;

  const ItemSuraName(
      {super.key,
      required this.suraName,
      required this.verses,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(suraName: suraName, index: index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            suraName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '$verses',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
