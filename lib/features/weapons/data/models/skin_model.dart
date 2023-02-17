import 'package:valorant_info/features/weapons/data/models/chroma_model.dart';
import 'package:valorant_info/features/weapons/data/models/levels_model.dart';
import 'package:valorant_info/features/weapons/domain/entities/skin.dart';

class SkinModel extends Skin {
  SkinModel({
    super.uuid,
    super.displayName,
    super.themeUuid,
    super.contentTierUuid,
    super.displayIcon,
    super.chromas,
    super.levels,
  });

  factory SkinModel.fromJson(Map<String, dynamic> json) => SkinModel(
        uuid: json["uuid"] ?? '',
        displayName: json["displayName"] ?? '',
        themeUuid: json["themeUuid"] ?? '',
        contentTierUuid: json["contentTierUuid"] ?? '',
        displayIcon: json["displayIcon"] ?? '',
        chromas: json["chromas"] == null
            ? []
            : List<ChromaModel>.from(
                json["chromas"].map((x) => ChromaModel.fromJson(x))),
        levels: json["levels"] == null
            ? []
            : List<LevelModel>.from(
                json["levels"].map((x) => LevelModel.fromJson(x))),
      );

  static Map<String, dynamic> toJson(Skin skin) => {
        "uuid": skin.uuid,
        "displayName": skin.displayName,
        "themeUuid": skin.themeUuid,
        "contentTierUuid": skin.contentTierUuid,
        "displayIcon": skin.displayIcon,
        "chromas": List<dynamic>.from(
            skin.chromas!.map((x) => ChromaModel.toJson(x))),
        "levels":
            List<dynamic>.from(skin.levels!.map((x) => LevelModel.toJson(x))),
      };
}
