import 'package:equatable/equatable.dart';
import 'package:valorant_info/features/agents/data/models/ability_model.dart';
import 'package:valorant_info/features/agents/data/models/role_model.dart';
class Agent extends Equatable{
  final String ?agentId;
  final String ?displayName;
  final String ?description;
  final String ?developerName;
  final String ?displayIcon;
  final String ?displayIconSmall;
  final String ?fullPortraitV2;
  final String ?killFeedPortrait;
  final String ?background;
  final List<String> ?backgroundGradientColors;
  final bool ?isPlayableCharacter;
  final RoleModel ?role;
  final List<AbilityModel> ?abilities;
  const Agent(
      {this.agentId,
      this.displayName,
      this.description,
      this.developerName,
      this.displayIcon,
      this.displayIconSmall,
      this.fullPortraitV2,
      this.killFeedPortrait,
      this.background,
      this.backgroundGradientColors,
      this.isPlayableCharacter,
      this.role,
      this.abilities});
  @override
  List<Object?> get props => [
    agentId,
    displayName,
    description,
    developerName,
    displayIcon,
    displayIconSmall,
    fullPortraitV2,
    killFeedPortrait,
    background,
    backgroundGradientColors,
    isPlayableCharacter,
    role,
    abilities,
  ];
}