import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  final String baseUrl = 'https://provinces.open-api.vn/api'; // URL cơ bản của API

  // Hàm gọi GET để lấy danh sách tỉnh
  Future<List<String>> getProvinces() async {
    final response = await http.get(Uri.parse('$baseUrl/p/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((province) => province['name']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .toSet() // Loại bỏ các mục trùng lặp
          .toList();
    } else {
      throw Exception('Không thể tải danh sách tỉnh');
    }
  }

// Hàm gọi GET để lấy danh sách huyện dựa trên tỉnh đã chọn
  Future<List<String>> getDistricts(String provinceId) async {
    print('Đang gọi API lấy huyện cho tỉnh: $provinceId');

    final response = await http.get(Uri.parse('$baseUrl/p/$provinceId?depth=2'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print('Dữ liệu API trả về: $jsonData'); // Kiểm tra cấu trúc trả về

      final data = jsonData['districts'] as List;
      return data
          .map((district) => district['name']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .toSet() // Loại bỏ các mục trùng lặp
          .toList();
    } else {
      print('Lỗi khi gọi API lấy huyện: ${response.statusCode}');
      throw Exception('Không thể tải danh sách huyện');
    }
  }


  // Hàm gọi GET để lấy danh sách xã dựa trên huyện đã chọn
  Future<List<String>> getWards(String districtId) async {
    final response = await http.get(Uri.parse('$baseUrl/d/$districtId?depth=2'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['wards'] as List;
      return data
          .map((ward) => ward['name']?.toString() ?? '')
          .where((name) => name.isNotEmpty)
          .toSet() // Loại bỏ các mục trùng lặp
          .toList();
    } else {
      throw Exception('Không thể tải danh sách xã');
    }
  }

  // Hàm gọi POST để cập nhật thông tin cá nhân
  Future<bool> updateProfile(Map<String, dynamic> profileData) async {
    final String updateProfileUrl = 'https://example.com/api/updateProfile'; // Thay thế bằng URL thực tế của bạn

    final response = await http.post(
      Uri.parse(updateProfileUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(profileData),
    );

    if (response.statusCode == 200) {
      return true; // Thành công
    } else {
      throw Exception('Lỗi khi cập nhật thông tin');
    }
  }
}
