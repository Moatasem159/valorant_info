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
  Future<Either<Failure, List<Agent>>> getAgents(String lang) async{
   List<Agent> cachedAgents=await _agentLocalDataSource.getAgentsFromSharedPref(lang);
   if(cachedAgents.isNotEmpty)
     {
       return right(cachedAgents);
     }
   else
   {
     if(await _networkInfo.isConnected)
       {
         try{
           final List<Agent> result=await _agentsRemoteDataSource.getAgents(lang);
           _agentLocalDataSource.saveAgentsInSharedPref(agents:result,lang: lang);
           return Right(result);
         }on ServerException catch (failure) {
           return Left(ServerFailure(failure.message!));
         }
       }
     else
     {
       return left(const ServerFailure(AppStrings.noInternetConnection));
     }
   }
  }
}