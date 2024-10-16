import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [
    "Thông báo 1: Bạn có một tin nhắn mới.",
    "Thông báo 2: Đơn hàng của bạn đã được giao.",
    "Thông báo 3: Cập nhật mới từ ứng dụng.",
    "Thông báo 4: Hẹn gặp bạn vào ngày mai.",
    "Thông báo 5: Bạn đã nhận được một lời mời.",
    // Thêm nhiều thông báo ở đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Sách Thông Báo'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index]),
            leading: Icon(Icons.notifications),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Hành động khi nhấn vào thông báo
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Bạn đã nhấn vào thông báo ${index + 1}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}