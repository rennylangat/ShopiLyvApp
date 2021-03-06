import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/components/auth_services.dart';
import 'package:shopapp/screens/home/home_screen.dart';
import 'package:shopapp/size_config.dart';

class Login extends StatelessWidget {
  static String routeName = "/login";

  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginProvider = Provider.of<AuthServices>(context);
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  Text(
                    "Welcome to the Shop App. Login to continue",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  MaterialButton(
                      color: Colors.blue.shade50,
                      onPressed: () async {
                        await _loginProvider.sigIn(context: context);
                        final user = Provider.of<User>(context, listen: false);
                        if (user.uid != null) {
                          print(user.uid);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(uID: user.uid)),
                              (route) => false);
                        }
                      },
                      child: Text(
                        "Login with Google",
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(18),
                          color: Colors.red,
                        ),
                      ))
                ]),
          ),
        ),
      ),
    ));
  }
}
