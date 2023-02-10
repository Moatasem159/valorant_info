import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
class AgentInfo extends StatelessWidget {
  final String name;
  final String developerName;
  final String role;
  const AgentInfo({Key? key, required this.name, required this.role, required this.developerName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 0,
        left: 180,
        top: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Text(name,style:Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: AppSize.s5,),
            Text(role,style:Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: AppSize.s5,),
            Text(developerName,style:Theme.of(context).textTheme.labelMedium),
          ],
        ));
  }
}