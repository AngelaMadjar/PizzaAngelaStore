import 'package:flutter/material.dart';
import 'package:pizza_angela_store/screens/search.dart';
import 'package:pizza_angela_store/screens/user_info.dart';

import 'cart.dart';
import 'feeds.dart';
import 'home.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // Initializing the screens in order to display them
  /*List _pages = [
    HomeScreen(),
    FeedScreen(),
    SearchScreen(),
    CartScreen(),
    UserInfoScreen()
  ];*/
  var _pages;

  // We need an index in order to know which page we are displaying
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home Screen'
      },
      {
        'page': FeedScreen(),
        'title': 'Feeds Screen'
      },
      {
        'page': SearchScreen(),
        'title': 'Search Screen'
      },
      {
        'page': CartScreen(),
        'title': 'Cart Screen'
      },
      {
        'page': UserInfoScreen(),
        'title': 'User Info Screen'
      },
    ];
    super.initState();
  }

  // Once the user presses any bottom of the navigation bar, the index will be changed
  void _selectedPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // We need to map the index and the screens so we know which screen corresponds to which index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(_pages[_selectedIndex]!['title'] as String),),
      body: _pages[_selectedIndex]!['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3, // the margin about the circular search buttom
        clipBehavior: Clip.antiAlias,
        //elevation: 5,
        shape: CircularNotchedRectangle(),
        child: Container(
          //height: kBottomNavigationBarHeight * 0.8,
          decoration:
          BoxDecoration(border: Border(top: BorderSide(width: 0.2),)),
          child: BottomNavigationBar(onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionColor,
            selectedItemColor: Colors.purple,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                tooltip: 'Home',
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rss_feed),
                tooltip: 'Feeds',
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                tooltip: 'Search',
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                tooltip: 'Cart',
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                tooltip: 'User',
                label: 'User',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.purple,
        tooltip: 'Search',
        elevation: 5,
        child: (Icon(Icons.search)),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        }
        ),
    );
  }
}