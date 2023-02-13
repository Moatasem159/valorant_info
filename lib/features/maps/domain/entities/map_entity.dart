import 'package:valorant_info/features/maps/data/models/callouts_model.dart';

class MapEntity{


  final String ?mapId;
  final String ?displayName;
  final String ?coordinates;
  final String ?displayIcon;
  final String ?listViewIcon;
  final String?splash;
  final List<CallOutModel> ?callouts;

  MapEntity(
      {this.mapId,
      this.displayName,
      this.coordinates,
      this.displayIcon,
      this.listViewIcon,
      this.splash,
      this.callouts});
}