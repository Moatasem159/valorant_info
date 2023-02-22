import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_details_screen_widgets/agent_description_widgets/information_widget.dart';
class AgentData extends StatelessWidget {
  final Agent agent;
  const AgentData({super.key,required this.agent,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InformationWidget(title:AppStrings.agent.tr(context)!,info: agent.displayName!,),
            InformationWidget(title:AppStrings.role.tr(context)!,info: agent.role!.displayName! ),
          ],
        ),
        const SizedBox(height: AppSize.s15),
        Center(
          child:
          InformationWidget(title:AppStrings.developerName.tr(context)!,info: agent.developerName!,),
        ),
      ],
    );
  }
}