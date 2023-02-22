import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/settings/domain/repositories/lang_repository.dart';

class ChangeLangUseCase{
  final LangRepository _langRepository;
  ChangeLangUseCase(this._langRepository);
  Future<Either<Failure, bool>> call({String ?lang})async {
    return await _langRepository.changeLang(langCode: lang!);
  }
}