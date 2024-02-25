import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  final double latitude;
  final double longitude;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 3.2,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(widget.latitude, widget.longitude),
                    width: 80,
                    height: 80,
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                  ),
                  const Marker(
                    //Akaki Kality
                    point: LatLng(8.871546, 38.788999),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Akaki Kality",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    //Nefas Silk
                    point: LatLng(8.948606, 38.7649),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Nefas Silk",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    //Nefas Silk
                    point: LatLng(9.006456, 38.681882),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Bethel",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    //Nefas Silk
                    point: LatLng(8.973223, 38.760955),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Kirkos",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    //Nefas Silk
                    point: LatLng(9.05759, 38.713312),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Main",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    point: LatLng(9.033437, 38.724256),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Addis Ketema",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    point: LatLng(9.037573, 38.75321),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Addis HeadQuarter",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    point: LatLng(9.037687, 38.753776),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Arada",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const Marker(
                    //Nefas Silk
                    point: LatLng(9.05759, 38.713312),
                    width: 80,
                    height: 80,
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.red,
                        ),
                        Text(
                          "Tigist",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

