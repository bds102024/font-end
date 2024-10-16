import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  // Danh sách bất động sản ưa thích giả định
  final List<Map<String, dynamic>> favoriteProperties = [
    {
      'name': 'Biệt thự ven biển',
      'price': 15000000000,
      'address': '123 Đường Bờ Biển, Vũng Tàu',
      'imageUrl': 'https://picsum.photos/300',    },
    {
      'name': 'Căn hộ cao cấp',
      'price': 2500000000,
      'address': '456 Đường Nguyễn Văn Linh, Quận 7, TP.HCM',
      'imageUrl': 'https://picsum.photos/300',    },
    {
      'name': 'Nhà phố trung tâm',
      'price': 7000000000,
      'address': '789 Đường Lý Thường Kiệt, Quận 10, TP.HCM',
      'imageUrl': 'https://picsum.photos/300',    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh Sách Ưa Thích'),
      ),
      body: ListView.builder(
        itemCount: favoriteProperties.length,
        itemBuilder: (context, index) {
          final property = favoriteProperties[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                property['imageUrl'],
                width: 100,
                fit: BoxFit.cover,
              ),
              title: Text(
                property['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('Giá: ${property['price'].toStringAsFixed(0)} VND'),
                  SizedBox(height: 4),
                  Text('Địa chỉ: ${property['address']}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Xử lý logic bỏ ưa thích
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Đã bỏ khỏi mục ưa thích!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
