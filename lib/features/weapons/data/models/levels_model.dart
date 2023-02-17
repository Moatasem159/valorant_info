import 'package:valorant_info/features/weapons/domain/entities/level.dart';

class LevelModel extends Level {
  LevelModel({
    super.uuid,
    super.displayName,
    super.levelItem,
    super.displayIcon,
    super.streamedVideo,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        uuid: json["uuid"] ?? '',
        displayName: json["displayName"] ?? '',
        levelItem: json["levelItem"] ?? '',
        displayIcon: json["displayIcon"] ?? '',
        streamedVideo: json["streamedVideo"] ?? '',
      );

  static Map<String, dynamic> toJson(Level level) => {
        "uuid": level.uuid,
        "displayName": level.displayName,
        "levelItem": level.levelItem,
        "displayIcon": level.displayIcon,
        "streamedVideo": level.streamedVideo,
      };
}
