import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/font_size.dart';
class InformationWidget extends StatelessWidget {
  final String title;
  final String info;
  const InformationWidget({super.key, required this.title, required this.info,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(
              color: Colors.white,
              fontSize: FontSize.s20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSize.s10),
        Text(
          info,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(
              color: Colors.white,
              fontSize: FontSize.s18,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}