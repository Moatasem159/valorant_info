import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              RoleWidget(
                onTap: () => cubit.changeButton(0),
                role: "All",
                isSelected: cubit.selectedButton[0],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(1, role: "Duelist"),
                role: "Duelist",
                isSelected: cubit.selectedButton[1],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(2, role: "Initiator"),
                role: "Initiator",
                isSelected: cubit.selectedButton[2],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(3, role: "Controller"),
                role: "Controller",
                isSelected: cubit.selectedButton[3],
              ),
              RoleWidget(
                onTap: () => cubit.changeButton(4, role: "Sentinel"),
                role: "Sentinel",
                isSelected: cubit.selectedButton[4],
              ),
            ],
          ),
        );
      },
    );
  }
}