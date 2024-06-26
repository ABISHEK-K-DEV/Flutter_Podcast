import 'package:flutter/material.dart';
import 'package:flutter_final_project/Home/Home.dart';
import 'dart:ui';

import 'package:flutter_final_project/MergedPage/MergePage.dart';
import 'package:flutter_final_project/Music%20Player/Music.dart';

class LikedPodcast extends StatefulWidget {
  const LikedPodcast({super.key});

  @override
  State<LikedPodcast> createState() => _LikedPodcastState();
}

class _LikedPodcastState extends State<LikedPodcast> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _clearSearch() {
    _searchController.clear();
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active, color: Colors.redAccent),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Liked Podcasts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "See Mama Be",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Creative Studio",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              Text(
                                "15 min",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AudioPlayerBackgroundPlaylist()),
                              );
                            },
                            icon: Icon(
                              Icons.play_circle,
                              color: Colors.purpleAccent,
                              size: 50,
                            )),
                        // Icon(
                        //   Icons.play_circle,
                        //   color: Colors.purpleAccent,
                        //   size: 50,
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
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
                      icon: Icon(Icons.discord),
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
                  onTap: _onItemTap,
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
