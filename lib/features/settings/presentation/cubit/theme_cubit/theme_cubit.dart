import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/settings/domain/usecases/change_theme_usecase.dart';
import 'package:valorant_info/features/settings/domain/usecases/get_theme_usecase.dart';
import 'package:valorant_info/features/settings/presentation/cubit/theme_cubit/theme_state.dart';
class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit({
    required this.changeThemeUseCase,
    required this.getThemeUseCase,
  }) : super(const ChangeThemeState(false));
  ChangeThemeUseCase changeThemeUseCase;
  GetThemeUseCase getThemeUseCase;
  bool isDark = false;
  Future<void> _changeTheme({required String theme}) async {
    final response = await changeThemeUseCase.call(theme: theme);
    response.fold((failure) => debugPrint("cache Failure"),(value){
      if (theme == AppStrings.lightTheme) {
        isDark = false;
      } else if (theme == AppStrings.darkTheme) {
        isDark = true;
      }
      emit(ChangeThemeState(isDark));
    });
  }
  Future<void> getTheme()async{
    final response = await getThemeUseCase.call();
    response.fold((failure) => debugPrint("cache Failure"), (value) {
      if (value == AppStrings.lightTheme) {
        isDark = false;
      } else if (value == AppStrings.darkTheme) {
        isDark = true;
      }
      emit(ChangeThemeState(isDark));
    });
  }
  void toLight()=>_changeTheme(theme: AppStrings.lightTheme);
  void toDark()=>_changeTheme(theme: AppStrings.darkTheme);
}