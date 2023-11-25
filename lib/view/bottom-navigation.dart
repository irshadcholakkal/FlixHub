import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:quadb_test/view/home-page.dart';
import 'package:quadb_test/view/search-page.dart';

class BottomNavigationWrapper extends StatefulWidget {
  const BottomNavigationWrapper({Key? key}) : super(key: key);

  @override
  _BottomNavigationWrapperState createState() => _BottomNavigationWrapperState();
}
enum _SelectedTab { home, search }
class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: _buildPage(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          height: 5,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.white.withOpacity(0.1),
          onTap: _handleIndexChanged,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.search,
              unselectedIcon: IconlyLight.search,
              selectedColor: Colors.white,
            ),
            
          ],
        ),
      ),
    );
  }

  Widget _buildPage() {
    switch (_selectedTab) {
      case _SelectedTab.search:
        return SearchPage();
      case _SelectedTab.home:
        return HomePage();
      
    }
  }
}
