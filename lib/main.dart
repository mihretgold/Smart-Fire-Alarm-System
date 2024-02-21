import 'package:fire_alarm_system/osm_map.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fire_alarm_system/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0; // Index of the current tab
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManualPage(),
                      ));
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
                builder: (context) => const OsmMap(),
              ),
            );
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
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

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          "About Us",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/Images/poster.jpg'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Group Members",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/female.png", name: "Mihret Agegnehu"),
            SizedBox(
              height: 20,
            ),
            Profile(
                image: "assets/Images/female.png", name: "Samrawit Tsegaye"),
            SizedBox(
              height: 20,
            ),
            Profile(
                image: "assets/Images/male.png",
                name: "Fikiresilase Kelemework"),
            SizedBox(
              height: 20,
            ),
            Profile(image: "assets/Images/male.png", name: "Novel Yeshitla"),
            SizedBox(
              height: 20,
            ),
            Profile(image: "assets/Images/male.png", name: "Fiseha Teklu "),
            SizedBox(
              height: 20,
            ),
            Profile(image: "assets/Images/male.png", name: "Kirubel Teklay "),
            SizedBox(
              height: 20,
            ),
            Profile(image: "assets/Images/male.png", name: "Yafet Mulugeta "),
            SizedBox(
              height: 20,
            ),
            Profile(image: "assets/Images/male.png", name: "Hamim Muhammed "),
            SizedBox(
              height: 20,
            ),
            Profile(image: "assets/Images/male.png", name: "Haile Mekonen "),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String name;
  final String image;
  const Profile({required this.image, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(
            name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ManualPage extends StatefulWidget {
  const ManualPage({super.key});

  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  final FlutterTts flutterTts = FlutterTts();
  final text = "Hi";

  speak(text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Manual",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: () async {
                await speak(manualText);
              },
              icon: const Icon(Icons.volume_up_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        backgroundColor: const Color.fromARGB(255, 203, 30, 18),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/Images/fire_pic.jpg',
            width: double.infinity,
            height: 250,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Smart Fire Alarm",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Congratulations on your purchase of the Smart Fire Alarm system! This innovative product is designed to provide you with an enhanced level of fire detection and notification. Please read this user manual thoroughly to ensure proper setup and usage.',
                  ),
                  TextSpan(
                    text: '\n\nTable of Contents',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        '\n\n1. Introduction\n\nOverview:\n\nThe Smart Fire Alarm system is a state-of-the-art fire detection and notification solution. It integrates advanced sensors, communication modules, and a user-friendly mobile application to enhance your safety.',
                  ),
                  TextSpan(
                    text:
                        '\n\n2. Components and Accessories\n\nList of Components:\nFlame Sensor\nBuzzer\nGSM Module (SIM900A)\nArduino Board\nPower Supply\nRelay Module (optional for activating external devices)\nMQ-2 Gas Sensor (optional for additional smoke detection)\nConnecting Wires',
                  ),
                  TextSpan(
                    text:
                        '\n\nAdditional Accessories:\nSmartphone with the dedicated Smart Fire Alarm mobile app.\nSIM Card (compatible with GSM module).',
                  ),
                  TextSpan(
                    text:
                        '\n\n3. Getting Started\nPowering On the System:\nConnect the system to a stable power source using the provided power supply.\nEnsure all connections are secure.\nThe system will initiate with a startup sequence.',
                  ),
                  TextSpan(
                    text:
                        '\n\nSystem Initialization:\nWait for the system to complete the initialization process. Once initialized, the Smart Fire Alarm is ready for operation.',
                  ),
                  // Add more sections as needed
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
