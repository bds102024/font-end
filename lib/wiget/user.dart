import 'package:flutter/material.dart';
import 'package:fontend/wiget/setting_screen.dart';
import '../login/wiget/login.dart';
import 'info.dart'; // Nhập tệp EditProfileScreen để điều hướng

class UserProfileScreen extends StatelessWidget {
  final String avatarUrl =
      'https://via.placeholder.com/150'; // Thay thế bằng URL thực tế của ảnh đại diện
  final String coverUrl =
      'https://via.placeholder.com/600x200'; // Thay thế bằng URL ảnh bìa thực tế
  final String userName =
      'Nguyễn Văn A'; // Thay thế bằng tên người dùng thực tế

  // Hàm tạo widget cho mỗi mục trong danh sách
  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    GestureTapCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lấy chiều cao của màn hình
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Ảnh bìa chiếm phần nhỏ hơn của chiều trên màn hình
          Image.network(
            coverUrl,
            width: double.infinity,
            height: screenHeight * 0.3, // Chiếm 30% chiều cao màn hình
            fit: BoxFit.cover,
          ),
          // Nội dung bên dưới ảnh bìa
          Column(
            children: [
              SizedBox(height: screenHeight * 0.2),
              // Đẩy nội dung xuống dưới ảnh bìa
              // Ảnh đại diện chồng lên ảnh bìa
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                // Để viền màu trắng xung quanh ảnh đại diện
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
              ),
              SizedBox(height: 16),
              // Hàng chứa tên và nút chỉnh sửa
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tên khách hàng
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  // Nút chỉnh sửa
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () {
                      // Điều hướng đến màn hình chỉnh sửa hồ sơ
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            name: 'Nguyễn Văn A',
                            email: 'nguyenvana@example.com',
                            phoneNumber: '0123456789',
                            address: 'Địa chỉ nào đó',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Các mục thiết lập và đăng xuất
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    _createDrawerItem(
                      icon: Icons.report,
                      text: 'Báo cáo hoa hồng',
                      onTap: () {
                        // Điều hướng đến Báo cáo hoa hồng
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.edit,
                      text: 'Đăng tin',
                      onTap: () {
                        // Điều hướng đến Đăng tin
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.group_add,
                      text: 'Thêm thành viên',
                      onTap: () {
                        // Điều hướng đến Thêm thành viên
                      },
                    ),
                    Divider(),
                    _createDrawerItem(
                      icon: Icons.star,
                      text: 'Khối/Phòng của tôi',
                      onTap: () {
                        // Điều hướng đến Khối/Phòng của tôi
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.assignment,
                      text: 'Tin tôi đã đăng',
                      onTap: () {
                        // Điều hướng đến Tin tôi đã đăng
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.storage,
                      text: 'Kho BĐS Hoàng Gia',
                      onTap: () {
                        // Điều hướng đến Kho BĐS Hoàng Gia
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.bookmark,
                      text: 'Tin tôi đã lưu',
                      onTap: () {
                        // Điều hướng đến Tin tôi đã lưu
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.settings,
                      text: 'Thiết lập',
                      onTap: () {
                        // Điều hướng đến Thiết lập (chỉnh sửa thông tin)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    _createDrawerItem(
                      icon: Icons.logout,
                      text: 'Đăng xuất',
                      onTap: () {
                        // Hộp thoại xác nhận đăng xuất
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Đăng xuất'),
                            content: Text('Bạn có chắc chắn muốn đăng xuất?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Hủy'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginScreen()), // Điều hướng đến LoginScreen
                                  );
                                },
                                child: Text('Đăng xuất'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
