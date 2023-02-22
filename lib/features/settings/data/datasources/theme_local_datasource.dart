import 'package:valorant_info/core/shared/shared_prefrences_consumer.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
abstract class ThemeLocalDataSource {
  Future<bool> changeTheme({required String theme});
  Future<String> getTheme();
}
class ThemeLocalDataSourceImpl implements ThemeLocalDataSource{
  final SharedPrefrencesConsumer _sharedPrefrencesConsumer;
  ThemeLocalDataSourceImpl(this._sharedPrefrencesConsumer);
  @override
  Future<bool> changeTheme({required String theme})async {
    return await _sharedPrefrencesConsumer.saveData(key: AppStrings.theme,value: theme);
  }

  @override
  Future<String> getTheme()async {
    return _sharedPrefrencesConsumer.containsKey(key: AppStrings.theme)?
     _sharedPrefrencesConsumer.getData(key: AppStrings.theme):AppStrings.lightTheme;
  }
}