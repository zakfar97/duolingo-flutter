import 'package:duolingo/presentation/widgets/common/appbar_home_screen.dart';
import 'package:duolingo/presentation/pages/home/home_screen.dart';
import 'package:duolingo/presentation/pages/profile/profile_page.dart';
import 'package:duolingo/presentation/pages/ranking/ranking_page.dart';
import 'package:duolingo/presentation/pages/store/store_page.dart';
import 'package:duolingo/presentation/pages/stories/stories_page.dart';
import 'package:duolingo/core/utils/images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    ProfilePage(),
    RankingPage(),
    StorePage(),
    StoriesPage(),
  ];
  final PageStorageBucket _bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    const double _iconSize = 41;
    const double _iconSizeSelected = 53;
    final AppBarHomeScreen appBar = AppBarHomeScreen();

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: appBar,
        ),
        body: PageStorage(
          bucket: _bucket,
          child: currentScreen,
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
              currentScreen = screens[index];
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 0
                    ? Images.selectedLessons
                    : Images.tabLessons,
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                    currentScreen = HomeScreen();
                  });
                },
                iconSize: _currentIndex == 0 ? _iconSizeSelected : _iconSize,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 1
                    ? Images.selectedStories
                    : Images.tabStories,
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                    currentScreen = StoriesPage();
                  });
                },
                iconSize: _currentIndex == 1 ? _iconSizeSelected : _iconSize,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 2
                    ? Images.selectedProfile
                    : Images.tabProfile,
                onPressed: () {
                  setState(() {
                    _currentIndex = 2;
                    currentScreen = ProfilePage();
                  });
                },
                iconSize: _currentIndex == 2 ? _iconSizeSelected : _iconSize,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: _currentIndex == 3
                    ? Images.selectedRanking
                    : Images.tabRanking,
                onPressed: () {
                  setState(() {
                    _currentIndex = 3;
                    currentScreen = RankingPage();
                  });
                },
                iconSize: _currentIndex == 3 ? _iconSizeSelected : _iconSize,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon:
                    _currentIndex == 4 ? Images.selectedStore : Images.tabStore,
                onPressed: () {
                  setState(() {
                    _currentIndex = 4;
                    currentScreen = StorePage();
                  });
                },
                iconSize: _currentIndex == 4 ? _iconSizeSelected : _iconSize,
              ),
              label: "",
            ),
          ],
        ));
  }
} 