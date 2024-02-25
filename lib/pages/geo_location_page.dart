import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class GeolocationApp extends StatefulWidget {
  const GeolocationApp({super.key});
  @override
  State<GeolocationApp> createState() => _GeolocationAppState();
}

class _GeolocationAppState extends State<GeolocationApp> {
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

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      // Handle exception, e.g., display an error message to the user
      print("Error getting location: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Your Location"),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Location Coordinates",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(

// "${_currentLocation}"

              "Latitude = ${_currentLocation?.latitude} ; Longitude = ${_currentLocation?.longitude}"),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  _currentLocation = await _getCurrentLocation();
                  setState(() {}); // Update UI
                } catch (e) {
                  // Handle exception
                }
              },
              child: const Text('get location'))
        ],
      )),
    );
  }
}
