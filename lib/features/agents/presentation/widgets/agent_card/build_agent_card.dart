import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_info/config/routes/app_routes.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/agent_image.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/agent_info.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/custom_card.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/role_image.dart';
class BuildAgentCard extends StatelessWidget {
  final Agent agent;
  const BuildAgentCard({Key? key, required this.agent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).pushNamed(Routes.agentDetailsRoute, extra: agent);
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.s8),
        child: Stack(
          children: [
            const CustomCard(),
            AgentImage(image: agent.fullPortraitV2!, id: agent.agentId!),
            AgentInfo(agent: agent),
            Positioned(
                right: 0,
                bottom: 0,
                child: RoleImage(role: agent.role!,agentId: agent.agentId!,))
          ],
        ),
      ),
    );
  }
}
