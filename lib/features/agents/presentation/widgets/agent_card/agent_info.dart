import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
class AgentInfo extends StatelessWidget {
  final Agent agent;
  const AgentInfo({Key? key, required this.agent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: !AppLocalizations.of(context)!.isEnLocale?120:0,
        bottom: 0,
        left: AppLocalizations.of(context)!.isEnLocale?180:0,
        top: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Text(agent.displayName!,style:Theme.of(context).textTheme.labelMedium),
            const SizedBox(height:AppSize.s10,),
            Text(agent.role!.displayName!,style:Theme.of(context).textTheme.labelMedium),
            const SizedBox(height:AppSize.s10,),
            Text(agent.developerName!,style:Theme.of(context).textTheme.labelMedium),
          ],
        ));
  }
}