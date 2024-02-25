import 'package:fire_alarm_system/utils/locations.dart';
import 'package:fire_alarm_system/utils/my_api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
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
      return location;
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
        List<Location> sortedLocations =
            sortLocationsByDistance(_currentLocation!, Location.positions);
        // for (int i = 0; i < sortedLocations.length; i++){
        //   debugPrint(sortedLocations[i].name);
        // }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(
              sortedLocation: sortedLocations,
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
      appBar: AppBar(
        title: const Text(
          'Smart Fire Alarm',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ManualPage(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/Images/fire_pic.jpg'), // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                        child: Text(
                          'Fire Safety Tips',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
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
                  child: const Text('Map'),
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
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 230,
                child: ElevatedButton(
                  onPressed: () async {
                    SMSService smsService = SMSService();

                    // Call sendAlarmSMS method with current location
                    await smsService.sendAlarmSMS([
                      '+251974437198',
                    ], _currentLocation);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 203, 30, 18),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Row(
                    children: [
                      Icon(Icons.message),
                      Spacer(),
                      Text(
                        'Emergency Contacts',
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Image.asset('assets/Images/fire_pic2.jpg'),
          ListTile(
            title: const Text(
              "Home",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingPage(),
                  ));
            },
          ),
          ListTile(
            title: const Text(
              "Map",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                      latitude: 0,
                      longitude: 0,
                      sortedLocation: [],
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
