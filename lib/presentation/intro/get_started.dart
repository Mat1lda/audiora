import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melody_flow/common/widgets/basic_app_button.dart';
import 'package:melody_flow/presentation/choose_mode/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/start_bg1.png'),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/logo_with_text.png'),
                ),
                const Spacer(),
                const Text(
                  'Enjoying music with us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  'Welcome to Audiora! Dive into a world of music tailored just for you. Discover your favorite songs, explore curated playlists, and stream endless tunes from top artists around the globe. Whether you are here to unwind, energize, or discover something new, we have got the perfect soundtrack waiting. Let’s get started—your music journey begins now!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ChooseModePage(),
                        ));
                  },
                  title: 'Get Started',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
