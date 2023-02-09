import 'package:flutter/material.dart';
import 'package:valorant_info/features/agents/presentation/widgets/roles_widgets/role_widget.dart';

class RolesList extends StatelessWidget {
  const RolesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          RoleWidget(
            role: "All",
            isSelected: true,
          ),
          RoleWidget(
            role: "Duelist",
          ),
          RoleWidget(
            role: "Initiator",
          ),
          RoleWidget(
            role: "Controller",
          ),
          RoleWidget(
            role: "Sentinel",
          ),
        ],
      ),
    );
  }
}
