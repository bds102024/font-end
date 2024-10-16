import 'package:flutter/material.dart';
import '../http/http_service.dart'; // Nhập HttpService để gọi API

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  EditProfileScreen({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final HttpService httpService = HttpService(); // Khởi tạo HttpService
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _bioController;

  // Các biến cho dropdown
  String? _selectedProvince;
  String? _selectedDistrict;
  String? _selectedWard;
  List<String> _provinces = [];
  List<String> _districts = [];
  List<String> _wards = [];

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _bioController = TextEditingController(); // Khởi tạo controller cho bio
    _fetchProvinces(); // Gọi API lấy danh sách tỉnh
  }

  Future<void> _fetchProvinces() async {
    try {
      List<String> provinces = await httpService.getProvinces();
      setState(() {
        _provinces = provinces;
        _selectedProvince = null; // Đặt lại tỉnh khi nạp mới
        _districts = [];
        _wards = [];
        _selectedDistrict = null;
        _selectedWard = null;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể tải danh sách tỉnh')),
      );
    }
  }

  Future<void> _fetchDistricts(String provinceId) async {
    try {
      List<String> districts = await httpService.getDistricts(provinceId);
      setState(() {
        _districts = districts;
        _wards = [];
        _selectedDistrict = null; // Đặt lại khi nạp huyện mới
        _selectedWard = null;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể tải danh sách huyện')),
      );
    }
  }

  Future<void> _fetchWards(String districtId) async {
    try {
      List<String> wards = await httpService.getWards(districtId);
      setState(() {
        _wards = wards;
        _selectedWard = null; // Đặt lại khi nạp xã mới
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể tải danh sách xã')),
      );
    }
  }

  Future<void> _saveProfileToServer() async {
    setState(() {
      _isSaving = true; // Hiển thị trạng thái đang lưu
    });

    try {
      bool isSuccess = await httpService.updateProfile({
        'name': _nameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneNumberController.text,
        'province': _selectedProvince,
        'district': _selectedDistrict,
        'ward': _selectedWard,
        'bio': _bioController.text, // Thêm thông tin bio vào API
      });

      if (isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cập nhật thành công!')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi khi cập nhật thông tin!')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể kết nối đến máy chủ!')),
      );
    } finally {
      setState(() {
        _isSaving = false; // Ẩn trạng thái lưu
      });
    }
  }

  void _saveProfile() {
    if (!_isSaving) {
      _saveProfileToServer(); // Gọi API lưu thông tin
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa hồ sơ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Ô nhập tên
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Tên',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Ô nhập email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Ô nhập số điện thoại
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // Dropdown chọn tỉnh
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Chọn tỉnh',
                  border: OutlineInputBorder(),
                ),
                value: _selectedProvince,
                items: _provinces.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedProvince = newValue;
                    _fetchDistricts(newValue!); // Gọi API lấy huyện khi chọn tỉnh
                  });
                },
              ),
              SizedBox(height: 16),
              // Dropdown chọn huyện
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Chọn huyện',
                  border: OutlineInputBorder(),
                ),
                value: _selectedDistrict,
                items: _districts.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedDistrict = newValue;
                    _fetchWards(newValue!); // Gọi API lấy xã khi chọn huyện
                  });
                },
              ),
              SizedBox(height: 16),
              // Dropdown chọn xã
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Chọn xã',
                  border: OutlineInputBorder(),
                ),
                value: _selectedWard,
                items: _wards.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedWard = newValue;
                  });
                },
              ),
              SizedBox(height: 32),
              // Nút lưu thông tin
              ElevatedButton(
                onPressed: _saveProfile,
                child: _isSaving
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Lưu Thông Tin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
