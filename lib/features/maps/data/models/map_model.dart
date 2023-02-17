import 'dart:convert';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
class MapModel extends MapEntity{
  MapModel(
      {super.mapId,
      super.displayName,
      super.coordinates,
      super.displayIcon,
      super.listViewIcon,
      super.splash});



  factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
      mapId: json["uuid"]??'',
      displayName: json["displayName"]??'',
      coordinates: json["coordinates"]??'',
      displayIcon: json["displayIcon"]??'',
      listViewIcon: json["listViewIcon"]??'',
      splash: json["splash"]??'');

  static Map<String, dynamic> toJson(MapModel mapModel) => {
      "uuid": mapModel.mapId,
      "displayName": mapModel.displayName,
      "coordinates": mapModel.coordinates,
      "displayIcon": mapModel.displayIcon,
      "listViewIcon": mapModel.listViewIcon,
      "splash": mapModel.splash,
  };

  static String encode(List<MapModel> maps) => json.encode(
      maps
          .map<Map<String, dynamic>>((map) => MapModel.toJson(map))
          .toList());

  static List<MapModel> decode(String maps) =>
      (json.decode(maps) as List<dynamic>)
          .map<MapModel>((map) => MapModel.fromJson(map))
          .toList();
}