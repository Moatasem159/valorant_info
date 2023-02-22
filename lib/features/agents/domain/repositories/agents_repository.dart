import 'package:valorant_info/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';

abstract class AgentsRepository{
  Future<Either<Failure,List<Agent>>> getAgents(String lang);
}