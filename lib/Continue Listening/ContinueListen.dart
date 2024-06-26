import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_final_project/Music%20Player/Music.dart';

class ContinuListen extends StatefulWidget {
  const ContinuListen({super.key});

  @override
  State<ContinuListen> createState() => _ContinuListenState();
}

class _ContinuListenState extends State<ContinuListen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _clearSearch() {
    _searchController.clear();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToMusic(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AudioPlayerBackgroundPlaylist()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Continue Listening",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text("See More"),
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
                                "Podcast Title",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Podcast Author",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                              Text(
                                "15 min",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => _navigateToMusic(context),
                          child: Icon(
                            Icons.play_circle,
                            color: Colors.purpleAccent,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPodcastCard("assets/image/1.png", "Mind of an Entrepreneur", "Business"),
                _buildPodcastCard("assets/image/2.png", "Unravelling the Mind", "Healthy Lifestyle"),
              ],
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

  Widget _buildPodcastCard(String imagePath, String title, String subtitle) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15), bottom: Radius.circular(0)),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.black54,
            width: double.infinity,
            padding: const EdgeInsets.all(4.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Container(
            color: Colors.black54,
            width: double.infinity,
            padding: const EdgeInsets.all(4.0),
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
