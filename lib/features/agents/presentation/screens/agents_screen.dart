import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_cubit.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_state.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_screen_loading_body.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_screen_body.dart';
class AgentsScreen extends StatelessWidget {
  const AgentsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsCubit, AgentsStates>(
      builder: (context, state){
        AgentsCubit cubit=BlocProvider.of<AgentsCubit>(context);
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
          return const AgentScreenLoadingBody();
        }
        return const AgentScreenLoadingBody();
      },
    );
  }
}