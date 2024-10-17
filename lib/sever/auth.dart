import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> login(String username, String password) async {
  try {
    await dotenv.load();
    final apiUrl = dotenv.env['API_URL'];

    final response = await http.post(Uri.parse('$apiUrl/api/LoginApi/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'User': username,
          'Password': password,
        }));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      if (jsonResponse['Token'] != null) {
        String token = jsonResponse['Token'];
        return token;
      } else {
        print('Token not found in response');
        return null;
      }
    } else {
      print('API call failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error during API call: $e');
    return null;
  }
}
