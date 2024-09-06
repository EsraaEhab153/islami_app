import 'package:flutter/material.dart';
import 'package:islami_app/modules/radio_icons_style.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset('assets/images/radio_logo.png')),
        Expanded(
          child: Column(
            children: [
              Text('اذاعة القران الكريم',
                  style: Theme.of(context).textTheme.bodyMedium),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.06),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RadioIconStyle(icon: Icons.skip_previous),
                    RadioIconStyle(icon: Icons.play_arrow),
                    RadioIconStyle(icon: Icons.skip_next),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
