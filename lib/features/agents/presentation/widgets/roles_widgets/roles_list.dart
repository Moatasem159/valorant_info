import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_cubit.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_state.dart';
import 'package:valorant_info/features/agents/presentation/widgets/roles_widgets/role_widget.dart';
class RolesList extends StatelessWidget {
  const RolesList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsCubit, AgentsStates>(
      builder: (context, state) {
        AgentsCubit cubit=BlocProvider.of<AgentsCubit>(context);
        return SizedBox(
          height: AppSize.s50,
          child: ListView(
            padding: !AppLocalizations.of(context)!.isEnLocale
                ? EdgeInsets.only(right: MediaQuery.of(context).size.width/6)
                : EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              RoleWidget(
                onTap: () => cubit.changeButton(0),
                role: AppStrings.allAgents.tr(context)!,
                isSelected: cubit.selectedButton[0],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(1, role: AppStrings.duelist.tr(context)!),
                role: AppStrings.duelist.tr(context)!,
                isSelected: cubit.selectedButton[1],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(2, role: AppStrings.initiator.tr(context)!),
                role: AppStrings.initiator.tr(context)!,
                isSelected: cubit.selectedButton[2],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(3, role: AppStrings.controller.tr(context)!),
                role: AppStrings.controller.tr(context)!,
                isSelected: cubit.selectedButton[3],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(4, role: AppStrings.sentinel.tr(context)!),
                role: AppStrings.sentinel.tr(context)!,
                isSelected: cubit.selectedButton[4],
              ),
            ],
          ),
        );
      },
    );
  }
}