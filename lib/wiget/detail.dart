import 'package:flutter/material.dart';

class PropertyDetailScreen extends StatelessWidget {
  final String address;
  final String price;
  final String date;
  final String imageUrl;
  final String realArea;
  final String registeredArea;
  final String frontLength;
  final String roadWidth;
  final int bedrooms;
  final int bathrooms;
  final int floors;
  final String legalDocuments;
  final String furniture;
  final String addressOnPaper;

  PropertyDetailScreen({
    required this.address,
    required this.price,
    required this.date,
    required this.imageUrl,
    required this.realArea,
    required this.registeredArea,
    required this.frontLength,
    required this.roadWidth,
    required this.bedrooms,
    required this.bathrooms,
    required this.floors,
    required this.legalDocuments,
    required this.furniture,
    required this.addressOnPaper,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Số lượng tabs
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    // Hiển thị ảnh chính
                    Image.network(
                      imageUrl,
                      height: 300.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Container(
                          height: 300.0,
                          width: double.infinity,
                          color: Colors.grey,
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        );
                      },
                    ),
                    // Nút quay về
                    Positioned(
                      top: 40,
                      left: 10,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    // Nút tùy chọn
                    Positioned(
                      top: 40,
                      right: 10,
                      child: PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert,
                            color: Colors.white, size: 30),
                        onSelected: (value) {
                          // Xử lý hành động cho nút tùy chọn
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'Tải ảnh hiện tại',
                              child: Text('Tải ảnh hiện tại'),
                            ),
                            PopupMenuItem(
                              value: 'Tải tất cả ảnh',
                              child: Text('Tải tất cả ảnh'),
                            ),
                          ];
                        },
                      ),
                    ),
                  ],
                ),
                // Thông tin bất động sản phía dưới ảnh
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Giá: $price',
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Ngày đăng: $date',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // TabBar để hiển thị các tabs
                TabBar(
                  labelColor: Colors.orangeAccent,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.orangeAccent,
                  tabs: [
                    Tab(text: 'Thông tin'),
                    Tab(text: 'Mô tả'),
                    Tab(text: 'Liên hệ'),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: TabBarView(
                    children: [
                      _buildScrollableInfoTab(), // Tab "Thông tin"
                      _buildScrollableDescriptionTab(), // Tab "Mô tả"
                      _buildContactTab(context), // Tab "Liên hệ"
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Nội dung của tab "Thông tin" có thể cuộn dọc
  Widget _buildScrollableInfoTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Giá', price),
          Divider(),
          _buildInfoRow('Diện tích thực tế', '$realArea m²'),
          Divider(),
          _buildInfoRow('Diện tích trên sổ', '$registeredArea m²'),
          Divider(),
          _buildInfoRow('Chiều dài mặt tiền', '$frontLength mét'),
          Divider(),
          _buildInfoRow('Chiều rộng đường vào', '$roadWidth mét'),
          Divider(),
          _buildInfoRow('Số phòng ngủ', '$bedrooms'),
          Divider(),
          _buildInfoRow('Số phòng toilet', '$bathrooms'),
          Divider(),
          _buildInfoRow('Số tầng', '$floors'),
          Divider(),
          _buildInfoRow('Giấy tờ pháp lý', legalDocuments),
          Divider(),
          _buildInfoRow('Nội thất', furniture),
          Divider(),
          _buildInfoRow('Địa chỉ trên sổ', addressOnPaper),
          Divider(),
        ],
      ),
    );
  }

  // Tạo một dòng thông tin
  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // Nội dung của tab "Mô tả" có thể cuộn dọc
  Widget _buildScrollableDescriptionTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Mô tả chi tiết về bất động sản...',
        style: TextStyle(fontSize: 16),
      ),
    );
  }

// Nội dung của tab "Liên hệ"
  Widget _buildContactTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Avatar ở bên trái
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/images/avatar.jpg'), // Thay thế bằng hình ảnh đại diện thực tế
              ),
              SizedBox(width: 16),
              // Thông tin bên phải
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nguyễn Văn A', // Tên
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Chức vụ: Quản lý', // Chức vụ
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    'Online 15 phút trước', // Thời gian online
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.call, color: Colors.green, size: 30),
                onPressed: () {
                  // Thực hiện cuộc gọi
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(),
          // Số điện thoại
          Row(
            children: [
              Icon(Icons.phone, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                '0123 456 789',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Email
          Row(
            children: [
              Icon(Icons.email, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'email@example.com',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Facebook
          Row(
            children: [
              Icon(Icons.facebook, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                'Chưa cập nhật', // Nếu không có link Facebook
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Zalo
          Row(
            children: [
              Icon(Icons.chat, color: Colors.teal),
              SizedBox(width: 8),
              Text(
                'Chưa cập nhật', // Nếu không có link Zalo
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
