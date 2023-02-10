import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_cubit.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_list.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agents_screen_appbar.dart';
class AgentScreenBody extends StatelessWidget {
  final List<Agent> agents;
  const AgentScreenBody({Key? key, required this.agents}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body:CustomScrollView(
              controller: BlocProvider.of<AgentsCubit>(context).controller,
              physics: const BouncingScrollPhysics(),
              slivers: [
                const AgentScreenAppBar(),
                AgentsList(agents: agents)
              ],
            )
        ));
  }
}