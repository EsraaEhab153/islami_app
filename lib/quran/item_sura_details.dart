import 'package:flutter/material.dart';

class ItemSuraDetailes extends StatelessWidget {
  final String content;

  const ItemSuraDetailes({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
