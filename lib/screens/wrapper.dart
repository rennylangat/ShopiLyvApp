import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/home/home_screen.dart';
import 'package:shopapp/size_config.dart';

import 'login/login.dart';

class Wrapper extends StatefulWidget {
  static String routeName = "/wrapper";
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final user = Provider.of<User>(context);
    if (user.uid != null) {
      return HomeScreen(
        uID: user.uid,
      );
    } else {
      return Login();
    }
  }
}
