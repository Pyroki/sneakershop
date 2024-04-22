import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershop/components/shoe_tile.dart';
import 'package:sneakershop/model/cart.dart';
import 'package:sneakershop/model/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                content: Text("check your cart"),
                title: Text("Successfully added"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Okay")),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Consumer<Cart>(
          builder: (context, value, child) => Column(
            children: [
              //search bar
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 17),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black54,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text("There wil be always someone who is better than us"),

              SizedBox(
                height: 40,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hot Picks 🔥",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoeList()[index];

                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe),
                  );
                },
              )),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
