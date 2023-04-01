import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/history_screen.dart';
import 'package:myapp/screens/home_page_screen.dart';
import 'package:myapp/screens/settings_page.dart';
import 'package:myapp/screens/swap_screen_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = const [
    Icon(Icons.home_outlined, size: 30),
    Icon(Icons.swap_horiz_outlined, size: 30),
    Icon(Icons.av_timer, size: 30),
    Icon(Icons.settings_outlined, size: 30),
  ];

  int _selectedIndex = 0;
  final PageController _pageViewController = PageController(initialPage: 0);

  List<Widget> screens = [
    const HomePageScreen(),
    const SwapPageScreen(),
    const HistoryScreen(),
    const SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pageViewController.animateToPage(index, duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedIndex,
          onTap: _onItemTapped,
          color: Colors.white,
          items: items,
          height: 66.0,
          backgroundColor: Colors.grey.shade100,
        ),
        body: PageView(
          controller: _pageViewController,
          children: screens,
          onPageChanged: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
