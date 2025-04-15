import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';


class MusicScreen extends StatefulWidget {
  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;

  String songUrl =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'; // You can change this

  @override
  void initState() {
    super.initState();
    player.setUrl(songUrl);
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Now Playing")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://images.unsplash.com/photo-1511376777868-611b54f68947',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'SoundHelix Song 1',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause_circle : Icons.play_circle,
                  size: 64),
              onPressed: togglePlayPause,
            ),
          ],
        ),
      ),
    );
  }
}
