import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';
import 'package:valorant_info/core/utils/app_constants.dart';
import 'package:valorant_info/features/agents/data/models/agent_model.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
abstract class AgentLocalDataSource{
  Future<void> saveAgentsInSharedPref({required List<Agent> agents});
  Future<List<Agent>> getAgentsFromSharedPref();
}
class AgentLocalDataSourceImpl implements AgentLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesManager;
  AgentLocalDataSourceImpl(this._sharedPrefrencesManager);
  @override
  Future<void> saveAgentsInSharedPref({required List<Agent> agents})async{
    final String decodedAgents=AgentModel.encode(agents as List<AgentModel>);
    _sharedPrefrencesManager.saveData(key: Constants.allAgents, value: decodedAgents);
    _sharedPrefrencesManager.saveData(key: "time", value: DateTime.now().toIso8601String());
  }
  @override
  Future<List<Agent>> getAgentsFromSharedPref() async{
    late List<Agent> agents;
    final String agentString = await _sharedPrefrencesManager.getData(key: Constants.allAgents)??'';
    final String time = await _sharedPrefrencesManager.getData(key: "time");
    if(agentString.isNotEmpty)
    {
      if(DateTime.now().difference(DateTime.parse(time)).inDays>50){
        _sharedPrefrencesManager.clear(key: Constants.allAgents);
        agents=[];
        return agents;
      }
      else{
        agents=[];
        agents=AgentModel.decode(agentString);
        return agents;
      }
    }
    else{
      agents=[];
      return agents;
    }
  }
}