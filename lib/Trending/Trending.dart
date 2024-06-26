import 'package:flutter/material.dart';
import 'package:flutter_final_project/MergedPage/MergePage.dart';
import 'package:flutter_final_project/liked%20Podcasts/LikedPodcasts.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LikedPodcast(

              )),);
            },
            icon: Center(
              child: Icon(
                Icons.arrow_circle_left_sharp,
                size: 30,
                color: Colors.purpleAccent,
              ),
            ),
          ),
        ),
        title: Text(
          "Trending Podcasts",
          style: TextStyle(
            fontSize: 26,
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchField(),
            SizedBox(height: 20),
            _buildPodcastRow(
              [
                _buildPodcastCard("assets/image/1.png", "Mind of an Entrepreneur", "Business"),
                _buildPodcastCard("assets/image/2.png", "Unravelling the Mind", "Healthy Lifestyle"),
              ],
            ),
            SizedBox(height: 20),
            _buildPodcastRow(
              [
                _buildPodcastCard("assets/image/3.png", "A Tale of Writer", "Educational"),
                _buildPodcastCard("assets/image/4.png", "Addiction to Social!", "Sociology"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Recommended For You",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildRecommendedPodcastItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
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
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      ),
    );
  }

  Widget _buildPodcastRow(List<Widget> podcastCards) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: podcastCards,
    );
  }

  Widget _buildPodcastCard(String imagePath, String title, String subtitle) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
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

  Widget _buildRecommendedPodcastItem() {
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
          Icon(
            Icons.play_circle,
            color: Colors.purpleAccent,
            size: 50,
          ),
        ],
      ),
    );
  }
}
