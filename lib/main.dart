import 'package:flutter/material.dart';
import 'package:valorant_info/app/app.dart';
import 'package:valorant_info/app/injection_container.dart' as di;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const ValorantInfo());
}