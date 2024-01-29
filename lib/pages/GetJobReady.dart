import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(GetJobReady());
}

class GetJobReady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Job Ready',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> videoLinks = [
    'https://www.youtube.com/watch?v=video_id_1',
    'https://www.youtube.com/watch?v=video_id_2',
    // Add more video links as needed
  ];

  final List<String> videoTitles = [
    'Title 1',
    'Title 2',
    // Add more video titles as needed
  ];

  final List<String> videoSubtitles = [
    'Subtitle 1',
    'Subtitle 2',
    // Add more video subtitles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Job Ready'),
      ),
      body: CarouselSlider.builder(
        itemCount: videoLinks.length,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return VideoCard(
            videoLink: videoLinks[index],
            videoTitle: videoTitles[index],
            videoSubtitle: videoSubtitles[index],
          );
        },
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String videoLink;
  final String videoTitle;
  final String videoSubtitle;

  VideoCard({
    required this.videoLink,
    required this.videoTitle,
    required this.videoSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoLink) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Column(
      children: [
        Container(
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                videoTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                videoSubtitle,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
