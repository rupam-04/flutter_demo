import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

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
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalPrice}".text.xl3.bold.color(Colors.black).make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet".text.make(),
                )
              );
            }, 
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
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show here".text.makeCentered(): ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {
            _cart.remove(_cart.items[index]);
            setState(() {});
          }, 
          icon: Icon(Icons.remove_circle_outline)
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}