// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_demo/models/catalog.dart';
import 'package:flutter_demo/widgets/themes.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson); // converts string to map(key, value)
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if(CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand()
              ]
            ),
          ),
        ),
      );
  }
}






