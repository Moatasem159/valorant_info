import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/agent_card.dart';

class AgentsList extends StatefulWidget {
  final List<Agent> agents;

  const AgentsList({Key? key, required this.agents}) : super(key: key);

  @override
  State<AgentsList> createState() => _AgentsListState();
}

class _AgentsListState extends State<AgentsList> {

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.agents.length,
        itemBuilder: (context, index) {
          return AgentCard(agent: widget.agents[index],);
        },),
    );
  }
}
