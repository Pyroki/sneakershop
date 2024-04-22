import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/components/cart_item.dart';
import 'package:sneakershop/model/cart.dart';
import 'package:sneakershop/model/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Text("MY CART"),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.getUserCart().length,
                          itemBuilder: (context, index) {
                            Shoe individualShoe = value.getUserCart()[index];

                            return CartItem(
                              shoe: individualShoe,
                            );
                          }))
                ],
              ),
            ));
  }
}
