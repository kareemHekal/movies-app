import 'package:flutter/material.dart';
import 'package:movie_app/navbar_tabs/browse_page.dart';
import 'package:movie_app/navbar_tabs/search_page.dart';
import 'package:movie_app/navbar_tabs/watch_list_page.dart';

import 'navbar_tabs/Home_page.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  int _currentIndex = 0; // Keep track of the currently selected item

  final screens = [
    HomeTab(),
    search_tab(),
    browse_tab(),
    watch_list_tab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex], // Show the currently selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Optional
        currentIndex: _currentIndex, // Set the current index
        onTap: (index) => setState(() => _currentIndex = index), // Handle item tap
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/browse.png",
                width: 20, height: 20),
            label: "browse",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/watchlist.png",
                width: 20, height: 20),
            label: "watch list",
          ),
        ],
      ),
    );
  }
}