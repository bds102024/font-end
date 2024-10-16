import 'package:flutter/material.dart';

// Định nghĩa class MyColor
class MyColor {
  // Định nghĩa gradient
  static const LinearGradient backgroundTitle = LinearGradient(
    colors: [
      Color.fromRGBO(255, 180, 7, 1), // Màu nhạt bên phải trên
      Color.fromRGBO(255, 127, 36, 1),
    ],
    begin: Alignment.bottomLeft, // Bắt đầu gradient từ góc trái dưới
    end: Alignment.topRight, // Kết thúc gradient ở góc phải trên
  );
  static const LinearGradient backgroundButton = LinearGradient(
    colors: [
      Color.fromRGBO(255, 127, 36, 1), // Màu đậm bên trái dưới
      Color.fromRGBO(255, 180, 7, 1), // Màu nhạt bên phải trên
    ],
    begin: Alignment.bottomLeft, // Bắt đầu gradient từ góc trái dưới
    end: Alignment.topRight, // Kết thúc gradient ở góc phải trên
  );

  // Định nghĩa các màu tĩnh khác (nếu cần)
  static const Color primaryColor =
      Color.fromRGBO(0, 122, 255, 1); // Ví dụ màu chủ đạo
  static const Color secondaryColor =
      Color.fromRGBO(255, 255, 255, 1); // Ví dụ màu phụ
}
