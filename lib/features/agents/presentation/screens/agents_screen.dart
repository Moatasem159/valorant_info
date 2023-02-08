import 'package:flutter/material.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
       backgroundColor: Theme.of(context).colorScheme.background,
      body: const Center(child: Text("Agents Screen")),
    ));
  }
}
