import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/ability_widgets/ability_list.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_details_screen_widgets/agent_description_widgets/agent_description.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_details_screen_widgets/agent_profile.dart';
class BuildAgentScreenBody extends StatelessWidget {
  final Agent agent;
  const BuildAgentScreenBody({super.key,required this.agent});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AgentProfile(agent: agent),
        AgentDescription(agent: agent),
        AbilitiesList(abilities:agent.abilities!),
      ],
    );
  }
}