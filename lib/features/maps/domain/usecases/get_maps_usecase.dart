import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/domain/repositories/map_repository.dart';
class GetMapsUseCase{
  final MapRepository _mapRepository;
  GetMapsUseCase(this._mapRepository);
  Future<Either<Failure, List<MapEntity>>> call(String lang)async {
    return await _mapRepository.getMaps(lang);
  }
}