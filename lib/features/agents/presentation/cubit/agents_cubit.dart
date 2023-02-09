import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/domain/usecases/get_agents_usecase.dart';
import 'package:valorant_info/features/agents/presentation/cubit/agents_state.dart';

class AgentsCubit extends Cubit<AgentsStates> {
  AgentsCubit({required this.getAgentsUseCase}) : super(AgentsInitialState());

  GetAgentsUseCase getAgentsUseCase;
  List<Agent>?agents;
  Future<void> getAgents()async {
    emit(GetAgentsLoadingState());
    Either<Failure,List<Agent>> response=await getAgentsUseCase.call();
    emit(response.fold((l){
      return GetAgentsErrorState();
    }, (networkAgents){
      agents=[];
      agents=networkAgents;
     return GetAgentsSuccessState();
    }));
  }
}
