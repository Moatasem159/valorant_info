import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/build_agent_card.dart';
class AgentCard extends StatelessWidget {
  final Agent agent;
  const AgentCard({Key? key, required this.agent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BuildAgentCard(
        agentImage: agent.fullPortraitV2!,
        agentName: agent.displayName!,
        agentRole: agent.role!.displayName!,
        agentRoleImage: agent.role!.displayIcon!,);
  }
}