import 'package:valorant_info/features/weapons/domain/entities/chroma.dart';

class ChromaModel extends Chroma {
  ChromaModel({
    super.uuid,
    super.displayName,
    super.fullRender,
    super.swatch,
    super.streamedVideo,
  });

  factory ChromaModel.fromJson(Map<String, dynamic> json) => ChromaModel(
        uuid: json["uuid"] ?? '',
        displayName: json["displayName"] ?? '',
        fullRender: json["fullRender"] ?? '',
        swatch: json["swatch"] ?? '',
        streamedVideo: json["streamedVideo"] ?? '',
      );

  static Map<String, dynamic> toJson(Chroma chroma) => {
        "uuid": chroma.uuid,
        "displayName": chroma.displayName,
        "fullRender": chroma.fullRender,
        "swatch": chroma.swatch,
        "streamedVideo": chroma.streamedVideo,
      };
}
