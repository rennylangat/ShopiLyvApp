import 'package:flutter/material.dart';
import 'package:shopapp/screens/cart/cart_screen.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";
  final String uID;

  const HomeScreen({Key key, this.uID}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(uID);
}

class _HomeScreenState extends State<HomeScreen> {
  String uID;
  _HomeScreenState(this.uID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Body(
        uID: uID,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CartScreen()));
        },
        label: const Text(
          "View Cart",
          style: TextStyle(
            fontFamily: "Muli",
          ),
        ),
      ),
    );
  }
}
