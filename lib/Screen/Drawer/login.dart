import 'package:flutter/material.dart';

import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/Screen/Drawer/register.dart';

import '../../Widget/Widgets.dart';
import '../homePage.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String password;
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  //create the textfieldController
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // User? user=FirebaseAuth.instance.currentUser;
    var doLogin = () {

      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        Flushbar(
          title: 'Invalid Form',
          message: 'Please Complete the form Correctly',
          duration: Duration(seconds: 10),
        )
          ..show(context);
      }
      _formKey.currentState!.save();
      print(email);
      print(password);
      FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then(
              (value){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => homePage()),
                  ),
                );
          }
      ).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });


    };

    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(0.0),
          child: TextButton(
            child: Text(
              "Forgot Password",
              style: TextStyle(fontWeight: FontWeight.w300),),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/reset-password');
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: TextButton(
            child: Text(
              "Sign up",
              style: TextStyle(fontWeight: FontWeight.w300),),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => Register()),
                ),
              );
            },
          ),
        ),

      ],

    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(

                      backgroundImage: AssetImage('assets/EV.jpg'),
                      radius: 60, // Image radius
                    ),
                  ),
                  Divider(
                    height: 70.0,
                    color: Colors.grey[500],
                  ),
                  SizedBox(height: 15.0),
                  Text('Email'),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    onSaved: (value) => email = value.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty ||
                          !RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    decoration: buildInputDecoration(
                        'Enter Email', Icons.email),

                  ),
                  SizedBox(height: 20.0),
                  Text("Password"),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: _passwordController,
                    autofocus: false,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter New Password";
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      } else {
                        return null;
                      }
                    },

                    onSaved: (value) => password = value.toString(),
                    decoration: buildInputDecoration(
                        'Enter Password', Icons.lock),

                  ),
                  SizedBox(height: 20.0),
                  longButtons('Login', doLogin),
                  SizedBox(height: 15.0),
                  forgotLabel

                ],
              )

          ),
        ),
      ),
    );
  }

}