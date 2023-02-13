import 'package:flutter/material.dart';
import 'package:valorant_info/core/utils/app_size.dart';
class LoadingBody extends StatelessWidget {
  const LoadingBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body:const Center(child: SizedBox(
              width:AppSize.s60,
              height:AppSize.s60,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ))
        ));
  }
}