import 'package:flutter/material.dart';

class ItemHadethDetailes extends StatelessWidget {
  final String content;

  const ItemHadethDetailes({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.center,
    );
  }
}
