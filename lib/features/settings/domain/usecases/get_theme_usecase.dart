import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/settings/domain/repositories/theme_repository.dart';
class GetThemeUseCase{
  final ThemeRepository _themeRepository;
  GetThemeUseCase(this._themeRepository);
  Future<Either<Failure, String>> call()async {
    return await _themeRepository.getTheme();
  }
}