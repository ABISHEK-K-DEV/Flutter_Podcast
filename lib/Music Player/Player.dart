import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscape = screenSize.width > screenSize.height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/image/logo.jpg"),
          ),
        ),
        title: Text(
          "AK CAST",
          style: TextStyle(
            fontSize: 36,
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
            child: Center(
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: screenSize.height * 0.5,
                    width: screenSize.width * 0.8,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purpleAccent,
                          Colors.deepPurple,
                          Colors.deepPurpleAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    top: screenSize.height * 0.05,
                    child: Container(
                      height: screenSize.height * 0.4,
                      width: screenSize.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/image/logo.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Import the dart:ui library for ImageFilter
                  Positioned(
                    bottom:
                        -25, // Adjust this value based on your design requirements
                    child: ClipRRect(
                      // ClipRRect to apply rounded corners to the blur effect
                      borderRadius: BorderRadius.circular(30),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10, sigmaY: 10), // Apply blur effect
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(
                                0.2), // Set transparency with a bit lower opacity
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceEvenly, // Evenly space icons
                            children: [
                              Icon(Icons.share),
                              Icon(Icons.favorite),
                              Icon(Icons.archive_outlined),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //Blur container
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sunday Vibes  - Rift",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Entitesdkvds", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text("07.00"),
                Spacer(),
                Text("15.00"),
              ],
            ),
          ),


          // Expanded(
          //   child: Column(
          //     children: [
          //       Text("sdhshjvvjcvd"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
