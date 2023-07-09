import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$9999".text.xl3.bold.color(Colors.black).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {}, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
              shape: MaterialStateProperty.all(StadiumBorder())
            ),
            child: "Buy".text.color(Colors.white).make().px4().py2()
          ).w24(context)
        ],
      ).px16()
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(CupertinoIcons.check_mark_circled),
        trailing: IconButton(
          onPressed: () {}, 
          icon: Icon(CupertinoIcons.delete)
        ),
        title: "Item 1".text.make(),
      ),
    );
  }
}