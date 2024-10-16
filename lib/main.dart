import 'package:flutter/material.dart';
import 'package:fontend/wiget/favorites.dart';
import 'package:fontend/wiget/home.dart';
import 'package:fontend/wiget/profile.dart';
import 'package:fontend/wiget/store.dart';
import 'package:fontend/wiget/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Chỉ số của tab được chọn

  // Danh sách các widget cho từng tab
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Chèn HomeScreen vào tab đầu tiên
    FavoritesScreen(),
    Profile(),
    UserProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật chỉ số tab được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // Mở rộng thân Scaffold lên AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Làm AppBar trong suốt
        elevation: 0, // Bỏ bóng của AppBar
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      // Hiển thị widget dựa trên chỉ số tab
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
              size: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.grid_view,
              size: 35,
            ),
            label: '',
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
