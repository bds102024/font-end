class UserSetup {
  String rowID;
  String user;
  String password;
  String employeeID;
  String status;
  String description;

  UserSetup({
    required this.rowID,
    required this.user,
    required this.password,
    required this.employeeID,
    required this.status,
    required this.description,
  });

  // Phương thức để tạo đối tượng từ JSON
  factory UserSetup.fromJson(Map<String, dynamic> json) {
    return UserSetup(
      rowID: json['RowID'],
      user: json['User'],
      password: json['Password'],
      employeeID: json['EmployeeID'],
      status: json['Status'],
      description: json['Description'],
    );
  }

  // Phương thức để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'RowID': rowID,
      'User': user,
      'Password': password,
      'EmployeeID': employeeID,
      'Status': status,
      'Description': description,
    };
  }
}