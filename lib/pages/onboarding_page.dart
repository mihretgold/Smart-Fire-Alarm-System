import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fire_alarm_system/pages/map_page.dart';
import 'package:fire_alarm_system/pages/geo_location_page.dart';
import 'package:fire_alarm_system/pages/manual_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0; // Index of the current tab
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;
  Future<Position?> _getCurrentLocation() async {
    try {
      servicePermission = await Geolocator.isLocationServiceEnabled();

      if (!servicePermission) {
        print("Service Disabled");
        return null; // Indicate error or handle appropriately
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      Position location = await Geolocator.getCurrentPosition();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              latitude: location.latitude,
              longitude: location.longitude,
            ),
          ));
    } catch (e) {
      // Handle exception, e.g., display an error message to the user
      print("Error getting location: $e");
      return null;
    }
  }

  Future<void> _getUserLocation() async {
    try {
      // Check permissions and handle errors as before
      _currentLocation = await _getCurrentLocation();
      if (_currentLocation != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              latitude: _currentLocation!.latitude,
              longitude: _currentLocation!.longitude,
            ),
          ),
        );
      } else {
        // Handle case where location couldn't be retrieved
        return null;
      }
    } catch (e) {
      // Handle exception
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                    // width: double.infinity,
                    // image: DecorationImage(
                    //     image: AssetImage('assets/Images/fire_pic2.jpg'),
                    //     fit: BoxFit.cover),
                    ),
                height: 250,
                width: double.infinity,
              ),
              Positioned(
                top: 130,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  'assets/Svg/flame.svg',
                  height: 150,
                ),

                // child: CircleAvatar(
                //   radius: 100,
                //   child: SvgPicture.asset(
                //     'assets/Svg/flame.svg',
                //     height: 150,
                //   ),
                // ),
                // child: CircleAvatar(
                //   radius: 100,
                //   backgroundImage: AssetImage(
                //     'assets/Images/fire_logo2.png',
                //   ),
                // ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Text(
            "Smart Fire Alarm",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 245, 212, 212),
                shadows: [
                  Shadow(
                    color: const Color.fromARGB(255, 145, 13, 3).withOpacity(1),
                    offset: const Offset(5.0, -2.0),
                    blurRadius: 5.0,
                  )
                ]),
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: SizedBox(
              width: 230,
              child: ElevatedButton(
                onPressed: () async {
                  _getUserLocation();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 203, 30, 18),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: const Text('Manual'),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 230,
              child: ElevatedButton(
                onPressed: () async {
                  _makePhoneCall(
                      '+251974437198'); // Replace with the actual phone number
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 203, 30, 18),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: const Row(
                  children: [
                    Icon(Icons.phone),
                    Spacer(),
                    Text('Call Fire Department'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        // Handle navigation to different tabs
        switch (index) {
          case 0:
            // Home tab (OnboardingPage)
            // You are already on the home tab, no additional action needed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OnboardingPage(),
              ),
            );
            break;
          case 1:
            // Manual tab
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ManualPage(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GeolocationApp(),
              ),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          // icon: Icon(Icons.home),
          icon: Icon(Icons.description),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          // icon: Icon(Icons.home),
          icon: Icon(Icons.description),
          label: 'Manual',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About Us',
        ),
      ],
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber, // Add '#' at the end
    );

    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }
}
