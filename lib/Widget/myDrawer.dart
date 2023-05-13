import 'package:flutter/material.dart';
import 'package:myapp/Screen/Drawer/eviePotins.dart';
import 'package:myapp/Screen/Drawer/helpCenter.dart';
import 'package:myapp/Screen/Drawer/history.dart';
import 'package:myapp/Screen/Drawer/howToUse.dart';
import 'package:myapp/Screen/Drawer/myCar.dart';
import 'package:myapp/Screen/Drawer/myPayment.dart';
import 'package:myapp/Screen/Drawer/logOut.dart';
import 'package:myapp/Screen/Drawer/profile.dart';
import 'package:myapp/Screen/Drawer/contact.dart';

import 'package:myapp/Widget/styles.dart';

import '../Screen/Drawer/BookSlot.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<myDrawer> {

  final List<Widget> Members = [
    myPayment(),
    myCar(),
    BookSlotPage(),
    eviePoints(),
    helpCenter(),
    contact(),
    howToUse(),
    logOut(),


  ];

  final List<Widget> Guest = [
    helpCenter(),
    howToUse(),
  ];




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(context, Members),
              menuItem(context, Members),
            ],
          ),
        ),
      ),
    );
  }
}

Widget header(BuildContext context, List<Widget> name) {
  return Container(
    child: Column(
      children: [
        // Back Arrow
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 45,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
        name.length > 7
            // Member Profile header
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => UserProfilePage()),
                  );
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ),
                    Text(
                      "Profile",
                      style: ProfileDrawerText,
                    )
                  ],
                ),
              )
            // Geust header
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: 250,
                      height: 55,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Sign in to Evie",
                          style: itemWhiteDrawerText,
                        ),
                      ),
                    ),
                  )
                ],
              )
      ],
    ),
  );
}

Widget menuItem(BuildContext context, List<Widget> name) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: name.length,
    itemBuilder: (BuildContext context, int index) {
      Widget item = name[index];
      String title = '';

      if (item is myPayment) {
        title = 'My Payment Methods';
      } else if (item is myCar) {
        title = 'My Car';
      } else if (item is eviePoints) {
        title = 'Evie Points';
      }else if(item is contact){
        title='contact Us';
      }
      else if (item is helpCenter) {
        title = 'Help Center';
      } else if (item is howToUse) {
        title = 'How to use';
      } else if (item is logOut) {
        title = 'LogOut';
      }
      else if(item is BookSlotPage){
        title='Book a Slot';
      }

      return ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => name[index]),
          );
        },
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            title,
            style: itemDrawerText,
          ),
        ),
      );
    },
  );
}
