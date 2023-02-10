import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/features/agents/domain/entities/ability.dart';
import 'package:valorant_info/features/agents/presentation/widgets/ability_widgets/ability_description.dart';
import 'package:valorant_info/features/agents/presentation/widgets/ability_widgets/ability_widget.dart';
class AbilitiesList extends StatefulWidget {
  final List<Ability> abilities;
  const AbilitiesList({super.key, required this.abilities});
  @override
  State<AbilitiesList> createState() => _AbilitiesListState();
}
class _AbilitiesListState extends State<AbilitiesList> {
  late Ability selectedAbility;
  @override
  void initState() {
    super.initState();
    selectedAbility=Ability();
    for(int i=0;i<widget.abilities.length;i++)
      {
        widget.abilities[i].isSelected=false;
      }
  }
  selectButton(ability){
    for(int i=0;i<widget.abilities.length;i++)
    {
      widget.abilities[i].isSelected=false;
    }
   selectedAbility= widget.abilities.firstWhere((element) => element==ability);
    widget.abilities.firstWhere((element) => element==ability).isSelected=true;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Wrap(
            children: widget.abilities
                .map((e) => AbilityWidget(
                    ability: e,
                    onTap: () {
                      selectButton(e);
                    },
                  ),).toList(),
          ),
          if(selectedAbility!=Ability())
          AbilityDescription(ability: selectedAbility),
          if(selectedAbility==Ability())
            const SizedBox(height: AppSize.s30,)
        ],
      ),
    );
  }
}
