import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
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
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: SizedBox(
        height: AppSize.s250,
        width: AppSize.s400,
        child: Stack(
          children: [
            const CustomCard(),
            AgentImage(image: agent.fullPortraitV2!),
            AgentInfo(
              name: agent.displayName!,
              role: agent.role!.displayName!,
              developerName: agent.developerName!,
            ),
            RoleImage(image: agent.role!.displayIcon!)
          ],
        ),
      ),
    );
  }
}
