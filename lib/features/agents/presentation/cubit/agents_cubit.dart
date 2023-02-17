import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/domain/usecases/get_agents_usecase.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_state.dart';
class AgentsCubit extends Cubit<AgentsStates> {
  AgentsCubit({required this.getAgentsUseCase}) : super(AgentsInitialState());
  GetAgentsUseCase getAgentsUseCase;
  static get(context)=>BlocProvider.of<AgentsCubit>(context);
  late List<Agent>agents;
  late List<Agent> roleAgents;
  bool isAll=true;
  Future<void> getAgents()async {
    emit(GetAgentsLoadingState());
    Either<Failure,List<Agent>> response=await getAgentsUseCase.call();
    emit(response.fold((l){
      return GetAgentsErrorState();
    }, (networkAgents){
      agents=[];
      agents=networkAgents;
      agents.sort((a, b) => a.displayName!.compareTo(b.displayName!));
     return GetAgentsSuccessState();
    }));
  }
  List<bool> selectedButton=[true,false,false,false,false];
  ScrollController controller=ScrollController();
  changeButton(index, {role}){
    for(int i=0;i<selectedButton.length;i++)
    {
      selectedButton[i]=false;
    }
    selectedButton[index]=true;
    if(index==0)
    {
     getAllAgents();
    }
    if(index!=0)
    {
      getRoleAgents(role: role);
    }
    controller.animateTo(0, duration: const Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
  }
  getRoleAgents({required String role}){
    isAll=false;
    emit(GetAgentsLoadingState());
    roleAgents=[];
    for (var element in agents) {
      if (element.role!.displayName == role) {
        roleAgents.add(element);
      }
    }
    emit(GetAgentsSuccessState());
  }
  getAllAgents(){
    emit(GetAgentsLoadingState());
    isAll=true;
    emit(GetAgentsSuccessState());
  }
}