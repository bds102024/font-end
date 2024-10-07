import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyWiget(),

      )

  );
}

class MyWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GradientBackgroundWidget(),
      debugShowCheckedModeBanner: false,
      color: Color.fromRGBO(255, 127, 36, 1),
    );
  }
}

class GradientBackgroundWidget extends StatefulWidget {
  @override
  _GradientBackgroundWidgetState createState() => _GradientBackgroundWidgetState();
}

class _GradientBackgroundWidgetState extends State<GradientBackgroundWidget> {
  int _selectedIndex = 0; // Chỉ số của tab được chọn

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật chỉ số tab được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient Background Example'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 127, 36, 1), // Màu đậm bên trái dưới
              Color.fromRGBO(255, 180, 7, 1),   // Màu nhạt ở giữa
              Color.fromRGBO(255, 127, 36, 1),  // Màu đậm bên phải trên
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Text(
            'Selected Index: $_selectedIndex',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Màu nền cho BottomNavigationBar
        selectedItemColor: Color.fromRGBO(255, 180, 7, 1),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Heart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Grid',
          ),
        ],
      ),
    );
  }
}