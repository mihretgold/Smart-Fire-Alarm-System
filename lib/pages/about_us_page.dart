import 'package:flutter/material.dart';

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
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/female.png", name: "Samrawit Tsegaye"),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/male.png",
                name: "Fikiresilase Kelemework"),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/male.png", name: "Novel Yeshitla"),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/male.png", name: "Fiseha Teklu "),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/male.png", name: "Kirubel Teklay "),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/male.png", name: "Yafet Mulugeta "),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/male.png", name: "Hamim Muhammed "),
            const SizedBox(
              height: 20,
            ),
            const Profile(
                image: "assets/Images/male.png", name: "Haile Mekonen "),
            const SizedBox(
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
