import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FilterScreen(),
  ));
}

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // Define variables for sliders
  double _priceMin = 56;
  double _priceMax = 84;
  double _areaMin = 260;
  double _areaMax = 470;
  double _frontageMin = 8;
  double _frontageMax = 12;

  // Legal status selection
  String _legalStatus = 'Tất cả';
  String _furnitureStatus = 'Tất cả';

  // Define variables for floors, bedrooms, and toilets
  int _floors = 2;
  int _bedrooms = 2;
  int _toilets = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bộ lọc"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Legal Status Chips
              Text('Thông tin pháp lý'),
              Wrap(
                spacing: 8.0,
                children: [
                  ChoiceChip(
                    label: Text('Tất cả'),
                    selected: _legalStatus == 'Tất cả',
                    onSelected: (bool selected) {
                      setState(() {
                        _legalStatus = selected ? 'Tất cả' : _legalStatus;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Đã có sổ đỏ'),
                    selected: _legalStatus == 'Đã có sổ đỏ',
                    onSelected: (bool selected) {
                      setState(() {
                        _legalStatus = selected ? 'Đã có sổ đỏ' : _legalStatus;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Đã có sổ hồng'),
                    selected: _legalStatus == 'Đã có sổ hồng',
                    onSelected: (bool selected) {
                      setState(() {
                        _legalStatus =
                        selected ? 'Đã có sổ hồng' : _legalStatus;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Chưa xác định'),
                    selected: _legalStatus == 'Chưa xác định',
                    onSelected: (bool selected) {
                      setState(() {
                        _legalStatus =
                        selected ? 'Chưa xác định' : _legalStatus;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Furniture Status Chips
              Text('Nội thất'),
              Wrap(
                spacing: 8.0,
                children: [
                  ChoiceChip(
                    label: Text('Tất cả'),
                    selected: _furnitureStatus == 'Tất cả',
                    onSelected: (bool selected) {
                      setState(() {
                        _furnitureStatus =
                        selected ? 'Tất cả' : _furnitureStatus;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Đầy đủ nội thất'),
                    selected: _furnitureStatus == 'Đầy đủ nội thất',
                    onSelected: (bool selected) {
                      setState(() {
                        _furnitureStatus =
                        selected ? 'Đầy đủ nội thất' : _furnitureStatus;
                      });
                    },
                  ),
                  ChoiceChip(
                    label: Text('Chưa xác định'),
                    selected: _furnitureStatus == 'Chưa xác định',
                    onSelected: (bool selected) {
                      setState(() {
                        _furnitureStatus =
                        selected ? 'Chưa xác định' : _furnitureStatus;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Floors, Bedrooms, and Toilets
              Text('Số tầng'),
              CounterWidget(
                value: _floors,
                onChanged: (int newValue) {
                  setState(() {
                    _floors = newValue;
                  });
                },
              ),

              SizedBox(height: 10),

              Text('Số phòng ngủ'),
              CounterWidget(
                value: _bedrooms,
                onChanged: (int newValue) {
                  setState(() {
                    _bedrooms = newValue;
                  });
                },
              ),

              SizedBox(height: 10),

              Text('Số phòng toilet'),
              CounterWidget(
                value: _toilets,
                onChanged: (int newValue) {
                  setState(() {
                    _toilets = newValue;
                  });
                },
              ),

              SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Quay lại'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Apply filters logic
                    },
                    child: Text('Áp dụng'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Counter Widget
class CounterWidget extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  CounterWidget({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (value > 0) {
              onChanged(value - 1);
            }
          },
          icon: Icon(Icons.remove),
        ),
        Text('$value+'),
        IconButton(
          onPressed: () {
            onChanged(value + 1);
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
