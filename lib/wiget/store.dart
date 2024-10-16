import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  String selectedFilter = 'Tất cả'; // Biến để lưu trạng thái của bộ lọc

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bộ lọc
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  'Lọc theo: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedFilter,
                  items: <String>['Tất cả', 'Giá thấp đến cao', 'Giá cao đến thấp', 'Mới nhất']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.75,
              ),
              itemCount: _buildPropertyList().length,
              itemBuilder: (context, index) {
                final property = _buildPropertyList()[index];
                return Card(
                  elevation: 2.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        property['imageUrl']!,
                        height: 120.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          property['address']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          property['price']!,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          property['date']!,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Tạo danh sách giả định các bất động sản
  List<Map<String, String>> _buildPropertyList() {
    return [
      {
        'imageUrl': 'https://via.placeholder.com/300',
        'address': '268.1 Trần Cao Vân, Đà Nẵng',
        'price': '4,15 tỷ',
        'date': '03/09/2024',
      },
      {
        'imageUrl': 'https://via.placeholder.com/300',
        'address': '383.23 Hải Phòng, Đà Nẵng',
        'price': '2,35 tỷ',
        'date': '27/08/2024',
      },
      {
        'imageUrl': 'https://via.placeholder.com/300',
        'address': '268.1 Trần Cao Vân, Đà Nẵng',
        'price': '4,15 tỷ',
        'date': '03/09/2024',
      },
      {
        'imageUrl': 'https://via.placeholder.com/300',
        'address': '383.23 Hải Phòng, Đà Nẵng',
        'price': '2,35 tỷ',
        'date': '27/08/2024',
      },
    ];
  }
}
