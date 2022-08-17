import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';

class Tracks extends StatefulWidget {
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songs = [];
  bool liked = false;
  int currentIndex = 0;
  final GlobalKey<MusicPlayerState> key = GlobalKey<MusicPlayerState>();

  void initState() {
    super.initState();
    getTracks();
  }

  void getTracks() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final _songs = await audioQuery.getSongs();
    songs.clear();
    songs.addAll(_songs);
    songs.sort((a, b) => sharedPreferences.containsKey(b.filePath) ? 1 : 0);
    setState(() {});
  }

  void changeTrack(bool isNext) {
    if (isNext) {
      if (currentIndex != songs.length - 1) {
        currentIndex++;
      }
    } else {
      if (currentIndex != 0) {
        currentIndex--;
      }
    }
    key.currentState?.setSong(songs[currentIndex]);
  }

  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.music_note, color: Colors.amber),
        title: Text('AMK Music', style: TextStyle(color: Colors.amber)),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/slide1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/slide2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/slide3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/slide4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(
                      color: Colors.grey,
                    ),
                itemCount: songs.length,
                itemBuilder: (context, index) => TracksItems(
                      key: ValueKey(songs[index].filePath),
                      songInfo: songs[index],
                      onLikeTap: () async {
                        getTracks();
                      },
                      onItemTap: () {
                        currentIndex = index;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MusicPlayer(
                                changeTrack: changeTrack,
                                songInfo: songs[index],
                                key: key)));
                      },
                    )),
          ),
        ],
      ),
    );
  }
}

typedef OnItemTap = void Function();
typedef OnLikeTap = void Function();

class TracksItems extends StatefulWidget {
  final SongInfo songInfo;
  final OnItemTap onItemTap;
  final OnLikeTap onLikeTap;

  const TracksItems(
      {required this.songInfo,
      required this.onItemTap,
      required this.onLikeTap,
      Key? key})
      : super(key: key);

  @override
  State<TracksItems> createState() => _TracksItemsState();
}

class _TracksItemsState extends State<TracksItems> {
  bool isFav = false;

  void _restorePersistedPreference(String path) async {
    var prefs = await SharedPreferences.getInstance();
    bool liked = prefs.containsKey(path);
    setState(() {
      isFav = liked;
    });
  }

  void _persistedPreference(String path) async {
    setState(() {
      isFav = !isFav;
    });
    var prefs = await SharedPreferences.getInstance();
    if (isFav) {
      await prefs.setBool(path, isFav);
    } else {
      if (prefs.containsKey(path)) {
        prefs.remove(path);
      }
    }
    setState(() {});
    widget.onLikeTap();
  }

  @override
  void initState() {
    super.initState();
    _restorePersistedPreference(widget.songInfo.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          Icons.music_note,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
      ),
      title: Text(widget.songInfo.title),
      textColor: Colors.white,
      subtitle: Text(widget.songInfo.artist),
      onTap: widget.onItemTap,
      trailing: IconButton(
        icon: Icon(
          isFav ? Icons.favorite_outlined : Icons.favorite_border_outlined,
          color: isFav ? Colors.red : Colors.grey,
        ),
        onPressed: () {
          _persistedPreference(widget.songInfo.filePath);
        },
      ),
    );
  }
}
