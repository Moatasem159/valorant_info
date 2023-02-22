import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/settings/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase {
  final LangRepository _langRepository;
  GetSavedLangUseCase(this._langRepository);
  Future<Either<Failure, String>> call() async =>
      await _langRepository.getSavedLang();
}
