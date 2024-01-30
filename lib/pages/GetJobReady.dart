import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GetJobReady extends StatelessWidget {
  const GetJobReady({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Get Job Ready',
      home: MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> mainTitles = [
    'Dynamic Programming',
    'Query Languages',
    'Programming Languages',
    'Aptitude with Reasoning',
  ];

  final List<List<VideoInfo>> videoData = [
    [
      VideoInfo(
        title: 'Take U Forward by Striver',
        subtitle: 'The playlist aims to teach you Dynamic Programming in depth. The focus of the playlist is to cover all the concepts, and then follow it up with a lot of problems so that the concepts go into your head and stay there.The focus is on logic, so no matter in which language you code, you can easily convert it into code, as we will be writing the pseudocode while teaching.',
        link: 'https://youtu.be/FfXoiwwnxFw?si=p_wBMSoRFz8_qoj',
      ),
      VideoInfo(
        title: 'DP by Aditya Verma',
        subtitle: 'The playlist explains DP in a consise way. Explaining how to approach a dynamic programming problem and moreover how to identify it first',
        link: 'https://youtu.be/nqowUJzG-iM?si=7fy0ylleVCZ5cvZe',
      ),
      VideoInfo(
        title: 'Code help by Babbar Sir',
        subtitle: 'Message by sir :)\nMnn to boht krega k kchor yrr apne se nahi hoga ya maza nahi aara, Just ask 1 question "Why I started"',
        link: 'https://youtu.be/PGsgv6nXhLw?si=NXQjG4AJLsFC1dpV',
      ),
      VideoInfo(
        title: 'I Deserve',
        subtitle: 'Programming Interviews\' Dynamic Programming Problems',
        link: 'https://youtu.be/U4yPae3GEO0?si=Ozm51l9AvwmugEbN',
      ),
      VideoInfo(
        title: 'Code story with MIK',
        subtitle: 'In this playlist we will solve and understand popular problems on DP asked by Top Companies like Amazon, Meta, Google, Microsoft, Adobe, Netflix, and many more ...',
        link: 'https://youtu.be/smTnSl6UKi0?si=oihhK9KDHFXw-xar',
      ),

    ],
    [
      VideoInfo(
        title: 'Structured Query Language By Gate Smashers',
        subtitle: 'Gate Smashers is India\'s no 1 Free education platform for those aspirants who want to just smash the entrance exam like GATE,UGC NET,KVS,NVS,HTET,CTET etc in Computer Science but they are lagging behind due to lack of proper guidance.      This channel is a brainchild of Varun Singla and Naina Wadhwa Singla,they have added smartwork into the long journey of hardwork of students.',
        link: 'https://youtu.be/323H_mOOWQ4?si=ZWgVIYa98EdMpC0O',
      ),
      VideoInfo(
        title: 'PostgreSQL Course by Manish Sharma',
        subtitle: 'Whether you\'re new to PostgreSQL or you\'re already familiar with it, this course will provide you with the knowledge and skills you need to become proficient in using this popular database management system.',
        link: 'https://youtu.be/4wYs94EqeKE?si=0LPvB1ts6Ce2j8b5',
      ),
      VideoInfo(
        title: 'MySQL With Python And Data Science',
        subtitle: 'One of the most concise and apt course for mysql.',
        link: 'https://youtu.be/us1XyayQ6fU?si=DzE0M8da8mozikZt',
      ),

    ],
    [
      VideoInfo(
        title: 'Java (core) by Telusko ',
        subtitle: 'A complete playlist having course notes in the description itself :)',
        link: 'https://youtu.be/bm0OyhwFDuY?si=62jRhv-7BZr-SU_j',
      ),
  VideoInfo(
  title: 'Python by Telusko ',
  subtitle: 'Python is one of the best programming language and easy to learn. Python is used in Machine Learning, Data Science, Big Data, Web Development, Scripting.',
  link: 'https://youtu.be/QXeEoD0pB3E?si=Y0WcpX6BOw-J6Pd1',
  ),

      VideoInfo(
        title: 'JS By Thapa Sir ',
        subtitle: 'Complete JavaScript Tutorial for Beginners in Hindi in 2024. We will cover Basic to Advanced JavaScript, Modern JavaScript, and OOPS in JavaScript in Hindi. ',
        link: 'https://youtu.be/KGkiIBTq0y0?si=7Ekn_ZGBMJiuvrOz',
      ),
      VideoInfo(
        title: 'C by Apna College ',
        subtitle: 'C Language Tutorial for Beginners (with Notes & Practice Questions) ',
        link: 'https://youtu.be/irqbmMNs2Bo?si=YlFGmd7Jhj-DuRrN',
      ),
      VideoInfo(
        title: 'C++ Full Course ',
        subtitle: 'Complete C++ Placement Course with DSA  ',
        link: 'https://youtu.be/z9bZufPHFLU?si=U69VyXZ7dCauJOC1',
      ),
    ],
    [
    VideoInfo(
      title: 'Aptitude Preparation for Placements ',
      subtitle: 'Aptitude Preparation is important for Campus Placements and how this playlist will help you in placement in the Hindi language. ',
      link: 'https://youtu.be/hlyal4sR0m8?si=0y8ievr3u2cqNpBe',
    ),
      VideoInfo(
        title: 'Aptitude for Campus Placement TCS/Wipro/Infosys...',
        subtitle: 'A complete playlist - Aptitude for Campus Placement TCS/Wipro/Infosys and all other',
        link: 'https://www.youtube.com/live/bOD5b1GV1Z8?si=DdUgMnBGaJUnLaiJ',
      ),
    ]

  ];

  MyHomePage({Key? key, required String title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // appBar: AppBar(
      debugShowCheckedModeBanner: false,

      // ),
      home: Scaffold(
        appBar: AppBar(
        title: const Text('Get Job Ready'),
        ),
      body:Container(
      color: Colors.grey[500],
        child:
        CarouselSlider.builder(
        itemCount: mainTitles.length,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          aspectRatio: 16 / 9,
          viewportFraction: 0.5,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollDirection: Axis.vertical,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return VerticalCarousel(
            mainTitle: mainTitles[index],
            videoData: videoData[index],
          );
        },
      ),
    ),
    ),
    );
  }
}

class VerticalCarousel extends StatelessWidget {
  final String mainTitle;
  final List<VideoInfo> videoData;

  VerticalCarousel({
    required this.mainTitle,
    required this.videoData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mainTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        SizedBox(height: 8.0),
        CarouselSlider.builder(
          itemCount: videoData.length,
          options: CarouselOptions(
            height: 200, // Adjust the height of the inner carousel as needed
            aspectRatio: 16 / 9,
            viewportFraction: 0.6,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return VideoCard(
              videoInfo: videoData[index],

            );
          },
        ),
      ],
    );
  }
}

class VideoCard extends StatelessWidget {
  final VideoInfo videoInfo;

  const VideoCard({
    required this.videoInfo,
  });

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoInfo.link) ?? '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    return Container(
        // height: 900,
        // color: Colors.grey,
        child:  SingleChildScrollView(
        child: Column(
        children: [
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  videoInfo.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  videoInfo.subtitle,
                  style: const TextStyle(fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),/////////////////////////////////////////////////////////////////////yr yhi pr h bas visible nhi h due to ht factor

              ],
            ),
          ),
        ],
      ),
        ),
    );
  }
}


class VideoInfo {
  final String title;
  final String subtitle;
  final String link;

  VideoInfo({
    required this.title,
    required this.subtitle,
    required this.link,
  });
}
