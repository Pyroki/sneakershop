import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/model/cart.dart';
import 'package:sneakershop/model/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;

  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void removeItemFromCart() {
    // Get the Cart provider
    final cart = Provider.of<Cart>(context, listen: false);

    // Remove the shoe from the cart
    cart.removeItemCart(widget.shoe);

    // Optionally, show a confirmation snackbar (consider user experience)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.shoe.name} removed from cart'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagepath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
