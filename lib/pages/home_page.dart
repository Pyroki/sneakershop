import 'package:flutter/material.dart';
import 'package:sneakershop/components/bottom_nav.dart';
import 'package:sneakershop/pages/cart_page.dart';
import 'package:sneakershop/pages/login_page.dart';
import 'package:sneakershop/pages/shop_page.dart';
import 'package:sneakershop/services/auth_gate.dart';
import 'package:sneakershop/services/auth_service.dart'; // Import AuthService

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _signOut() async {
    try {
      await AuthService().signOut(); // Call signOut method from AuthService
      // Navigate to LoginPage after signing out
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
      );
    } catch (e) {
      print("Error signing out: $e");
      // Handle sign out error
    }
  }

  final List<Widget> _pages = const [ShopPage(), CartPage()];

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
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  "HOME",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  _changeTab(0); // Navigate to home page
                },
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  "ABOUT US",
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
                  "LOGOUT",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: _signOut, // Fix the syntax error here
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: _changeTab,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
