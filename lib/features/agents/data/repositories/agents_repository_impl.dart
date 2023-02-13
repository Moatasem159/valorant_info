import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/exceptions.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/core/network/network_info.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/agents/data/datasources/agent_remote_datasource.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/domain/repositories/agents_repository.dart';
class AgentRepositoryImpl implements AgentsRepository{
  final AgentsRemoteDataSource _agentsRemoteDataSource;
  final NetworkInfo _networkInfo;
  AgentRepositoryImpl(this._agentsRemoteDataSource,this._networkInfo);
  @override
  Future<Either<Failure, List<Agent>>> getAgents() async{
   if(await _networkInfo.isConnected) {
     try{
       final List<Agent> result=await _agentsRemoteDataSource.getAgents();
       return Right(result);
     }on ServerException catch (failure) {
       return Left(ServerFailure(failure.message!));
     }
   }
   else{
     return left(const ServerFailure(AppStrings.noInternetConnection));
   }
  }
}