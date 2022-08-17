import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/screen/HomeScreen.dart';
import 'package:musicapp/screen/Profile.dart';
import 'package:musicapp/screen/Tracks.dart';

class bottomappbar extends StatefulWidget {
  const bottomappbar({Key? key}) : super(key: key);

  @override
  _bottomappbarState createState() => _bottomappbarState();
}

class _bottomappbarState extends State<bottomappbar> {
  int currentIndex = 0;
  List mainlist = [
    Tracks(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: mainlist[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Material(
              borderRadius: BorderRadius.circular(40),
              elevation: 5,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.play_arrow_solid,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            icon: Icon(
              CupertinoIcons.play_arrow_solid,
              color: Colors.amber,
            ),
            label: "     ",
          ),
          BottomNavigationBarItem(
            activeIcon: Material(
              borderRadius: BorderRadius.circular(40),
              elevation: 5,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.amber),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Center(
                  child: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            icon: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.amber,
            ),
            label: "     ",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
