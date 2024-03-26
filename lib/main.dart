import 'package:flutter/material.dart';
import 'package:ecomflutter/routes.dart';
import 'package:ecomflutter/constants/colors.dart';
import 'package:ecomflutter/screens/splash/splash_screen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future<void> main() async {
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: textColor,
        ),
        gapPadding: 10);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Muli",
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: textColor),
          bodyMedium: TextStyle(color: textColor),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      // home: const Home(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}