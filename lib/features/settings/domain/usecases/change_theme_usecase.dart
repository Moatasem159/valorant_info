import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/settings/domain/repositories/theme_repository.dart';
class ChangeThemeUseCase{
  final ThemeRepository _themeRepository;
  ChangeThemeUseCase(this._themeRepository);
  Future<Either<Failure, bool>> call({String ?theme})async {
    return await _themeRepository.changeTheme(theme:theme!);
  }
}