import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    Map m = {};

    m = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      body: Container(
        height: 330,
        padding: EdgeInsets.all(16.0),
        child: Card(
          margin: EdgeInsets.all(16.0),
          color: Colors.cyan,
          child: Center(
            child: ListView(
              children: [
                Center(
                  child: Text(
                    "User Card Number",
                    style: TextStyle(
                        backgroundColor: Colors.grey[200],
                        decorationStyle: TextDecorationStyle.dotted,
                        color: Colors.green,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 22),
                Center(
                  child: Text(
                    "Name: ${m["name"]}",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Card Number: ${m["cardNumber"]}",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Expiry Date: ${m["expiryDate"]}",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Security Code: ${m["securityCode"]}",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "ZipCode: ${m["zipCode"]}",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
