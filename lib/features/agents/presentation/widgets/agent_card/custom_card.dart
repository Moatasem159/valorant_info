import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/card_painter.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.s10),
      child: CustomPaint(
        size:Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height/3),
        painter: CardPainter(context: context),
      ),
    );
  }
}
