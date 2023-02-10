import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 3,vertical:8),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          height: 50,
          decoration: BoxDecoration(
              color: isSelected ?Theme.of(context).primaryColor:Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).primaryColor)
          ),
          child:  Text(role,style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: isSelected?Theme.of(context).colorScheme.background:Theme.of(context).primaryColor
          ),),
        ),
      ),
    );
  }
}
