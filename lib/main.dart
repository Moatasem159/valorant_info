import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:valorant_info/app/app.dart';
import 'package:valorant_info/app/bloc_observer.dart';
import 'package:valorant_info/app/injection_container.dart' as di;
void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.init();
  await Future.delayed(const Duration(seconds: 2));
  Bloc.observer=AppBlocObserver();
  runApp(const ValorantInfo());
  FlutterNativeSplash.remove();
}