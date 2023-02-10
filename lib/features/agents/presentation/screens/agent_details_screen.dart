import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_details_screen_widgets/agent_screen_body.dart';
class AgentDetailsScreen extends StatelessWidget {
  final Agent agent;
  const AgentDetailsScreen({Key? key, required this.agent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AgentScreenBody(agent: agent);
  }
}