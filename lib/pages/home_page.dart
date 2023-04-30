// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days = 30;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App",)
        ),
        body: Center(
          child: Text('Welcome to $days days of flutter by $name'),
        ),
        drawer: const MyDrawer(),
      );
  }
}