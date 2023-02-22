import 'package:valorant_info/core/api/api_consumer.dart';
import 'package:valorant_info/core/api/end_points.dart';
import 'package:valorant_info/features/agents/data/models/agent_model.dart';
abstract class AgentsRemoteDataSource{
  Future<List<AgentModel>> getAgents(String lang);
}
class AgentsRemoteDataSourceImpl implements AgentsRemoteDataSource{
  final ApiConsumer _apiConsumer;
  AgentsRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<AgentModel>> getAgents(String lang)async{
    final response=await _apiConsumer.get(EndPoints.agentsUrl(lang));
    return List<AgentModel>.from(
      (response['data'] as List).map(
            (x) => AgentModel.fromJson(x),
      ),
    );
  }
}