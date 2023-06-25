// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/catalog.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int days = 30;
  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Catalog App",)
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: dummyList.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: dummyList[index], key: Key(index.toString()),
              );
            } 
          ),
        ),
        drawer: const MyDrawer(),
      );
  }
}