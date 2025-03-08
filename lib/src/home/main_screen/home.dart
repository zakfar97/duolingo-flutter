import 'package:duolingo/src/home/appbar_home_screen.dart';
import 'package:duolingo/src/home/main_screen/home_screen.dart';
import 'package:duolingo/src/home/main_screen/profile.dart';
import 'package:duolingo/src/home/main_screen/ranking.dart';
import 'package:duolingo/src/home/main_screen/store.dart';
import 'package:duolingo/src/home/main_screen/stories.dart';
import 'package:duolingo/src/utils/images.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  static const double _iconSize = 41;
  static const double _iconSizeSelected = 53;

  final List<Widget> screens = [
    HomeScreen(),
    Stories(),
    Profile(),
    Ranking(),
    Store(),
  ];

  final PageStorageBucket _bucket = PageStorageBucket();
  late Widget currentScreen; // ✅ Declare currentScreen as a late variable

  @override
  void initState() {
    super.initState();
    currentScreen = screens[_currentIndex]; // ✅ Initialize it with the first screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHomeScreen(), // ✅ Fix: AppBarHomeScreen implements PreferredSizeWidget
      body: PageStorage(
        bucket: _bucket,
        child: currentScreen, // ✅ Use screens list
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Image.asset(
          "assets/images/floating_action_button/tab_training_selected.png",
          height: 33,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.blue,
        iconSize: _iconSize,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              _currentIndex == 0 ? Images.selectedLessons : Images.tabLessons,
              size: _currentIndex == 0 ? _iconSizeSelected : _iconSize,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              _currentIndex == 1 ? Images.selectedStories : Images.tabStories,
              size: _currentIndex == 1 ? _iconSizeSelected : _iconSize,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              _currentIndex == 2 ? Images.selectedProfile : Images.tabProfile,
              size: _currentIndex == 2 ? _iconSizeSelected : _iconSize,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              _currentIndex == 3 ? Images.selectedRanking : Images.tabRanking,
              size: _currentIndex == 3 ? _iconSizeSelected : _iconSize,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              _currentIndex == 4 ? Images.selectedStore : Images.tabStore,
              size: _currentIndex == 4 ? _iconSizeSelected : _iconSize,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
