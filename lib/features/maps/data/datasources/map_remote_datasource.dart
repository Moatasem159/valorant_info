import 'package:valorant_info/core/api/api_consumer.dart';
import 'package:valorant_info/core/api/end_points.dart';
import 'package:valorant_info/features/maps/data/models/map_model.dart';

abstract class MapsRemoteDataSource{
  Future<List<MapModel>> getMaps(String lang);
}
class MapsRemoteDataSourceImpl implements MapsRemoteDataSource{
  final ApiConsumer _apiConsumer;
  MapsRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<MapModel>> getMaps(String lang)async{
    final response=await _apiConsumer.get(EndPoints.mapsUrl(lang));
    return List<MapModel>.from(
      (response['data'] as List).map(
            (x) => MapModel.fromJson(x),
      ),
    );
  }
}