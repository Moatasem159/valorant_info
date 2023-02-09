import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/presentation/widgets/agent_card/card_painter.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CustomPaint(
        size: const Size(400,250),
        painter: CardPainter(context: context),
      ),
    );
  }
}
