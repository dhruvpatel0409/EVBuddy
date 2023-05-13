import 'package:flutter/material.dart';
import '../../Models/CarDetails.dart';
import '../../Models/car.dart';
import '../../Widget/styles.dart';
class ElectricCar{

  final String name;
  final String brand;
  final String image;
  final int range;
  final double acceleration;
  final int topSpeed;
  final int price;

  ElectricCar({
    required this.name,
    required this.brand,
    required this.image,
    required this.range,
    required this.acceleration,
    required this.topSpeed,
    required this.price,
  }) ;
}
class myCar extends StatelessWidget {
  final List<ElectricCar> electricCars = [
    ElectricCar(
      name: 'Tesla Model S',
      brand: 'Tesla',
      image: 'assets/Tesla.webp',
      range: 402,
      acceleration: 2.4,
      topSpeed: 200,
      price: 79990,
    ),
    ElectricCar(
      name: 'Audi e-tron GT',
      brand: 'Audi',
      image: 'assets/Audi.webp',
      range: 238,
      acceleration: 3.1,
      topSpeed: 149,
      price: 99900,
    ),
    ElectricCar(
      name: 'Ford Mustang Mach-E',
      brand: 'Ford',
      image: 'assets/Ford.jpg',
      range: 300,
      acceleration: 3.5,
      topSpeed: 124,
      price: 42995,
    ),
    ElectricCar(
      name: 'Porsche Taycan',
      brand: 'Porsche',
      image: 'assets/Porsche.webp',
      range: 227,
      acceleration: 2.4,
      topSpeed: 161,
      price: 81000,
    ),
    ElectricCar(
      name: 'Kia EV6',
      brand: 'Kia',
      image: 'assets/Kia.jpg',
      range: 338,
      acceleration:4.6,
      topSpeed: 190,
      price:600000,
    ),
    ElectricCar(
      name: 'Tata Tiago EV',
      brand: 'Tata',
      image: 'assets/Tata.jpeg',
      range: 315,
      acceleration:6.2,
      topSpeed: 200,
      price:800000,
    ),
    ElectricCar(
      name: 'BMW iX',
      brand: 'BMW',
      image: 'assets/BMW.webp',
      range: 425,
      acceleration:4.0,
      topSpeed: 250,
      price:16000000,
    ),
    ElectricCar(
      name: 'Hyundai Kona Electric',
      brand: 'Hyundai',
      image: 'assets/Hyundai.jpg',
      range:452 ,
      acceleration:7.5,
      topSpeed:160,
      price:2400000,
    ),
    ElectricCar(
      name: 'Mahindra XUV400 EV',
      brand: 'Mahindra',
      image: 'assets/Mahindra.jpg',
      range:375,
      acceleration:8.3,
      topSpeed:160,
      price:2000000,
    ),
    ElectricCar(
      name: 'Citroen eC3',
      brand: 'Citroen',
      image: 'assets/Citroen.jpeg',
      range:320,
      acceleration:8.3,
      topSpeed:120,
      price:1300000,
    ),
    ElectricCar(
      name: 'BYD E6',
      brand: 'BYD',
      image: 'assets/BYD.jpeg',
      range:415,
      acceleration:8.0,
      topSpeed:130,
      price:3000000,
    ),
  ];

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
          "Electric Cars",
          style: headerText,
        ),
      ),
      body: ListView.builder(
        itemCount: electricCars.length,
          itemBuilder: (BuildContext context, int index){
            ElectricCar car = electricCars[index];
            return GestureDetector(
                onTap: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context) => CarDetailsPage(car: car)),
              // );
            },
            child: Container(
              height: 120,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(car.image, height: 120,width: 120,fit: BoxFit.cover,),
                  SizedBox(width: 16),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              car.name,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              car.brand,
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                children: [
                                  Icon(Icons.speed),
                                  SizedBox(width: 4),
                                  Text(
                                    '${car.topSpeed} km/h',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(width: 16),
                                  Icon(Icons.battery_charging_full),
                                  SizedBox(width: 4),
                                  Text(
                                    '${car.range} km',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(width: 16),
                                  Icon(Icons.speed),
                                  SizedBox(width: 4),
                                  Text(
                                    '${car.acceleration}s',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],

                            ),
                              ),
                          ],
                        ),
                      )
                  )

                ],
              )
            ),
            );

          },
      ),
    );
  }
}

