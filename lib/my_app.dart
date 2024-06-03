import 'package:demo_prooject1/login_page/auth_page.dart';
import 'package:demo_prooject1/shop/cart_page.dart';
import 'package:demo_prooject1/login_page/forgot_pw_page.dart';
import 'package:demo_prooject1/shop/home_page.dart';
import 'package:demo_prooject1/login_page/login_page.dart';
import 'package:demo_prooject1/login_page/register_page.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const AuthPage(),
      routes: {
        '/auth_page': (context)=> const AuthPage(),
        '/home_page': (context)=> const HomePage(),
        '/cart_page': (context)=> const CartPage(),
        '/login_page': (context)=>LoginPage(),
        '/register_page': (context)=>RegisterPage(),
        '/forgot_password_page':(context)=>const ForgotPasswordPage(),

      },
    );
  }
}



