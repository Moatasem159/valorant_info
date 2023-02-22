import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/font_size.dart';

class WeaponRowDetails extends StatelessWidget {
  final String title;
  final String infoNum;
  final String info;
  final bool isEven;

  const WeaponRowDetails(
      {super.key,
        required this.title,
        this.info = "",
        required this.isEven,
        this.infoNum = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment:AppLocalizations.of(context)!.isEnLocale?
            Alignment.centerLeft:Alignment.centerRight,
            height: 35,
            padding: const EdgeInsets.all(AppPadding.s5),
            color: isEven ? Theme.of(context).primaryColor : Colors.red,
            child: Text(
              title,

              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(
                  fontSize: FontSize.s16,
                  color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 35,
            alignment:AppLocalizations.of(context)!.isEnLocale?
            Alignment.centerLeft:Alignment.centerRight,
            padding: const EdgeInsets.all(AppPadding.s5),
            color: isEven ? Colors.red : Theme.of(context).primaryColor,
            child: Text(
              infoNum == '' ? info.substring(info.indexOf("::") + 2) : infoNum,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: FontSize.s16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}