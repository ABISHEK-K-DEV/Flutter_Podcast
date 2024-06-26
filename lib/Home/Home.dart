import 'package:flutter/material.dart';
import 'package:flutter_final_project/Trending/Trending.dart';
import 'dart:ui';

import 'package:flutter_final_project/liked%20Podcasts/LikedPodcasts.dart';

class MergePage extends StatefulWidget {
  const MergePage({super.key});

  @override
  State<MergePage> createState() => _MergePageState();
}

class _MergePageState extends State<MergePage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _clearSearch() {
    _searchController.clear();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Trending()),
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
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.purpleAccent),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.purpleAccent),
                    onPressed: _clearSearch,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
              SizedBox(height: 20),
              Text("Promoted Podcasts"),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image/Min.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("Trending Podcasts"),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See More",
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              for (int i = 0; i < 10; i++)
                Container(
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
                      Column(
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
                      Icon(
                        Icons.play_circle,
                        color: Colors.purpleAccent,
                        size: 50,
                      ),
                    ],
                  ),
                ),
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
              for (int i = 0; i < 10; i++)
                Container(
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
                      Icon(
                        Icons.play_circle,
                        color: Colors.purpleAccent,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPodcastCard("assets/image/1.png",
                      "Mind of an Entrepreneur", "Business"),
                  _buildPodcastCard("assets/image/2.png",
                      "Unravelling the Mind", "Healthy Lifestyle"),
                ],
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
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(15), bottom: Radius.circular(0)),
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
