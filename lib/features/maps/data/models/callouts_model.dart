class CallOutModel {
  CallOutModel({
    required this.regionName,
    required this.superRegionName,
    required this.location,
  });

  String regionName;
  String superRegionName;
  Location location;

  factory CallOutModel.fromJson(Map<String, dynamic> json) => CallOutModel(
    regionName: json["regionName"]??'',
    superRegionName: json["superRegionName"]??'',
    location: json["location"]==null?  Location():Location.fromJson(json["location"]),
  );

  Map<String, dynamic> toJson() => {
    "regionName": regionName,
    "superRegionName":superRegionName,
    "location": location.toJson(),
  };
}

class Location {
  Location({
    this.x,
    this.y,
  });

  dynamic x;
  dynamic y;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    x: json["x"]??0,
    y: json["y"]??0,
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
  };
}
