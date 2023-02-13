import 'package:valorant_info/features/maps/data/models/callouts_model.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';

class MapModel extends MapEntity{
  MapModel(
      {super.mapId,
      super.displayName,
      super.coordinates,
      super.displayIcon,
      super.listViewIcon,
      super.splash,
      super.callouts});



  factory MapModel.fromJson(Map<String, dynamic> json) => MapModel(
      mapId: json["uuid"]??'',
      displayName: json["displayName"]??'',
      coordinates: json["coordinates"]??'',
      displayIcon: json["displayIcon"]??'',
      listViewIcon: json["listViewIcon"]??'',
      splash: json["splash"]??'',
      callouts: json["callouts"]==null?[]:List<CallOutModel>.from(json["callouts"].map((x) => CallOutModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "uuid": mapId,
      "displayName": displayName,
      "coordinates": coordinates,
      "displayIcon": displayIcon,
      "listViewIcon": listViewIcon,
      "splash": splash,
      "callouts": List<CallOutModel>.from(callouts!.map((x) => x.toJson())),
  };
}