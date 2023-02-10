import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_padding.dart';
import 'package:valorant_info/core/utils/app_radius.dart';
import 'package:valorant_info/core/utils/app_size.dart';
class RoleWidget extends StatelessWidget {
  final String role;
  final bool isSelected;
  final VoidCallback onTap;
  const RoleWidget({
    Key? key, required this.role,
    this.isSelected=false, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.s3,vertical:AppPadding.s8),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(AppPadding.s8),
          height: AppSize.s50,
          decoration: BoxDecoration(
              color: isSelected ?Theme.of(context).primaryColor:Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(AppRadius.s10),
            border: Border.all(color: Theme.of(context).primaryColor)
          ),
          child:Text(role,style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color:isSelected?Theme.of(context).colorScheme.background:Theme.of(context).primaryColor
          ),),
        ),
      ),
    );
  }
}