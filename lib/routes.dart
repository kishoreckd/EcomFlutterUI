import 'package:flutter/material.dart';
import 'package:ecomflutter/screens/Home/home_screen.dart';
import 'package:ecomflutter/screens/Auth/SignUp/sign_up.dart';
import 'package:ecomflutter/screens/splash/splash_screen.dart';
import 'package:ecomflutter/screens/Auth/login/loggin_success.dart';
import 'package:ecomflutter/screens/Home/product_detail_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  LogInSuccess.routeName: (context) => const LogInSuccess(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
};

