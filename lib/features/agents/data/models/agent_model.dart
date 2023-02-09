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
      backgroundGradientColors: List<String>.from(json["backgroundGradientColors"].map((x) => x)),
      isPlayableCharacter: json["isPlayableCharacter"],
      role: RoleModel.fromJson(json["role"]),
      abilities: List<AbilityModel>.from(json["abilities"].map((x) => AbilityModel.fromJson(x))),
  );

  Map<String, dynamic> agentToJson() => {
      "uuid": agentId,
      "displayName": displayName,
      "description": description,
      "developerName": developerName,
      "displayIcon": displayIcon,
      "displayIconSmall": displayIconSmall,
      "fullPortraitV2": fullPortraitV2,
      "background": background,
      "backgroundGradientColors": List<dynamic>.from(backgroundGradientColors!.map((x) => x)),
      "isPlayableCharacter": isPlayableCharacter,
      "role": role!.roleToJson(),
      "abilities": List<dynamic>.from(abilities!.map((x) => x.abilityToJson())),
  };
}
