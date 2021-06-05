import 'package:flutter/material.dart';
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
    return Login();
  }
}
