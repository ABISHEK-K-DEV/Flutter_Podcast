import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_final_project/Profile/Profile.dart';

class AudioPlayerBackgroundPlaylist extends StatefulWidget {
  @override
  _AudioPlayerBackgroundPlaylistState createState() =>
      _AudioPlayerBackgroundPlaylistState();
}

class _AudioPlayerBackgroundPlaylistState
    extends State<AudioPlayerBackgroundPlaylist> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    setupPlaylist();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void setupPlaylist() async {
    await audioPlayer.open(
      Playlist(audios: [
        Audio.network(
            'https://archive.org/download/WizKhalifaSeeYouAgainFt.CharliePuthOfficialVideoFurious7Soundtrack_201506/Wiz%20Khalifa%20-%20See%20You%20Again%20ft.%20Charlie%20Puth%20%5BOfficial%20Video%5D%20Furious%207%20Soundtrack.mp3',
            metas: Metas(title: 'See You Again', artist: 'Wiz Khalifa ft. Charlie Puth')),

        Audio.network(
            'https://archive.org/download/VilluDaddyMummy_20150113/Villu%20-%20Daddy%20Mummy.mp3',
            metas: Metas(title: 'Daddy Mummy', artist: 'Villu')),
        Audio.network(
            'https://archive.org/download/mrghta/02%20-%20Maragatha%20Naanayam%20-%20Nee%20Kavithaigala%20%5BMaango.info%5D.mp3',
            metas: Metas(title: 'Nee Kavithaigala', artist: 'Pradeep Kumar')),
      ]),
      autoStart: false,
      loopMode: LoopMode.playlist,
    );
  }

  Widget audioPlayerUI(RealtimePlayingInfos realtimePlayingInfos) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          realtimePlayingInfos.current?.audio.audio.metas.title ?? '',
          style: TextStyle(color: Colors.purpleAccent, fontSize: 25),
        ),
        SizedBox(height: 10),
        Text(
          realtimePlayingInfos.current?.audio.audio.metas.artist ?? '',
          style: TextStyle(color: Colors.pink, fontSize: 15),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getTimeText(realtimePlayingInfos.currentPosition),
            Expanded(
              child: linearProgressBar(realtimePlayingInfos.currentPosition,
                  realtimePlayingInfos.duration),
            ),
            getTimeText(realtimePlayingInfos.duration),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous_rounded),
              onPressed: () => audioPlayer.previous(),
              iconSize: 60,
              color: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            IconButton(
              icon: Icon(
                realtimePlayingInfos.isPlaying
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_fill_rounded,
              ),
              onPressed: () => audioPlayer.playOrPause(),
              iconSize: 60,
              color: Colors.purpleAccent,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            IconButton(
              icon: Icon(Icons.skip_next_rounded),
              onPressed: () => audioPlayer.next(),
              iconSize: 60,
              color: Colors.lightBlue,
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
          ],
        )
      ],
    );
  }

  Widget linearProgressBar(Duration currentPosition, Duration duration) {
    double percent =
    (currentPosition.inSeconds / duration.inSeconds).clamp(0.0, 1.0);
    if (percent.isNaN) percent = 0.0;

    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: LinearProgressIndicator(
        value: percent,
        backgroundColor: Colors.grey,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  Widget getTimeText(Duration duration) {
    return Text(
      transformString(duration.inSeconds),
      style: TextStyle(color: Colors.white),
    );
  }

  String transformString(int seconds) {
    String minuteString = '${(seconds ~/ 60).toString().padLeft(2, '0')}';
    String secondString = '${(seconds % 60).toString().padLeft(2, '0')}';
    return '$minuteString:$secondString';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Profile()),
              );
            },
            icon: Icon(Icons.settings),
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
              Positioned(
                bottom: -350,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
        child: audioPlayer.builderRealtimePlayingInfos(
          builder: (context, realtimePlayingInfos) {
            if (realtimePlayingInfos != null) {
              return audioPlayerUI(realtimePlayingInfos);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
