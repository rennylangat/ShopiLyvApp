import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/screens/single_item/single_item_screen.dart';
import 'package:shopapp/size_config.dart';

class Body extends StatefulWidget {
  final String uID;

  const Body({Key key, this.uID}) : super(key: key);

  @override
  _BodyState createState() => _BodyState(uID);
}

class _BodyState extends State<Body> {
  String uID;

  _BodyState(this.uID);
  List items = [];
  var docNames = [];

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> inventory = FirebaseFirestore.instance
        .collection("inventory")
        .doc(uID)
        .collection("items")
        .snapshots();

    return SafeArea(
        child: SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
        stream: inventory,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          items = snapshot.data.docs;

          print(snapshot.data.docs[0]["name"]);
          return new Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Text("Inventory",
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(36),
                          color: Colors.black)),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Container(
                    color: Colors.grey.shade300,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Product",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Muli",
                              fontWeight: FontWeight.w900,
                              fontSize: getProportionateScreenHeight(14)),
                        )),
                        Expanded(
                            child: Text("Desc",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Muli",
                                    fontWeight: FontWeight.w900,
                                    fontSize:
                                        getProportionateScreenHeight(14)))),
                        Expanded(
                            child: Text("Price",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "Muli",
                                    fontSize:
                                        getProportionateScreenHeight(14)))),
                        Expanded(
                            child: Text("Buy",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Muli",
                                    fontWeight: FontWeight.w900,
                                    fontSize:
                                        getProportionateScreenHeight(14)))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight * 0.8,
                    child: ListView.builder(
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {},
                            leading: null,
                            title: Row(
                              children: <Widget>[
                                Expanded(child: Text(items[index]["name"])),
                                Expanded(
                                    child: Text(
                                  items[index]["desc"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Muli",
                                  ),
                                )),
                                Expanded(
                                    child: Text(
                                  "Kes " + items[index]["price"].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Muli",
                                  ),
                                )),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        //Get Document ids to list and pass them to next screen

                                        FirebaseFirestore.instance
                                            .collection("inventory")
                                            .doc(uID)
                                            .collection("items")
                                            .get()
                                            .then((querysnapshot) {
                                          docNames =
                                              querysnapshot.docs.map((e) {
                                            return e.id;
                                          }).toList();
                                        }).catchError((onError) {
                                          //print(onError);
                                        });

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleItemScreen()));
                                      },
                                      icon: Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.blue,
                                      )),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ));
        },
      ),
    ));
  }
}
