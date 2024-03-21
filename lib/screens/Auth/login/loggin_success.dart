import 'package:flutter/material.dart';
import 'package:ecomflutter/screens/Home/home_screen.dart';

class LogInSuccess extends StatefulWidget {
  const LogInSuccess({Key? key}) : super(key: key);
  static String routeName = '/LogIn';

  @override
  State<LogInSuccess> createState() => _LogInSuccessState();
}

class _LogInSuccessState extends State<LogInSuccess> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
      ),
      body: Column(
        children: [
          SizedBox(height: screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: screenHeight * 0.6,
          ),
          SizedBox(height: screenHeight * 0.08),
          const Text(
            'Loggin Success',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
