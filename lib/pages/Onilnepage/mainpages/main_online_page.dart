import 'package:flutter/material.dart';
import 'package:muzik_app/pages/Onilnepage/mainpages/online_home.dart';
import 'package:muzik_app/pages/Onilnepage/nav_pages/playlist.dart';
import 'package:muzik_app/widgets/constants.dart';
import '../nav_pages/library.dart';
import '../nav_pages/profile.dart';

class MainOnlinePage extends StatefulWidget {
  const MainOnlinePage({super.key});

  @override
  State<MainOnlinePage> createState() => _MainOnlinePageState();
}

class _MainOnlinePageState extends State<MainOnlinePage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorOne,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colortwo,
        unselectedItemColor: colorfour,
        backgroundColor: colorOne,
        // fixedColor: colorOne,
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            this._selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: colorOne,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Your Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: Stack(
        children: [
          renderView(
            0,
            OnlineHomePage(),
          ),
          renderView(
            1,
            PlayListOnline(),
          ),
          renderView(
            2,
            Library(),
          ),
          renderView(
            3,
            Profile(),
          ),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
