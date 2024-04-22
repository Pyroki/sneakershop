import 'package:flutter/material.dart';
import 'package:sneakershop/components/bottom_nav.dart';
import 'package:sneakershop/pages/cart_page.dart';
import 'package:sneakershop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  int _selectedindex = 0;

  void changethetab(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          children: [
            DrawerHeader(
                child: Image.asset(
              "lib/images/lo.png",
              color: Colors.white,
            )),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  "H O M E",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
              ),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "A B O U T  U S",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 40, bottom: 30),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  "L O G O U T",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => changethetab(index),
      ),
      body: _pages[_selectedindex],
    );
  }
}
