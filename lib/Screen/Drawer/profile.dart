import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widget/styles.dart';
import 'package:myapp/Screen/Drawer/login.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool _isMobile = false;

  @override
  void initState() {
    super.initState();
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
          "My Profile",
          style: headerText,
        ),
      ),
      // body: _isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      body:_buildMobileLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 150.0,
            backgroundImage: AssetImage(
                'assets/Photo2.jpg',
            ),
          ),

          SizedBox(height: 16.0),
          Text(
            'Dhruv Patel',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Email:dhruv@gmail.com',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          Text(
            'Phone:9685743210',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              _logout(context); // Call the logout function on button press
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Center(
      child: Container(
        width: 800.0,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/65.jpg'),
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Email: john.doe@gmail.com',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Phone: +1 (555) 555-1212',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                  SizedBox(width: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement logout functionality here
                    },
                    child: Text('Log Out'),
                  ),
                ],
              ),
            ],
          ),
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

