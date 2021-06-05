
import 'package:flutter/cupertino.dart';
import 'package:shopapp/screens/cart/cart_screen.dart';
import 'package:shopapp/screens/home/home_screen.dart';
import 'package:shopapp/screens/login/login.dart';
import 'package:shopapp/screens/single_item/single_item_screen.dart';
import 'package:shopapp/screens/wrapper.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (context) => Login(),
  Wrapper.routeName: (context) => Wrapper(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  SingleItemScreen.routeName:(context)=>SingleItemScreen(),
};
