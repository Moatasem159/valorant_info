import 'package:dartz/dartz.dart';
import 'package:valorant_info/core/error/failure.dart';

abstract class ThemeRepository {
  Future<Either<Failure,bool>> changeTheme({required String theme});
  Future<Either<Failure,String>> getTheme();
}