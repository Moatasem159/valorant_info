import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/error/failure.dart';
import 'package:valorant_info/features/weapons/domain/entities/weapon.dart';
import 'package:valorant_info/features/weapons/domain/usecases/get_weapons_usecase.dart';
import 'package:valorant_info/features/weapons/presentation/cubits/weapons_state.dart';

class WeaponCubit extends Cubit<WeaponsStates> {
  WeaponCubit({required this.getWeaponsUseCase}) : super(WeaponsInitialState());

  static get(context) => BlocProvider.of<WeaponCubit>(context);

  GetWeaponsUseCase getWeaponsUseCase;

  late List<Weapon> weapons;

  Future<void> getWeapons(String lang) async {
    emit(GetWeaponsLoadingState());
    Either<Failure, List<Weapon>> response = await getWeaponsUseCase.call(lang);
    emit(response.fold((l) => GetWeaponsErrorState(), (networkWeapons) {
      weapons = [];
      weapons = networkWeapons;
      for (var element in weapons) {
        element.skins!.removeWhere((element) =>element.chromas![0].displayName=="Standard");
      }
      return GetWeaponsSuccessState();
    }));
  }
}
