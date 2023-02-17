import 'package:valorant_info/features/weapons/domain/entities/chroma.dart';
import 'package:valorant_info/features/weapons/domain/entities/level.dart';

class Skin {
  final String? uuid;
  final String? displayName;
  final String? themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final List<Chroma>? chromas;
  final List<Level>? levels;

  Skin({
    this.uuid,
    this.displayName,
    this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.chromas,
    this.levels,
  });
}
