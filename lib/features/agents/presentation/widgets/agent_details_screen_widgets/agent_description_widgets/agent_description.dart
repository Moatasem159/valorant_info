import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/font_size.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_details_screen_widgets/agent_description_widgets/agent_data.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_details_screen_widgets/agent_description_widgets/role_description.dart';
class AgentDescription extends StatelessWidget {
  final Agent agent;
  const AgentDescription({super.key,required this.agent});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.s8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AgentData(agent:agent),
          const SizedBox(height:AppSize.s10),
          RoleDescription(agent: agent),
          Text(
            agent.description!,
            style:
            Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Colors.white,
              fontSize: FontSize.s16,
            ),
          ),
        ],
      ),
    );
  }
}

