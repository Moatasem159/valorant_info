import 'package:shared_preferences/shared_preferences.dart';
import 'package:valorant_info/core/utils/app_strings.dart';

abstract class LangLocaleDataSource {
  Future<bool> changeLang({required String langCode});
  Future<String?> getSavedLang();
}
class LangLocaleDataSourceImpl implements LangLocaleDataSource{
  final SharedPreferences _sharedPreferences;
  LangLocaleDataSourceImpl(this._sharedPreferences);
  @override
  Future<bool> changeLang({required String langCode}) async{
  return await _sharedPreferences.setString(AppStrings.locale,langCode);
  }

  @override
  Future<String?> getSavedLang() async=>
      _sharedPreferences.containsKey(AppStrings.locale)?
   _sharedPreferences.getString(AppStrings.locale):AppStrings.englishCode;
}