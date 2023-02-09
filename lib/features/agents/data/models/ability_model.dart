import 'package:valorant_info/features/agents/domain/entities/ability.dart';

class AbilityModel extends Ability{
  const AbilityModel({
    super.slot,
    super.description,
    super.displayIcon,
    super.displayName,
  });
  factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
    slot: json["slot"]??'',
    displayName: json["displayName"]??'',
    description: json["description"]??'',
    displayIcon: json["displayIcon"]??'',
  );

  Map<String, dynamic> abilityToJson() => {
    "slot": slot,
    "displayName": displayName,
    "description": description,
    "displayIcon": displayIcon,
  };
}