import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Widget/Widgets.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String username, e_mail, mobile;
  String? password,confirmpd;

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  bool agree = false;

  // void _doSomething(){
  //
  // }
  //create the textfieldController
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _confirmpdController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var doRegister = () {
      // onPressed: agree ? _doSomething : null;
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        Flushbar(
          title: 'Invalid Form',
          message: 'Please Complete the form Correctly',
          duration: Duration(seconds: 10),
        )..show(context);
      }
      _formKey.currentState!.save();
      print(username);
      print(e_mail);
      print(password);
      print(mobile);
      print(confirmpd);
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then(
              (value){
            print("Created New Account");
            final snackBar = SnackBar(
              content: const Text('Registration Done Successfully!'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.pushReplacementNamed(context, '/login');
          }
      ).onError((error, stackTrace) {
        print("Error ${error.toString()}");
      });

    };
    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0),
                  Text('Username'),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    onSaved: (value) => username = value.toString(),
                    decoration: buildInputDecoration(
                        "Enter Username", Icons.account_circle),
                    validator: (value) =>
                    value == null || value.length < 4
                        ? 'Name must be more than 3 charater'
                        : null,

                  ),
                  SizedBox(height: 15.0),
                  Text('Email'),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _emailController,
                    autofocus: false,
                    validator: (value) {
                      if (value == null || value.isEmpty ||
                          !RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    onSaved: (value) => e_mail = value.toString(),
                    decoration: buildInputDecoration(
                        "Enter Email", Icons.email),
                  ),
                  SizedBox(height: 15.0),
                  Text('Mobile No'),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.phone,
                    controller: _mobileController,
                    onSaved: (value) => mobile = value.toString(),
                    validator: (value) =>
                    value == null || value.length != 10
                        ? "Mobile Number must be of 10 Digits"
                        : null,
                    maxLength: 10,
                    decoration: buildInputDecoration(
                        "Enter Mobile No", Icons.phone),
                  ),
                  SizedBox(height: 10.0),
                  Text("Password"),
                  SizedBox(height: 10.0),
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
                  SizedBox(height: 15.0),
                  Text("Confirm Password"),
                  SizedBox(height: 10.0),
                  TextFormField(
                    autofocus: false,
                    obscureText: true,
                    controller: _confirmpdController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Re-Enter New Password";
                      } else if (value.length < 8) {
                        return "Password must be atleast 8 characters long";
                      }
                      //   else if (value!=password) {
                      //   return "Password must be same as above";
                      // }
                      else {
                        return null;
                      }
                    },
                    onSaved: (value) => confirmpd = value.toString(),
                    decoration: buildInputDecoration(
                        'Enter Confirm Password', Icons.lock),

                  ),
                  SizedBox(height: 20.0),
                  Column(
                    children: [
                      Material(
                        child: Checkbox(
                          value: agree,
                          onChanged: (value) {
                            setState(() {
                              agree = value ?? false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'I have read and accept terms and conditions',
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 20.0),
                  longButtons('Register Now', doRegister),

                ],
              ),
            )
        ),
      ),
    );
  }
}