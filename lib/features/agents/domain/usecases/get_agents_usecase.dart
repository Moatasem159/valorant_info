import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
import 'package:valorant_info/features/agents/domain/repositories/agents_repository.dart';
class GetAgentsUseCase{
  final AgentsRepository _agentsRepository;
  GetAgentsUseCase(this._agentsRepository);
  Future<Either<Failure, List<Agent>>> call()async {
    return await _agentsRepository.getAgents();
  }
}