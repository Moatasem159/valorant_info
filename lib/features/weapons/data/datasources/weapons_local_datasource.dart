import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/weapons/data/models/weapon_model.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
abstract class WeaponsLocalDataSource{
  Future<void> saveWeaponsInSharedPref({required List<Weapon> weapons,required String lang});
  Future<List<Weapon>> getWeaponsFromSharedPref(String lang);
}
class WeaponsLocalDataSourceImpl implements  WeaponsLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesManager;
  WeaponsLocalDataSourceImpl(this._sharedPrefrencesManager);
  @override
  Future<void> saveWeaponsInSharedPref({required List<Weapon> weapons,required String lang})async {
    final String decodedWeapons=WeaponModel.encode(weapons as List<WeaponModel>);
    _sharedPrefrencesManager.saveData(key: "weapons_data", value: decodedWeapons);
    _sharedPrefrencesManager.saveData(key: "weapons_data_lang", value: lang);
    _sharedPrefrencesManager.saveData(key: "weaponsTime", value: DateTime.now().toIso8601String());
  }
  @override
  Future<List<Weapon>> getWeaponsFromSharedPref(String lang)async {
    late List<Weapon> weapons;
    final String weaponsString = await _sharedPrefrencesManager.getData(key:"weapons_data")??'';
    final String time = await _sharedPrefrencesManager.getData(key: "weaponsTime")??'';
    final String cachedLang = await _sharedPrefrencesManager.getData(key: "weapons_data_lang")??'';
    if(cachedLang!=lang)
      {
        weapons=[];
        return weapons;
      }
    else{
      if(weaponsString.isNotEmpty)
      {
        if(DateTime.now().difference(DateTime.parse(time)).inDays>30)
        {
          _sharedPrefrencesManager.clear(key: AppStrings.weapons);
          weapons=[];
          return weapons;
        }
        else
        {
          weapons=[];
          weapons=WeaponModel.decode(weaponsString);
          return weapons;
        }
      }
      else
      {
        weapons=[];
        return weapons;
      }
    }

  }
}