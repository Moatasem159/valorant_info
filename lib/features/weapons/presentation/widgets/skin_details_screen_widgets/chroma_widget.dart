
import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/features/weapons/domain/entities/chroma.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/skin_details_screen_widgets/swatch_widget.dart';
import 'package:valorant_info/features/weapons/presentation/widgets/weapon_details_screen_widgets/weapon_profile.dart';

class ChromaWidget extends StatefulWidget {
  final List<Chroma> chromas;

  const ChromaWidget({super.key, required this.chromas});

  @override
  State<ChromaWidget> createState() => _ChromaWidgetState();
}

class _ChromaWidgetState extends State<ChromaWidget> {
  late Chroma selectedChroma;
  @override
  void initState() {
    super.initState();
    selectedChroma = Chroma();
    for (var element in widget.chromas) {
      element.isSelected=false;
    }
  }
  selectChroma(chroma) {
    for (var element in widget.chromas) {
      element.isSelected = false;
    }
    selectedChroma = widget.chromas.firstWhere((element) => element == chroma);
    widget.chromas.firstWhere((element) => element == chroma).isSelected = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: widget.chromas
              .map((e) => SwatchWidget(
            chroma: e,
            onTap: ()=>selectChroma(e),
          ))
              .toList(),
        ),
        if (selectedChroma.fullRender!=null)
          WeaponProfile(
              image: selectedChroma.fullRender!,
              name: selectedChroma.displayName!),
        if (selectedChroma == Chroma())
          const SizedBox(
            height: AppSize.s15,
          )
      ],
    );
  }
}
