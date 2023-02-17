
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/maps/domain/entities/map_entity.dart';
import 'package:valorant_info/features/maps/domain/usecases/get_maps_usecase.dart';
import 'package:valorant_info/features/maps/presentation/cubits/map_state.dart';
class MapCubit extends Cubit<MapStates> {
  MapCubit({required this.getMapsUseCase}) : super(MapInitialState());
  static get(context)=>BlocProvider.of<MapCubit>(context);
  GetMapsUseCase getMapsUseCase;
  late List<MapEntity> maps;
  Future<void> getMaps()async{
    emit( GetMapsLoadingState());
    Either<Failure,List<MapEntity>> response=await getMapsUseCase.call();
    emit(response.fold((l){
      return GetMapErrorState();
    }, (networkMaps){
      maps=[];
      maps=networkMaps;
      maps.sort((a,b) => a.displayName!.compareTo(b.displayName!));
      return GetMapSuccessState();
    }));
  }
}