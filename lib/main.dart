import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_info/app/app.dart';
import 'package:valorant_info/app/bloc_observer.dart';
import 'package:valorant_info/app/injection_container.dart' as di;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer=AppBlocObserver();
  runApp(const ValorantInfo());
}