import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart_screen";

  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
