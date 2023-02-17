import 'dart:convert';
import 'package:valorant_info/features/agents/data/models/ability_model.dart';
import 'package:valorant_info/features/agents/data/models/role_model.dart';
import 'package:valorant_info/features/agents/domain/entities/agent.dart';
class AgentModel extends Agent {
  const AgentModel(
      {super.agentId,
      super.displayName,
      super.description,
      super.developerName,
      super.displayIcon,
      super.displayIconSmall,
      super.fullPortraitV2,
      super.killFeedPortrait,
      super.background,
      super.backgroundGradientColors,
      super.isPlayableCharacter,
      super.role,
      super.abilities});

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
        agentId: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        developerName: json["developerName"],
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        fullPortraitV2: json["fullPortraitV2"],
        background: json["background"],
        backgroundGradientColors:
            List<String>.from(json["backgroundGradientColors"].map((x) => x)),
        isPlayableCharacter: json["isPlayableCharacter"],
        role: RoleModel.fromJson(json["role"]),
        abilities: List<AbilityModel>.from(
            json["abilities"].map((x) => AbilityModel.fromJson(x))),
      );

  static Map<String, dynamic> agentToJson(AgentModel agentModel) => {
        "uuid": agentModel.agentId,
        "displayName": agentModel.displayName,
        "description": agentModel.description,
        "developerName": agentModel.developerName,
        "displayIcon": agentModel.displayIcon,
        "displayIconSmall": agentModel.displayIconSmall,
        "fullPortraitV2": agentModel.fullPortraitV2,
        "background": agentModel.background,
        "backgroundGradientColors": List<dynamic>.from(
            agentModel.backgroundGradientColors!.map((x) => x)),
        "isPlayableCharacter": agentModel.isPlayableCharacter,
        "role": agentModel.role!.roleToJson(),
        "abilities": List<dynamic>.from(
            agentModel.abilities!.map((x) => x.abilityToJson())),
      };

  static String encode(List<AgentModel> agents) => json.encode(
        agents
            .map<Map<String, dynamic>>((agent) => AgentModel.agentToJson(agent))
            .toList());

  static List<AgentModel> decode(String agents) =>
      (json.decode(agents) as List<dynamic>)
          .map<AgentModel>((item) => AgentModel.fromJson(item))
          .toList();
}
