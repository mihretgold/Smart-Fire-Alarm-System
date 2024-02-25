import 'package:fire_alarm_system/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void navigateToLogin() {
    Timer(const Duration(seconds: 4), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    navigateToLogin();
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
         
        ],
      ),
    );
  }

  
}
