import 'package:flutter/material.dart';
import 'package:myapp/Widget/styles.dart';
import '../../Models/cards.dart';
import '../../Models/cardui.dart';

class eviePoints extends StatefulWidget {
  const eviePoints({super.key});

  @override
  State<eviePoints> createState() => _eviePointsState();
}

class _eviePointsState extends State<eviePoints> {
  void initState() {
    // AdHelper.myBanner.load();
    super.initState();
  }
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
          "Evie Points",
          style: headerText,
        ),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 112, 210, 255),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/EV.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 5,
                        left: 25,
                        child: Text(
                          "EV Station Buddy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    "Charging Stations",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: ListView.builder(
                    physics: const ScrollPhysics(), // to disable list scrolling
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StationCard(
                        name: charge[index].name,
                        location: charge[index].location,
                        phone: charge[index].phone,
                        lat: charge[index].lat,
                        long: charge[index].lang,
                      );
                    },
                    itemCount: charge.length,
                  ),
                )
              ],
            ),
          ),
        ),

    );
  }
}
