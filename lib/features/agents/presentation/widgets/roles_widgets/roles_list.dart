import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/utils/app_constants.dart';
import 'package:valorant_info/core/utils/app_size.dart';
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
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              RoleWidget(
                onTap: () => cubit.changeButton(0),
                role: Constants.allAgents,
                isSelected: cubit.selectedButton[0],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(1, role: Constants.duelist),
                role: Constants.duelist,
                isSelected: cubit.selectedButton[1],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(2, role: Constants.initiator),
                role: Constants.initiator,
                isSelected: cubit.selectedButton[2],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(3, role: Constants.controller),
                role: Constants.controller,
                isSelected: cubit.selectedButton[3],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(4, role: Constants.sentinel),
                role: Constants.sentinel,
                isSelected: cubit.selectedButton[4],
              ),
            ],
          ),
        );
      },
    );
  }
}