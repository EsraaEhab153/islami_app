import 'package:flutter/material.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({
    super.key,
    required this.hadeth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: Hadeth(title: hadeth.title, content: hadeth.content));
      },
      child: Text(
        hadeth.title,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
