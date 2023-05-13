import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screen/Drawer/SlotConfirm.dart';
import 'package:myapp/flutter_flow/flutter_flow_util.dart';
import 'package:intl/intl.dart';

import '../../Widget/styles.dart';

class BookSlotPage extends StatefulWidget {

  @override
  _BookSlotPageState createState() => _BookSlotPageState();
}

class _BookSlotPageState extends State<BookSlotPage> {

  DateTime selectedDate=DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedStation = 'EV Cosmos Charging Station';
  late String _vehicleMake;
  late String _vehicleModel;
  late String _vehicleLicensePlate;

  List<String> stationList = ['EV Cosmos Charging Station',
    'REVive Charging Station',
    'Electric Vehicle Charging Station',
    'JBS Electric',
    'Joy electric vehicles',
    'ChargeEver Solutions LLP',
    'ChargeZone Charging Station',
    'BOLT Charging Station',
    'Gocharge Charging Station',
    'Jio-bp Pulse Charging Station',
    'Capital EV Charging Station',
    'Charge And Drive Charging Station',
    'TATA Charging station',
    'BlueCharge Charging Station'
  ];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  Future<void> _bookSlot() async {
    try {
      await _firestore.collection('bookings').add({
        'station': selectedStation,
        'date': selectedDate.toString(),
        'time': selectedTime.toString(),
        'Car Make':_vehicleMake.toString(),
        'Car Model':_vehicleModel.toString(),
        'Plate Number':_vehicleLicensePlate,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booking successful!'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => SlotInformationPage(chargingStationName: selectedStation, slotDate: selectedDate, slotTime: selectedTime)
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Book a Slot",
          style: headerText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Date and Time:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _selectTime(context),
                      child: Text('${selectedTime.hour}:${selectedTime.minute}'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Select Station:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              DropdownButton<String>(
                value: selectedStation,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedStation = newValue!;
                  });
                },
                items: stationList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 40),
              Text(
                'Enter Vehicle Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Make',
                ),
                onChanged: (value) {
                  setState(() {
                    _vehicleMake = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Model',
                ),
                onChanged: (value) {
                  setState(() {
                    _vehicleModel = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'License Plate',
                ),
                onChanged: (value) {
                  setState(() {
                    _vehicleLicensePlate = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _bookSlot,
                  child: Text('Book Slot'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
