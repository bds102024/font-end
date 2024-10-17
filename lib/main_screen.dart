import 'package:flutter/material.dart';
import 'package:fontend/wiget/favorites.dart';
import 'package:fontend/wiget/home.dart';
import 'package:fontend/wiget/store.dart';
import 'package:fontend/wiget/user.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    StoreScreen(), // This can represent Store or other content
    UserProfileScreen(), // Change this for your actual GridView widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 35),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, size: 35),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view, size: 35),
            label: 'GridView',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
