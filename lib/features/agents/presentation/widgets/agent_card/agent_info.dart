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
        bottom: 0,
        left: AppLocalizations.of(context)!.isEnLocale
            ? MediaQuery.of(context).size.width - 180
            : MediaQuery.of(context).size.width - 130,
        top: MediaQuery.of(context).size.height/4.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Text(agent.displayName!,style:Theme.of(context).textTheme.labelMedium),
            const SizedBox(height:AppSize.s10,),
            Text(agent.role!.displayName!,style:Theme.of(context).textTheme.labelMedium),
            const SizedBox(height:AppSize.s10,),
            if(AppLocalizations.of(context)!.isEnLocale)
            Text(agent.developerName!,style:Theme.of(context).textTheme.labelMedium),
          ],
        ));
  }
}