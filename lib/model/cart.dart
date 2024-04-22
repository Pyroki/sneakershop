import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoe
  List<Shoe> shoeshop = [
    Shoe(
        description: "Zoom freak",
        imagepath: "lib/images/one.jpg",
        name: "Nike",
        price: "\$800"),
    Shoe(
        description: "Zoom freak",
        imagepath: "lib/images/two.jpg",
        name: "Nike",
        price: "\$800"),
    Shoe(
        description: "Zoom freak",
        imagepath: "lib/images/three.jpg",
        name: "Nike",
        price: "\$800"),
    Shoe(
        description: "Zoom freak",
        imagepath: "lib/images/four.jpg",
        name: "Nike",
        price: "\$800")
  ];

  //list of item
  List<Shoe> usercart = [];

  //get the items
  List<Shoe> getShoeList() {
    return shoeshop;
  }

  //get to cart
  List<Shoe> getUserCart() => usercart;

  //add item

  void addItemToCart(Shoe shoe) {
    usercart.add(shoe);
    notifyListeners();
  }

  //remove item
  void removeItemCart(Shoe shoe) {
    usercart.remove(shoe);
    notifyListeners();
  }

  void removeItemFromCart(Shoe shoe) {}
}
