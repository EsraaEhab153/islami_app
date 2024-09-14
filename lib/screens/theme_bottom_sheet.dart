import 'package:flutter/material.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<AppConfigLanguageProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                // change language to english
                //provider.changeLanguage('en');
              },
              // english is selected
              child: Text('Light')),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
              onTap: () {
                //change language to arabic
                //provider.changeLanguage('ar');
              },
              child: Text('Dark')),
        ],
      ),
    );
  }

// Widget selectedItemWidget(String lang){
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         lang,
//         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//             color: AppColors.primaryLightColor
//         ),
//       ),
//       Icon(
//         Icons.check,
//         size: MediaQuery.of(context).size.height * 0.035,
//         color: AppColors.primaryLightColor,
//       )
//     ],
//   );
// }
//
// Widget unSelectedItemWidget(String lang){
//   return Text(
//     lang,
//     style: Theme.of(context).textTheme.bodyMedium,
//   );
// }
}
