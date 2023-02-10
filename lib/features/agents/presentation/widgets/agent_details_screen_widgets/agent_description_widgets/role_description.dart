import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/role_image.dart';
class RoleDescription extends StatelessWidget {
  final Agent agent;
  const RoleDescription({super.key, required this.agent,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: RoleImage(role:agent.role!,agentId: agent.agentId!,)),
        const SizedBox(height: AppSize.s10),
        Text(
          agent.role!.displayName!,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(
              color: Colors.white,
              fontSize: FontSize.s20,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSize.s10),
        Text(
          agent.role!.description!,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(
              color: Colors.white,
              fontSize: FontSize.s14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height:AppSize.s15),
      ],
    );
  }
}