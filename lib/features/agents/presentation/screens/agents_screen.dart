import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/widgets/loading_body.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_cubit.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_state.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_screen_body.dart';
class AgentsScreen extends StatelessWidget {
  const AgentsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AgentsCubit cubit=AgentsCubit.get(context);
        cubit.getAgents(AppLocalizations.of(context)!.getLang());
        return BlocBuilder<AgentsCubit, AgentsStates>(
          builder: (context, state){
            if(state is GetAgentsSuccessState)
            {
              if(cubit.isAll){
                return AgentScreenBody(agents:cubit.agents);
              }
              if(!cubit.isAll){
                  return AgentScreenBody(agents:cubit.roleAgents);
                }
            }
            if(state is GetAgentsLoadingState)
            {
              return const LoadingBody();
            }
            return const LoadingBody();
          },
        );
      }
    );
  }
}