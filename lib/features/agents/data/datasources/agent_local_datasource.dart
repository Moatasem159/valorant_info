import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/agents/data/models/agent_model.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
abstract class AgentLocalDataSource{
  Future<void> saveAgentsInSharedPref({required List<Agent> agents,required String lang});
  Future<List<Agent>> getAgentsFromSharedPref(String lang);
}
class AgentLocalDataSourceImpl implements AgentLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesManager;
  AgentLocalDataSourceImpl(this._sharedPrefrencesManager);
  @override
  Future<void> saveAgentsInSharedPref({required List<Agent> agents,required String lang})async{
    final String decodedAgents=AgentModel.encode(agents as List<AgentModel>);
    _sharedPrefrencesManager.saveData(key: "agents_data", value: decodedAgents);
    _sharedPrefrencesManager.saveData(key: "agent_data_lang", value: lang);
    _sharedPrefrencesManager.saveData(key: "agentsTime", value: DateTime.now().toIso8601String());
  }
  @override
  Future<List<Agent>> getAgentsFromSharedPref(String lang) async{
    late List<Agent> agents;
    final String agentString = await _sharedPrefrencesManager.getData(key:"agents_data")??'';
    final String time = await _sharedPrefrencesManager.getData(key: "agentsTime")??'';
    final String cachedLang = await _sharedPrefrencesManager.getData(key: "agent_data_lang")??'';
    if(cachedLang!=lang)
      {
        agents=[];
        return agents;
      }
    else{
      if(agentString.isNotEmpty)
      {
        if(DateTime.now().difference(DateTime.parse(time)).inDays>15)
        {
          _sharedPrefrencesManager.clear(key: AppStrings.agents);
          agents=[];
          return agents;
        }
        else
        {
          agents=[];
          agents=AgentModel.decode(agentString);
          return agents;
        }
      }
      else
      {
        agents=[];
        return agents;
      }
    }

  }
}