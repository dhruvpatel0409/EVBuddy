import 'package:flutter/material.dart';
import 'package:myapp/Screen/Drawer/login.dart';
import 'package:myapp/Widget/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logOut extends StatefulWidget {
  const logOut({super.key});

  @override
  State<logOut> createState() => _logOutState();
}

class _logOutState extends State<logOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: 40,
            color: Color.fromRGBO(26, 116, 226, 1),
          ),
        ),
        title: Text(
        "LogOut",
          style: headerText,
        ),

      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Thank You For Using EVBuddy....',
              ),
              SizedBox(height:30),
              ElevatedButton(
                onPressed: () {
                  _logout(context); // Call the logout function on button press
                },
                child: Text('Logout'),

              ),
              SizedBox(height:30),

            ],

          ),
      ),
    );
  }
}
void _logout(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear(); // Clear any stored data, such as user token, from SharedPreferences

  // Navigate to login page
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => Login()),
    ),
  );
}
