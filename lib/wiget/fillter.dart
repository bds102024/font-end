import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  // Define variables for sliders
  double _priceMin = 35;
  double _priceMax = 70;
  double _areaMin = 100;
  double _areaMax = 300;
  double _frontageMin = 8;
  double _frontageMax = 20;

  // Legal status selection
  String _legalStatus = 'Tất cả';
  String _furnitureStatus = 'Tất cả';

  // Define variables for floors, bedrooms, and toilets
  int _floors = 0;
  int _bedrooms = 0;
  int _toilets = 0;

  void _resetFilters() {
    setState(() {
      _priceMin = 35;
      _priceMax = 70;
      _areaMin = 100;
      _areaMax = 300;
      _frontageMin = 8;
      _frontageMax = 20;
      _legalStatus = 'Tất cả';
      _furnitureStatus = 'Tất cả';
      _floors = 0;
      _bedrooms = 0;
      _toilets = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Bộ lọc"),
            ElevatedButton(
              onPressed: () {
                _resetFilters();
              },
              child: Text('Reset'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Wrap the entire content with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price Slider
              Text('Giá tiền: Từ $_priceMin tỷ đến $_priceMax tỷ '),
              RangeSlider(
                values: RangeValues(_priceMin, _priceMax),
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels('${_priceMin} tỷ', '${_priceMax} tỷ'),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceMin = values.start;
                    _priceMax = values.end;
                  });
                },
              ),

              // Area Slider
              Text('Diện tích: Từ $_areaMin m² đến $_areaMax m² '),
              RangeSlider(
                values: RangeValues(_areaMin, _areaMax),
                min: 0,
                max: 1000,
                divisions: 100,
                labels: RangeLabels('${_areaMin} m²', '${_areaMax} m²'),
                onChanged: (RangeValues values) {
                  setState(() {
                    _areaMin = values.start;
                    _areaMax = values.end;
                  });
                },
              ),

              // Frontage Slider
              Text('Mặt tiền: Từ $_frontageMin m đến $_frontageMax m'),
              RangeSlider(
                values: RangeValues(_frontageMin, _frontageMax),
                min: 0,
                max: 100,
                divisions: 100,
                labels: RangeLabels('${_frontageMin} m', '${_frontageMax} m'),
                onChanged: (RangeValues values) {
                  setState(() {
                    _frontageMin = values.start;
                    _frontageMax = values.end;
                  });
                },
              ),

              SizedBox(height: 20),

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
              Row(
                children: [
                  Container(
                    // height: 100,
                      width: 150,
                      child: Card(
                        child: Column(
                          children: [
                            Text('Số tầng'),
                            CounterWidget(
                              value: _floors,
                              onChanged: (int newValue) {
                                setState(() {
                                  _floors = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  SizedBox(height: 10),
                  Container(
                    // height: 100,
                      width: 150,
                      child: Card(
                        child: Column(
                          children: [
                            Text('Số phòng ngủ'),
                            CounterWidget(
                              value: _bedrooms,
                              onChanged: (int newValue) {
                                setState(() {
                                  _bedrooms = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                ],
              ),

              SizedBox(height: 10),
              Container(
                // height: 100,
                  width: 150,
                  child: Card(
                    child: Column(
                      children: [
                        Text('Số phòng toilet'),
                        CounterWidget(
                          value: _toilets,
                          onChanged: (int newValue) {
                            setState(() {
                              _toilets = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  )),

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
            } else {
              onChanged(0); // Ensure "Tất cả" stays as the option
            }
          },
          icon: Icon(Icons.remove),
        ),
        // Display "Tất cả" if the value is 0
        Text(value == 0 ? 'Tất cả' : '$value+'),
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
