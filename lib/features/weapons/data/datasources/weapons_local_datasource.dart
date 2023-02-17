import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/weapons/data/models/weapon_model.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
abstract class WeaponsLocalDataSource{
  Future<void> saveWeaponsInSharedPref({required List<Weapon> weapons});
  Future<List<Weapon>> getWeaponsFromSharedPref();
}
class WeaponsLocalDataSourceImpl implements  WeaponsLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesManager;
  WeaponsLocalDataSourceImpl(this._sharedPrefrencesManager);
  @override
  Future<void> saveWeaponsInSharedPref({required List<Weapon> weapons})async {
    final String decodedWeapons=WeaponModel.encode(weapons as List<WeaponModel>);
    _sharedPrefrencesManager.saveData(key: AppStrings.weapons, value: decodedWeapons);
    _sharedPrefrencesManager.saveData(key: "weaponsTime", value: DateTime.now().toIso8601String());
  }
  @override
  Future<List<Weapon>> getWeaponsFromSharedPref()async {
    late List<Weapon> weapons;
    final String weaponsString = await _sharedPrefrencesManager.getData(key:AppStrings.weapons)??'';
    final String time = await _sharedPrefrencesManager.getData(key: "weaponsTime")??'';
    if(weaponsString.isNotEmpty)
    {
      if(DateTime.now().difference(DateTime.parse(time)).inDays>60)
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