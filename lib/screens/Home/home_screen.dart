import 'components/home_header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          HomeHeader(screenWidth: screenWidth),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
                color: const Color(0xFF4A3298),
                borderRadius: BorderRadius.circular(20)),
            child: const Text.rich(
              TextSpan(
                  text: 'A summer Suprise\n',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'Cashback 20%',
                      style: TextStyle(
                        fontSize: 24,
                      fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ),
        ],
      )),
    );
  }
}
