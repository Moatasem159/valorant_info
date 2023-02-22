import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/settings/data/datasources/theme_local_datasource.dart';
import 'package:valorant_info/features/settings/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository{
  final ThemeLocalDataSource _themeLocalDataSource;

  ThemeRepositoryImpl(this._themeLocalDataSource);
  @override
  Future<Either<Failure, bool>> changeTheme({required String theme})async {
    final langIsChanged=await _themeLocalDataSource.changeTheme(theme:theme);
    return Right(langIsChanged);
  }

  @override
  Future<Either<Failure, String>> getTheme() async{
    final theme=await _themeLocalDataSource.getTheme();
    return Right(theme);
  }



}