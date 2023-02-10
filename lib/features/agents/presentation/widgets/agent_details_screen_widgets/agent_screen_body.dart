import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_details_screen_widgets/build_agent_screen_body.dart';
class AgentScreenBody extends StatelessWidget {
  final Agent agent;
  const AgentScreenBody({super.key, required this.agent});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BuildAgentScreenBody(agent: agent),
        ),
      ),
    );
  }
}
