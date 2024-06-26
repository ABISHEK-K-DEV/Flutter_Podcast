import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/Home/Home.dart';
import 'package:flutter_final_project/liked%20Podcasts/LikedPodcasts.dart';

import '../MergedPage/MergePage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isPlaying = false;
  int _selectedIndex = 3; // Assuming the profile is the fourth item

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add navigation logic based on the index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 1:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => DiscordPage()));
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LikedPodcast()),
        );
        break;
      case 3:
      // Do nothing as we are already on the profile page
        break;
    }
  }

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
      body: Padding(
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
                child: Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 25
                        ,),
                      Text(
                        "Abishek",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "22",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LikedPodcast()),
                                  );
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Liked Podcast",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            thickness: 2,
                            width: 40,
                          ),
                          Column(
                            children: [
                              Text(
                                "158",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MergePage()),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.all_inclusive,
                                    color: Colors.white,
                                  )),
                              Text(
                                "Following",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: screenSize.height * 0.05,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/image/logo.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.5),
                child: Column(
                  children: [
                    Text(
                      "Recently Played",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: AssetImage("assets/image/ic.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Podcast Title",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Podcast Author",
                                        style: TextStyle(
                                            color: Colors.grey.shade600),
                                      ),
                                      Text(
                                        "15 min",
                                        style: TextStyle(
                                            color: Colors.grey.shade600),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: _togglePlayPause,
                                  icon: Icon(
                                    isPlaying
                                        ? Icons.pause_circle_filled_rounded
                                        : Icons.play_circle_fill_rounded,
                                  ),
                                  iconSize: 64.0,
                                  color: Colors.purpleAccent,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 105,
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.grey[200]?.withOpacity(0.6),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.headphones_rounded),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.discord_rounded), // Corrected icon
                      label: 'Discord',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Liked',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  selectedItemColor: Colors.purpleAccent,
                  onTap: _onItemTapped,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
