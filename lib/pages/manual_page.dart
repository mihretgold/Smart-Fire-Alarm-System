import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fire_alarm_system/utils/constants.dart';

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
