import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/maps/data/models/map_model.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
abstract class MapLocalDataSource{
  Future<void> saveMapsInSharedPref({required List<MapEntity> maps,required String lang});
  Future<List<MapEntity>> getMapsFromSharedPref(String lang);
}
class MapLocalDataSourceImpl implements MapLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesManager;
  MapLocalDataSourceImpl(this._sharedPrefrencesManager);
  @override
  Future<void> saveMapsInSharedPref({required List<MapEntity> maps,required String lang}) async{
    final String decodedMaps=MapModel.encode(maps as List<MapModel>);
    _sharedPrefrencesManager.saveData(key: "maps_data", value: decodedMaps);
    _sharedPrefrencesManager.saveData(key: "maps_data_lang", value: lang);
    _sharedPrefrencesManager.saveData(key: "mapsTime", value: DateTime.now().toIso8601String());
  }
  @override
  Future<List<MapEntity>> getMapsFromSharedPref(String lang) async{
    late List<MapEntity> maps;
    final String mapsString = await _sharedPrefrencesManager.getData(key:"maps_data")??'';
    final String time = await _sharedPrefrencesManager.getData(key:"mapsTime")??'';
    final String cachedLang = await _sharedPrefrencesManager.getData(key:"maps_data_lang")??'';
    if(cachedLang !=lang)
      {
        maps=[];
        return maps;
      }
    else{
      if(mapsString.isNotEmpty)
      {
        if(DateTime.now().difference(DateTime.parse(time)).inDays>30){
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
}