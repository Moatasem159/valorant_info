import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/exceptions.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/core/network/network_info.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/agents/data/datasources/agent_local_datasource.dart';
import 'package:valorant_info/features/agents/data/datasources/agent_remote_datasource.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/domain/repositories/agents_repository.dart';
class AgentRepositoryImpl implements AgentsRepository{
  final AgentsRemoteDataSource _agentsRemoteDataSource;
  final AgentLocalDataSource _agentLocalDataSource;
  final NetworkInfo _networkInfo;
  AgentRepositoryImpl(this._agentsRemoteDataSource,this._networkInfo, this._agentLocalDataSource);
  @override
  Future<Either<Failure, List<Agent>>> getAgents() async{
   List<Agent> cachedAgents=await _agentLocalDataSource.getAgentsFromSharedPref();
   if(await _networkInfo.isConnected){
     if(cachedAgents.isNotEmpty)
       {
         return right(cachedAgents);
       }
     else {
       try{
       final List<Agent> result=await _agentsRemoteDataSource.getAgents();
       _agentLocalDataSource.saveAgentsInSharedPref(agents:result);
       return Right(result);
     }on ServerException catch (failure) {
       return Left(ServerFailure(failure.message!));
     }
     }
   }
   else{
     if(cachedAgents.isNotEmpty)
       {
         return right(cachedAgents);
       }
     else {
       return left(const ServerFailure(AppStrings.noInternetConnection));
     }
   }
  }
}