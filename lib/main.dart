// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/pages/main_page.dart';
import 'package:flutter_interview_test/providers/cart_provider.dart';
import 'package:flutter_interview_test/providers/menu_provider.dart';
import 'package:flutter_interview_test/providers/voucher_provider.dart';
import 'package:provider/provider.dart';

import 'pages/cart_page.dart';
import 'pages/menu_page.dart';
import 'providers/checkout_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VoucherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(),
          '/cart': (context) => CartPage(),
          '/menu': (context) => MenuPage(),
        },
      ),
    );
  }
}
