class Employee {
  String rowID;
  String employeeID;
  String employeeName;
  String departmentID;
  String position;
  String phoneNumber;
  String email;
  String facebook;
  String zalo;
  String address;
  String ward;
  String district;
  String city;
  String gender;
  String dateOfBirth;
  String dateOfJoining;
  String status;
  String description;
  String image;

  Employee({
    required this.rowID,
    required this.employeeID,
    required this.employeeName,
    required this.departmentID,
    required this.position,
    required this.phoneNumber,
    required this.email,
    required this.facebook,
    required this.zalo,
    required this.address,
    required this.ward,
    required this.district,
    required this.city,
    required this.gender,
    required this.dateOfBirth,
    required this.dateOfJoining,
    required this.status,
    required this.description,
    required this.image,
  });

  // Phương thức để tạo đối tượng từ JSON
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      rowID: json['RowID'],
      employeeID: json['EmployeeID'],
      employeeName: json['EmployeeName'],
      departmentID: json['DepartmentID'],
      position: json['Position'],
      phoneNumber: json['PhoneNumber'],
      email: json['Email'],
      facebook: json['Facebook'],
      zalo: json['Zalo'],
      address: json['Address'],
      ward: json['Ward'],
      district: json['District'],
      city: json['City'],
      gender: json['Gender'],
      dateOfBirth: json['DateOfBirth'],
      dateOfJoining: json['DateOfJoining'],
      status: json['Status'],
      description: json['Description'],
      image: json['Image'],
    );
  }

  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowID': rowID,
      'EmployeeID': employeeID,
      'EmployeeName': employeeName,
      'DepartmentID': departmentID,
      'Position': position,
      'PhoneNumber': phoneNumber,
      'Email': email,
      'Facebook': facebook,
      'Zalo': zalo,
      'Address': address,
      'Ward': ward,
      'District': district,
      'City': city,
      'Gender': gender,
      'DateOfBirth': dateOfBirth,
      'DateOfJoining': dateOfJoining,
      'Status': status,
      'Description': description,
      'Image': image,
    };
  }
}