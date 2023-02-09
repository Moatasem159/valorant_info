import 'package:flutter/material.dart';

class AgentScreenLoadingBody extends StatelessWidget {
  const AgentScreenLoadingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body:const Center(child: SizedBox(
              width:60,
              height:60 ,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ))
        ));
  }
}
