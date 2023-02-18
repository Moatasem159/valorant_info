import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/maps/data/models/map_model.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
abstract class MapLocalDataSource{
  Future<void> saveMapsInSharedPref({required List<MapEntity> maps});
  Future<List<MapEntity>> getMapsFromSharedPref();
}
class MapLocalDataSourceImpl implements MapLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesManager;
  MapLocalDataSourceImpl(this._sharedPrefrencesManager);
  @override
  Future<void> saveMapsInSharedPref({required List<MapEntity> maps}) async{
    final String decodedMaps=MapModel.encode(maps as List<MapModel>);
    _sharedPrefrencesManager.saveData(key: AppStrings.maps, value: decodedMaps);
    _sharedPrefrencesManager.saveData(key: "mapsTime", value: DateTime.now().toIso8601String());
  }
  @override
  Future<List<MapEntity>> getMapsFromSharedPref() async{
    late List<MapEntity> maps;
    final String mapsString = await _sharedPrefrencesManager.getData(key:AppStrings.maps)??'';
    final String time = await _sharedPrefrencesManager.getData(key:"mapsTime")??'';
    if(mapsString.isNotEmpty)
    {
      if(DateTime.now().difference(DateTime.parse(time)).inDays>15){
        _sharedPrefrencesManager.clear(key: AppStrings.maps);
        maps=[];
        return maps;
      }
      else{
        maps=[];
        maps=MapModel.decode(mapsString);
        return maps;
      }
    }
    else
    {
      maps=[];
      return maps;
    }
  }
}