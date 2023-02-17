import 'package:valorant_info/core/api/api_consumer.dart';
import 'package:valorant_info/core/api/end_points.dart';
import 'package:valorant_info/features/weapons/data/models/weapon_model.dart';
abstract class WeaponsRemoteDataSource{
  Future<List<WeaponModel>> getWeapons();
}
class WeaponsRemoteDataSourceImpl implements WeaponsRemoteDataSource{
  final ApiConsumer _apiConsumer;
  WeaponsRemoteDataSourceImpl(this._apiConsumer);
  @override
  Future<List<WeaponModel>> getWeapons() async{
    final response=await _apiConsumer.get(EndPoints.weaponsUrl);
    return List<WeaponModel>.from(
      (response['data'] as List).map(
            (x) => WeaponModel.fromJson(x)),
    );
  }
}