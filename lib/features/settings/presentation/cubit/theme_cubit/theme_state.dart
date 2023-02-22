import 'package:equatable/equatable.dart';
abstract class ThemeStates extends Equatable{
  final bool isDark;
  const ThemeStates(this.isDark);
  @override
  List<Object> get props => [isDark];
}
class ChangeThemeState extends ThemeStates {
  final bool isStateDark;
  const ChangeThemeState(this.isStateDark): super(isStateDark);
}