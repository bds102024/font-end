import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "title": "Dừng bán BDS 🛑🛑🛑",
      "content": "Hello! 😊 This is a notification.",
      "time": "2 giờ trước"
    },
    {
      "title": "Tin mới  🍀 🍀",
      "content": "Đơn hàng của bạn đã được giao.",
      "time": "5 giờ trước"
    },
    {
      "title": "Thông báo 3",
      "content": "Cập nhật mới từ ứng dụng.",
      "time": "1 ngày trước"
    },
    {
      "title": "Thông báo 4",
      "content": "Hẹn gặp bạn vào ngày mai.",
      "time": "2 ngày trước"
    },
    {
      "title": "Thông báo 5",
      "content": "Bạn đã nhận được một lời mời.",
      "time": "3 ngày trước"
    },
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
          return Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.notifications, color: Colors.orange, size: 30),
                      // Icon thông báo
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  notifications[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      notifications[index]['time']!,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(), // Gạch ngang phân cách
                  SizedBox(height: 10),
                  Text(
                    notifications[index]['content']!,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
