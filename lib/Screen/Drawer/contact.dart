import 'package:flutter/material.dart';
import 'package:myapp/Widget/styles.dart';
import 'package:another_flushbar/flushbar.dart';
import '../Drawer/email_model.dart';

class contact extends StatefulWidget {
  const contact({super.key});

  @override
  State<contact> createState() =>_contactState();
}

class _contactState extends State<contact> {
  final _namecontroller = TextEditingController();
  final _subjectcontroller = TextEditingController();
  final _messagecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

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
          "Contact Us",
          style: headerText,
        ),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      color: Colors.lightBlue,
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.3,
                      bottom: MediaQuery.of(context).size.height * 0.0,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Image.asset(
                          "assets/contact.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      left: 0,
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),

                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          TextFormField(
                            controller: _namecontroller,
                            validator: (_namecontroller) {
                              if (_namecontroller == null ||
                                  _namecontroller.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Full Name",
                            ),
                          ),
                          Divider(
                            height: 10,
                          ),
                          TextField(
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "E-mail",
                            ),
                          ),
                          const Divider(
                            height: 10,
                          ),
                          TextField(
                            controller: _subjectcontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Subject",
                            ),
                          ),
                          const Divider(
                            height: 10,
                          ),
                          TextField(
                            controller: _messagecontroller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: "Message",
                            ),
                            minLines: 10,
                            maxLines: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                              onPressed: () {

                                sendEmail(
                                  name: _namecontroller.text,
                                  email: _emailcontroller.text,
                                  message: _messagecontroller.text,
                                  subject: _subjectcontroller.text,
                                );
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const About(),
                                //   ),
                                // );
                                final snackBar = SnackBar(
                                  content: const Text('Email Send Successfully!!!'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                              child: const Text("Send"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}

