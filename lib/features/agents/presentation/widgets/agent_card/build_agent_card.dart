import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/agent_image.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/agent_info.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/custom_card.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/role_image.dart';
class BuildAgentCard extends StatelessWidget {
  final String agentImage;
  final String agentName;
  final String agentRole;
  final String agentRoleImage;
  const BuildAgentCard({Key? key, required this.agentImage, required this.agentName, required this.agentRole, required this.agentRoleImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.s8),
      child: SizedBox(
        height:AppSize.s250,
        width: AppSize.s400,
        child: Stack(
          children:  [
            const CustomCard(),
            AgentImage(image: agentImage),
            AgentInfo(name: agentName,role: agentRole),
            RoleImage(image: agentRoleImage)
          ],
        ),
      ),
    );
  }
}