import 'package:flutter/material.dart';
import 'package:sneakershop/model/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 60),
      width: 270,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(child: Image.asset(shoe.imagepath)),
          Text(
            shoe.description,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 34, 34, 34),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(shoe.price,
                        style: TextStyle(
                            color: Colors.grey.shade900, fontSize: 16)),
                  ],
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
