import 'package:flutter/material.dart';
import 'package:valorant_info/config/lang/app_localizations.dart';
import 'package:valorant_info/core/utils/app_size.dart';
import 'package:valorant_info/core/utils/app_strings.dart';
import 'package:valorant_info/features/agents/presentation/widgets/roles_widgets/roles_list.dart';
class AgentScreenAppBar extends StatelessWidget {
  const AgentScreenAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      title:Text(AppStrings.agents.tr(context)!),
      centerTitle: true,
      pinned: true,
      bottom: const PreferredSize(
          preferredSize: Size(double.infinity, AppSize.s50),
          child: RolesList(),
      ),
    );
  }
}