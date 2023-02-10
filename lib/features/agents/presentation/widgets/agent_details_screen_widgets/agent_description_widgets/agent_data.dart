import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_constants.dart';
import 'package:valorant_info/core/utils/app_size.dart';
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
            InformationWidget(title:Constants.agent,info: agent.displayName!, ),
            InformationWidget(title:Constants.role,info: agent.role!.displayName! ),
          ],
        ),
        const SizedBox(height: AppSize.s15),
        Center(
          child:
          InformationWidget(title:Constants.developerName,info: agent.developerName!,),
        ),
      ],
    );
  }
}