import 'package:flutter/material.dart';
import 'package:valorant_info/features/weapons/domain/entities/level.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skin_details_screen_widgets/level_details.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skin_details_screen_widgets/level_widget.dart';

class LevelsWidget extends StatefulWidget {
  final List<Level> levels;
  const LevelsWidget({super.key,required this.levels});
  @override
  State<LevelsWidget> createState() => _LevelsWidgetState();
}

class _LevelsWidgetState extends State<LevelsWidget> {
  late Level selectedLevel;
  @override
  void initState(){
    super.initState();
    selectedLevel =  Level();
    for (var element in widget.levels) {
      element.isSelected=false;
    }
  }
  selectLevel(Level level){
    for (var element in widget.levels) {
      element.isSelected = false;
    }
    selectedLevel = widget.levels.firstWhere((element) => element == level);
    widget.levels.firstWhere((element) => element == level).isSelected = true;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: widget.levels
              .map((e) => LevelWidget(
            level: e,
            onTap: () => selectLevel(e),
          ))
              .toList(),
        ),
        if(selectedLevel.displayIcon!=null)
          LevelDetails(selectedLevel: selectedLevel),
      ],
    );
  }
}