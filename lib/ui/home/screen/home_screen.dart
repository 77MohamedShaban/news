import 'package:flutter/material.dart';
import 'package:News/core/resources/strings_Manager.dart';
import 'package:News/ui/home/widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringsManager.home)),
      drawer: HomeDrawer(),
      body: SafeArea(child: Column(children: [])),
    );
  }
}
