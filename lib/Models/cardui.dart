import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class StationCard extends StatelessWidget {
  final String name;
  final String location;
  final int phone;
  final double lat;
  final double long;
  const StationCard({
    Key? key,
    required this.name,
    required this.location,
    required this.phone,
    required this.lat,
    required this.long,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MapsLauncher.launchQuery((name + location).toString());
      },
      child: Column(
        children: [
          Card(
            elevation: 8,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/car.png"), fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(location),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              phone.toString(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
