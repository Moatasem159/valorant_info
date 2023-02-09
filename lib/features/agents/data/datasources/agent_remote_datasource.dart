import 'package:valorant_info/core/api/api_consumer.dart';
import 'package:valorant_info/core/api/end_points.dart';
import 'package:valorant_info/features/agents/data/models/agent_model.dart';

abstract class AgentsRemoteDataSource{
  Future<List<AgentModel>> getAgents();
}
class AgentsRemoteDataSourceImpl implements AgentsRemoteDataSource{
  final ApiConsumer apiConsumer;
  AgentsRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<List<AgentModel>> getAgents()async{
    final response=await apiConsumer.get(EndPoints.agentsUrl);
    return List<AgentModel>.from(
      (response['data'] as List).map(
            (x) => AgentModel.fromJson(x),
      ),
    );
  }
}