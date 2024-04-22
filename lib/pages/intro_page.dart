import 'package:flutter/material.dart';
import 'package:sneakershop/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            // logo

            Padding(
              padding: const EdgeInsets.only(top: 100, left: 30),
              child: Image.asset(
                'lib/images/nike.jpg',
                height: 230,
                width: 400,
              ),
            ),

            //TITLE
            const Text(
              "Just Do It",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 50,
            ),
            //dubtitle
            const Text(
              "Step Into Style: Your Ultimate Sneaker Destination",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black38),
            ),
            const SizedBox(
              height: 80,
            ),
            //button

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                margin: const EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14)),
                child: const Center(
                  child: Text(
                    "Shop Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
