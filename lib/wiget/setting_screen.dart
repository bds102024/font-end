import 'package:flutter/material.dart';

import 'change_pass.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thiết lập'),
      ),
      body: ListView(
        children: [
          // Đổi mật khẩu
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Đổi mật khẩu'),
            onTap: () {
              // Điều hướng đến màn hình đổi mật khẩu
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangePasswordScreen(),
                ),
              );
            },
          ),
          Divider(), // Đường kẻ ngang để tách các mục

          // Thay đổi ngôn ngữ
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Thay đổi ngôn ngữ'),
            onTap: () {
              // Điều hướng đến màn hình thay đổi ngôn ngữ
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeLanguageScreen(),
                ),
              );
            },
          ),
          Divider(),

          // Thay đổi ảnh đại diện
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Thay đổi ảnh đại diện'),
            onTap: () {
              // Điều hướng đến màn hình thay đổi ảnh đại diện
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeAvatarScreen(),
                ),
              );
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

// Màn hình thay đổi ngôn ngữ (ví dụ)
class ChangeLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thay đổi ngôn ngữ'),
      ),
      body: Center(
        child: Text('Màn hình thay đổi ngôn ngữ ở đây'),
      ),
    );
  }
}

// Màn hình thay đổi ảnh đại diện (ví dụ)
class ChangeAvatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thay đổi ảnh đại diện'),
      ),
      body: Center(
        child: Text('Màn hình thay đổi ảnh đại diện ở đây'),
      ),
    );
  }
}
