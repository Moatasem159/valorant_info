import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/build_agent_card.dart';
class AgentCard extends StatelessWidget {
  const AgentCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const BuildAgentCard(
        agentImage: "https://media.valorant-api.com/agents/5f8d3a7f-467b-97f3-062c-13acf203c006/fullportrait.png",
        agentName: "Breach",
        agentRole: "Initiator",
        agentRoleImage: "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png",);
  }
}