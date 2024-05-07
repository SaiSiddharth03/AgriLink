import 'package:flutter/material.dart';

import '../../pages/login_page.dart';
import '../../page/registerPage/register.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-2.png',
              width: 130,
              height: 130,
            ),
            const Text('Let us know you first!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const RegisterPage(typeUser: 'seller', phoneNum: '',)));
              },
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.17,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.bedroom_baby,
                      size: 70,
                      color: Colors.green,
                    ),
                    Text('Farmer',
                        style: TextStyle(fontSize: 20, color: Colors.green))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const RegisterPage(typeUser: 'buyer', phoneNum: '',)));
              },
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.17,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.bedroom_baby, size: 70, color: Colors.green),
                    Text('Buyer/Consumer',
                        style: TextStyle(fontSize: 20, color: Colors.green))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
