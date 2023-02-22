import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
abstract class MapRepository{
  Future<Either<Failure,List<MapEntity>>> getMaps(String lang);
}