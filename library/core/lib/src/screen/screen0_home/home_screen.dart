import 'package:core/src/screen/screen0_home/widget/nav_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Side menu'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
