import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mk_football/screens/favorite_screen.dart';
import 'package:mk_football/screens/home_page.dart';
import 'package:mk_football/screens/profile_screen.dart';
import 'package:mk_football/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum _SelectedTab { home, favorite, search, person }

class _HomeScreenState extends State<HomeScreen> {
  var _selectedTab = _SelectedTab.home;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      _pageController.jumpToPage(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: _buildBody(),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  _bottomNavigation() {
    return DotNavigationBar(
      currentIndex: _SelectedTab.values.indexOf(_selectedTab),
      onTap: _handleIndexChanged,
      // dotIndicatorColor: Colors.black,
      items: [
        /// Home
        DotNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          selectedColor: Colors.purple,
        ),

        /// Likes
        DotNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          selectedColor: Colors.pink,
        ),

        /// Search
        DotNavigationBarItem(
          icon: Icon(Icons.search),
          selectedColor: Colors.orange,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: Icon(Icons.person_outline),
          selectedColor: Colors.teal,
        ),
      ],
    );
  }

  PageController _pageController = PageController();

  HomePage _homePage = HomePage();
  SearchPage _searchPage = SearchPage();
  FavoritePage _favoritePage = FavoritePage();
  ProfilePage _profilePage = ProfilePage();

  _buildBody() {
    return PageView(
      controller: _pageController,
      children: [
        _homePage,
        _searchPage,
        _favoritePage,
        _profilePage,
      ],
    );
  }
}
