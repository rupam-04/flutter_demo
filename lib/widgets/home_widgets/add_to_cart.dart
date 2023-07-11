import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key, required this.catalog,
  });

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog)? true : false;
    return ElevatedButton(
      onPressed: () {
        isInCart = !isInCart;
        final _catalog = CatalogModel();
        
        _cart.catalog = _catalog;
        // isInCart? _cart.add(widget.catalog) : _cart.remove(widget.catalog);
        if (isInCart) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "Item added to cart".text.make(),
            )
          );
          _cart.add(catalog);
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: "Item removed from cart".text.make(),
            )
          );
          _cart.remove(catalog);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          MyTheme.darkBluishColor
        ),
        shape: MaterialStateProperty.all(const StadiumBorder())
      ),
      child: isInCart? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}