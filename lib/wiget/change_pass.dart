
import 'package:flutter/material.dart';

import 'my_color.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isObscured = true; // Biến để điều khiển hiển thị/ẩn mật khẩu

  void _changePassword() {
    String oldPassword = _oldPasswordController.text;
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Kiểm tra mật khẩu mới và xác nhận mật khẩu có khớp không
    if (newPassword == confirmPassword) {
      // Xử lý logic đổi mật khẩu ở đây
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đổi mật khẩu thành công!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mật khẩu mới và xác nhận mật khẩu không khớp!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đổi Mật Khẩu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // Mật khẩu cũ
            TextField(
              controller: _oldPasswordController,
              obscureText: _isObscured,
              decoration: InputDecoration(
                labelText: 'Nhập mật khẩu cũ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Bo tròn giống Container
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5), // Viền mờ đi
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Đặt chiều cao vừa phải
                suffixIcon: IconButton(
                  icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            // Mật khẩu mới
            TextField(
              controller: _newPasswordController,
              obscureText: _isObscured,
              decoration: InputDecoration(
                labelText: 'Nhập mật khẩu mới',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Bo tròn giống Container
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5), // Viền mờ đi
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Đặt chiều cao vừa phải
                suffixIcon: IconButton(
                  icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            // Xác nhận mật khẩu mới
            TextField(
              controller: _confirmPasswordController,
              obscureText: _isObscured,
              decoration: InputDecoration(
                labelText: 'Nhập lại mật khẩu mới',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8), // Bo tròn giống Container
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5), // Viền mờ đi
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Đặt chiều cao vừa phải
                suffixIcon: IconButton(
                  icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 32),
            // Nút đổi mật khẩu với nền gradient
            Container(
              width: double.infinity, // Đặt độ rộng của nút bằng với các ô nhập liệu
              decoration: BoxDecoration(
                gradient: MyColor.backgroundButton,
                borderRadius: BorderRadius.circular(8), // Tạo bo tròn góc
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Đặt màu nền của nút thành trong suốt
                  disabledForegroundColor: Colors.white.withOpacity(0.38), disabledBackgroundColor: Colors.white.withOpacity(0.12), // Màu chữ
                  shadowColor: Colors.transparent, // Bỏ đổ bóng
                ),
                onPressed: _changePassword,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Xác nhận',
                    style: TextStyle(color: Colors.white), // Màu chữ trắng
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
