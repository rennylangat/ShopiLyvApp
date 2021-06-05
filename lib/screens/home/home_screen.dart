import 'package:flutter/material.dart';

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
      body: Body(),
    );
  }
}
