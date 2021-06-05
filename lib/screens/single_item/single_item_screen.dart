import 'package:flutter/material.dart';
import 'package:shopapp/screens/cart/components/body.dart';

class SingleItemScreen extends StatefulWidget {
  const SingleItemScreen({Key key}) : super(key: key);

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
